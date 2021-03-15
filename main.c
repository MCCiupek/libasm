/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mciupek <mciupek@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/10 12:25:14 by mciupek           #+#    #+#             */
/*   Updated: 2021/03/15 16:52:34 by mciupek          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

void	ft_strlen_test(const char *s)
{
        size_t  d;

        d = strlen(s);
        printf("- The input string is : '%s'\n", s);
        printf("1) lib.c strlen function output is: %lu\n", d);
        d = ft_strlen(s);
        printf("2.0) my ft_strlen function output is: %lu\n", d);
        return ;
}

void            ft_strcpy_test(const char *s1, char *s2)
{
        printf("- The src string is : '%s'\n", s1);
        printf("- The dest string is : '%s'\n", s2);
        //strcpy(s2, s1);
        printf("1) lib.c strcpy function output is: %s\n", strcpy(s2, s1));
        //d = ft_strcmp(s1, s2);
        printf("2) my ft_strcpy function output is: %s\n", ft_strcpy(s2, s1));
}


void            ft_strcmp_test(const char *s1, const char *s2)
{
        int d;

        printf("- The input string 1 is : '%s'\n", s1);
        printf("- The input string 2 is : '%s'\n", s2);
        d = strcmp(s1, s2);
        printf("1) lib.c strcmp function output is: %d\n", d);
 	d = ft_strcmp(s1, s2);
        printf("2) my ft_strcmp function output is: %d\n", d);
}  

/*void            ft_write_test(const char *s1, const char *s2)
{
        printf("- The input string 1 is : '%s'\n", s1);
        printf("- The input string 2 is : '%s'\n", s2);
        printf("1) lib.c write function output is:\n");
        write(1, s1, strlen(s1));
        write(1, &"\n", 1);
        printf("2) my write function output is:\n");
        ft_write(1, s1, strlen(s1));
        ft_write(1, &"\n", 1);
}*/

void    ft_write_test(int fildes, const void *buf, size_t nbyte)
{
        size_t d;

        printf("(fd = %u | ", fildes);
        printf("buffer = '%s' | ", buf);
        printf("nbyte = %zu)\n", nbyte);
        printf("1) lib.c write function output is:\n");
        errno = 0;
        d = write(fildes, buf, nbyte);
        printf("\nreturn = %d | errno : %d\n", (int)d, errno);
        printf("2) my ft_write function output is:\n");
        errno = 0;
        d = ft_write(fildes, buf, nbyte);
        printf("\nreturn = %d | errno : %d\n", (int)d, errno);
        return ;
}

void    ft_read_test(char *file, size_t nbyte)
{
        size_t  d;
        int             fd;
        char    b1[300];
        char    b2[300];
        int             i;

        i = 0;
        while (i < 300)
                b1[i++] = 0;
        i = 0;
        while (i < 300)
                b2[i++] = 0;
        if (!(fd = open(file, O_RDONLY)))
                return ;
        printf("1) lib.c read function output is:\n");
        errno = 0;
        d = read(fd, &b1, nbyte);
        printf("%s", b1);
        printf("\nreturn = %d | errno : %d\n", (int)d, errno);
        close(fd);
        if (!(fd = open(file, O_RDONLY)))
                return ;
        printf("2) my ft_read function output is:\n");
        errno = 0;
        d = ft_read(fd, &b2, nbyte);
        printf("%s", b2);
        printf("\nreturn = %d | errno : %d\n", (int)d, errno);
        close(fd);
        return ;
}

void            ft_strdup_test(const char *s)
{
        char            *dst;
        char            *dst2;

        printf("src string is : %s\n", s);
        printf("1) lib.c strdup function output is:\n");
        errno = 0;
        dst = strdup(s);
        printf("%s | errno : %d\n", dst, errno);
        errno = 0;
        dst2 = ft_strdup(s);
        printf("2) my ft_strdup function output is:\n");
        printf("%s | errno : %d\n", dst2, errno);
        if (dst)
		free(dst);
        if (dst2)
		free(dst2);
}

