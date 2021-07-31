NAME		:= minilibx_practice

CC			:= gcc

CFLAGS		:= -Wall -Wextra -Werror

# Use ?= to set SRCS as main.c if it is not specified by command-line arguments
SRCS		?= main.c

OBJS		:= $(SRCS:.c=.o)

MLXDIR		:= ./mlx/
MLXGITPATH	:= https://github.com/42Paris/minilibx-linux.git

ifeq ($(shell uname),Linux)
INCLUDE		:= -I$(MLXDIR) -I./include

LIBRARY		:= -L$(MLXDIR) -lmlx_linux -lXext -lX11 -lm -lz
else
INCLUDE		:= -I$(MLXDIR) -I/usr/X11/include -I/usr/X11R6/include -I./include

LIBRARY		:= -L/usr/X11R6/lib -L$(MLXDIR) -lmlx -lX11 -lXext -framework OpenGL -framework AppKit
endif

RM			:= rm -f

all:		mlx_clone $(NAME)

$(NAME):	$(OBJS)
	$(CC) $(CFLAGS) $(INCLUDE) $^ $(LIBRARY) -o $@

.c.o:
	$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

mlx_clone:
	if [ ! -d "$(MLXDIR)" ]; then \
		git clone $(MLXGITPATH) $(MLXDIR); \
		$(MAKE) -C mlx/; \
	fi;

clean:
	$(RM) $(OBJS)

mlx_clean:
	$(RM) -r $(MLXDIR)

fclean:		clean
	$(RM) $(NAME)

re:			fclean all

.PHONY:		all clean fclean re mlx_clone mlx_clean