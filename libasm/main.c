#include <stdio.h>
#include <string.h>
//#include "libasm.a"
//#include "asm.h"
extern size_t ft_strlen(const char *str);
extern int ft_strcmp(const char *s1, const char *s2);

int main(int argc, char **argv) {

    //ft_strlen
    /*int i = 1;
    while (i < argc)
    {
        printf("Length of str %d, %s:  %ld\n", i, argv[i], ft_strlen(argv[i]));
        i++;
    } */

    //ft_strcmp
    int i = 1;
    if (argc < 3)
        return 0;
    while (i < argc - 1)
    {
        printf("Comparing strs %s, %s: %d\n", argv[i], argv[i + 1], ft_strcmp(argv[i], argv[i + 1]));
        printf("Comparing strs %s, %s: %d\n", argv[i], argv[i + 1], strcmp(argv[i], argv[i + 1]));
        i++;
    } 

    return 0;
}
