#include <cstdlib>
#include <unistd.h>
#include <string>
#include <cstring>
#include <cassert>
#include <cstdio>

using namespace std;

string e(const char *s) {
    string res;
    for (size_t i = 0, l = strlen(s); i < l; ++i) {
        if(s[i] == '\'') res += "'\\''";
        else res.push_back(s[i]);
    }
    return res;
}

uint32_t id(const char *s) {
    FILE *p = popen(s, "r");
    assert(p);
    char ch;
    uint32_t i = 0;
    do {
        ch = fgetc(p);
        if (ch >= '0' && ch <= '9') i = i * 10 + (ch - '0');
    } while(ch != EOF);
    pclose(p);
    assert(i != 0);
    return i;
}

int main(int argc, const char *argv[]) {
    string s;
    for (int i = 1; i < argc; ++i) {
        s.push_back('\'');
        s += e(argv[i]);
        s.push_back('\'');
        if (i + 1 < argc) s.push_back(' ');
    }
    uint32_t torify_gid = id("id -g torify");
    setgid(torify_gid);
    setuid(getuid());
    if (getgid() == torify_gid)
        return system(s.c_str());
    else
        printf("setgid_torify: failed to setgid\n");
    return 1;
}
