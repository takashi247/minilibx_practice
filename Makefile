NAME		:= minilibx_practice

CC			:= gcc

CFLAGS		:= -Wall -Wextra -Werror

SRCS		:= main.c

OBJS		:= $(SRCS:.c=.o)

ifeq ($(shell uname),Linux)
INCLUDE		:= -Imlx_linux

LIBRARY		:= -Lmlx_linux -lmlx_linux -lXext -lX11 -lm -lz
else
INCLUDE		:= -Imlx_linux -I/usr/X11/include -I/usr/X11R6/include

LIBRARY		:= -L/usr/X11R6/lib -Lmlx_linux -lmlx -lX11 -lXext -framework OpenGL -framework AppKit
endif

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