NAME		:= minilibx_practice

CC			:= gcc

# CFLAGS		:=
CFLAGS		:= -Wall -Wextra -Werror

SRCS		:= main.c

OBJS		:= $(SRCS:.c=.o)

INCLUDE		:= -Imlx_linux

LIBRARY		:= -Lmlx_linux -lmlx_linux -lXext -lX11 -lm -lz

RM			:= rm -f

all:		$(NAME)

$(NAME):	$(OBJS)
	$(CC) $(CFLAGS) $(INCLUDE) $^ $(LIBRARY) -o $@

.c.o:
	$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

clean:
	$(RM) $(OBJS)

fclean:		clean
	$(RM) $(NAME)

re:			fclean all

.PHONY:		all clean fclean re