# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ablanar <ablanar@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/04 18:27:33 by ablanar           #+#    #+#              #
#    Updated: 2020/01/06 13:25:27 by ablanar          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.PHONY: all clean fclean re

NAME =	libasm.a

SRC = ft_read.s ft_write.s ft_strcmp.s ft_strcpy.s ft_strdup.s ft_strlen.s

OBJ = $(SRC:.s=.o)

NASM = nasm -f macho64

all: $(NAME)

.s.o:
	$(NASM) $< -o $(<:.s=.o)

$(NAME):	$(OBJ)
	ar rc $(NAME) $(OBJ)

clean:
	rm -f *.o
fclean:	clean
		rm -f $(NAME)
re:		fclean all
