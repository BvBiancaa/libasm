#include <stdio.h>
#include <sys/types.h>
#ifndef ASM_H
#define ASM_H

int ft_strlen(const char *str);
void ft_strcpy(char *dest, const char *src);
int ft_strcmp(const char *str1, const char *str2);
void ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);
char *ft_strdup(const char *s);

#endif
