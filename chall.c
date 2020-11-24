#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// Ubuntu 20.04
// gcc chall.c -o chall -fno-stack-protector -z execstack -no-pie

void shell(){
    system("/bin/sh");
}

int main(){
        char buf[8];
        unsigned int x;

        gets(buf);

        if (x == 0xdeadbeef) {
            shell();
        }

        return 0;
}
