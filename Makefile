# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mciupek <mciupek@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/10 12:09:44 by mciupek           #+#    #+#              #
#    Updated: 2021/03/11 14:32:33 by mciupek          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME =		libasm.a

SRCS =		ft_strlen.s \
		ft_strlen2.s \
		ft_strcpy.s \
		ft_strcmp.s \
		ft_write.s \
		hello_world.s

NA = 		nasm

CC =		clang

N_FLAGS =	-f elf64

C_FLAGS =	-Wall -Werror -Wextra

RM =		rm -f

OBJ =		$(SRCS:.s=.o)

all:		$(NAME)

%.o : %.s
		$(NA) $(N_FLAGS) $<

$(NAME):	$(OBJ)
		ar rc $(NAME) $(OBJ)
		ranlib $(NAME)

clean:
		$(RM) $(OBJ)
		$(RM) main.o
		$(RM) libasm

fclean:		clean
		$(RM) $(NAME)

re:		fclean all

test:		$(NAME)
		$(CC) $(C_FLAGS) -c main.c
		$(CC) $(C_FLAGS) main.o $(NAME) -o libasm

ret:		fclean test

.PHONY:		all, clean, fclean, re, test, ret
