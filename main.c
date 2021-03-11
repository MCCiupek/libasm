/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mciupek <mciupek@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/10 12:25:14 by mciupek           #+#    #+#             */
/*   Updated: 2021/03/10 16:16:37 by mciupek          ###   ########.fr       */
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
        d = ft_strlen2(s);
        printf("2.1) my ft_strlen2 function output is: %lu\n", d);
        return ;
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

int	main(int argc, char **argv)
{
	(void)argc;
	
	printf("-------------- FT_STRLEN ---------------\n");
	ft_strlen_test(argv[1]);
	ft_strlen_test(argv[2]);
	//ft_strlen_test(NULL);
	printf("----------------------------------------\n");

	printf("-------------- FT_STRCMP ---------------\n");
	ft_strcmp_test(argv[1], argv[2]);
	printf("----------------------------------------\n");
	
	return (0);
}