int	main(int argc, char **argv)
{
	(void)argc;
	char	d[300];
	char	null[300];

	null[0] = 0;
	printf("-------------- FT_STRLEN ---------------\n");
	ft_strlen_test(argv[1]);
	ft_strlen_test(argv[2]);
	ft_strlen_test(null);
	printf("----------------------------------------\n");

	printf("-------------- FT_STRCPY ---------------\n");
        printf("regular string\n");
        ft_strcpy_test(argv[1], d);
        ft_strcpy_test("salut les copains", d);
        printf("the string is empty, first char = '\\0'\n");
        ft_strcpy_test(null, d);
	printf("----------------------------------------\n");

	printf("-------------- FT_STRCMP ---------------\n");
	ft_strcmp_test(argv[1], argv[2]);
	printf("equals strings\n");
        ft_strcmp_test("salut les copains","salut les copains");
        printf("first string shorter\n");
        ft_strcmp_test("salut les","salut les copains");
        printf("second string shorter\n");
        ft_strcmp_test("salut les","sal");
        printf("differents strings\n");
        ft_strcmp_test("salut les bogoss","salut les mitos");
        printf("first string is '\\0'\n");
        ft_strcmp_test(null,"salut les mitos");
        printf("second string is '\\0'\n");
        ft_strcmp_test("salut les mitos",null);
        printf("both strings are '\\0'\n");
        ft_strcmp_test(null, null);
	printf("----------------------------------------\n");
	ft_strcmp_test("Hello", "Hello");
	ft_strcmp_test("Hello!", "Hello");
	ft_strcmp_test("Hello", "Hello!");
	ft_strcmp_test("He!!o", "Hello");
	ft_strcmp_test("Hello", "He!!o");

	ft_strcmp_test("Hello\tHi", "Hello\tHi");
	ft_strcmp_test("Hello\200Hi", "Hello\0Hi");
	ft_strcmp_test("Hello\0Hi", "Hello\200Hi");
	ft_strcmp_test("Hello\200Hi", "Hello\200Hi");
	ft_strcmp_test("Hello\0Hi", "Hello\0Hi");

	ft_strcmp_test("This string is longer", "This string is longer");
	ft_strcmp_test("You might pass all these tests", "Or not");
	ft_strcmp_test("or not", "Or not");
	ft_strcmp_test("or noT", "or not");
	printf("----------------------------------------\n");

	printf("-------------- FT_WRITE ---------------\n");
        printf("regular std out\n");
	ft_write_test(1, argv[1], ft_strlen(argv[1]));
	ft_write_test(1, argv[2], ft_strlen(argv[2]));
        ft_write_test(1, "std error first write test", 27);
        printf("error std out\n");
        ft_write_test(2, "second write test with sdtout", 30);
        printf("negative len\n");
        ft_write_test(1, "len neg", -10);
        printf("negative file descriptor\n");
        ft_write_test(-1, "fd neg", 10);
        printf("NULL String\n");
        ft_write_test(1, NULL, 10);
	printf("----------------------------------------\n");

	printf("-------------- FT_READ ---------------\n");
        printf("len > filesize\n");
        ft_read_test("read.txt", 300);
        printf("len < filesize\n");
        ft_read_test("read.txt", 30);
        printf("len < 0\n");
        ft_read_test("read.txt", -300);
        printf("no reading rights\n");
        ft_read_test("norights.txt", 300);
        printf("NULL string\n");
        ft_read_test(NULL, 300);
	printf("----------------------------------------\n");

        printf("------------- FT_STRDUP ----------------\n");
        printf("regular string\n");
        ft_strdup_test("I'm testing my ft_strdup");
        printf("empty string\n");
        ft_strdup_test(null);
	printf("----------------------------------------\n");

	return (0);
}
