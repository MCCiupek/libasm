#ifndef LIBASM_H
# define LIBASM_H

#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>

ssize_t		ft_strlen(const char *c);
char		*ft_strcpy(const char *dst, const char *src);
int		ft_strcmp(const char *s1, const char *s2);
ssize_t		ft_write(int fd, const void *s, size_t nbyte);
ssize_t		ft_read(int fd, void *buf, size_t count);
char		*ft_strdup(const char *str);

#endif
