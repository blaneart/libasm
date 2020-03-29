/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ablanar <ablanar@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/01/02 16:06:22 by ablanar           #+#    #+#             */
/*   Updated: 2020/01/05 20:09:38 by ablanar          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

void	ft_test_strlen(void)
{
	printf("ft_strlen of \"\" = %lu\n", ft_strlen(""));
	printf("ft_strlen of \"1\" = %lu\n", ft_strlen("1"));
	printf("ft_strlen of \"123456789\" = %lu\n\n\n", ft_strlen("123456789"));
}

void	ft_test_strcpy(void)
{
	char		str2[10];
	char		str1[10];
	const char	*q;
	char		*p;

	memset(str2, 'a', 10);
	str2[9] = '\0';
	memset(str1, 'z', 10);
	str1[9] = '\0';
	p = str1;
	q = str2;
	printf("Destination:%s\nSource:%s\n", p, q);
	printf("After copy:\nResult of copy:%s\n", ft_strcpy(p, q));
	printf("Destination:%s\nSource:%s\n\n", p, q);
	str2[0] = '\0';
	q = str2;
	printf("Destination:%s\nSource:%s\n", p, q);
	printf("After copy:\nResult of copy:%s\n", ft_strcpy(p, q));
	printf("Destination:%s\nSource:%s\n\n\n", p, q);
}

void	ft_test_strcmp(void)
{
	printf("Result of ft_strcmp(%s, %s):%d\n", "0", "1", ft_strcmp("0", "1"));
	printf("Result of ft_strcmp(%s, %s):%d\n", "6", "0", ft_strcmp("6", "0"));
	printf("Result of ft_strcmp(%s, %s):%d\n", "1", "1", ft_strcmp("1", "1"));
	printf("Result of ft_strcmp(%s, %s):%d\n", "\200", "\0",
												ft_strcmp("\200", "\0"));
	printf("Result of ft_strcmp(%s, %s):%d\n", "\0", "\200",
												ft_strcmp("\0", "\200"));
	printf("Result of ft_strcmp(%s, %s):%d\n\n\n", "z", "\0",
												ft_strcmp("z", "\0"));
}

int		main(void)
{
	int		fd;
	char	*p;
	char	buf[5];

	ft_test_strlen();
	ft_test_strcpy();
	ft_test_strcmp();
	fd = open("test", O_RDONLY | O_CREAT);
	printf("Number of bytes read: %zd\n", ft_read(fd, buf, 5));
	printf("\nNumber of bytes written: %d\n", ft_write(1, buf, 5));
	printf("If read non-existence: %zd\n", ft_read(100, buf, 5));
	printf("If write non-existence: %d\n", ft_write(100, buf, 5));
	close(fd);
	fd = open("test2", O_WRONLY | O_CREAT);
	printf("Write into new file: %d\n", ft_write(fd, "Hello!", 5));
	close(fd);
	p = ft_strdup("ABCDEF");
	printf("String copied with ft_strdup:%s", p);
	free(p);
	return (0);
}
