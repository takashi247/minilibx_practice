#ifndef MINILIBX_PRACTICE_H
# define MINILIBX_PRACTICE_H

typedef struct s_screen
{
	void	*img;
	char	*addr;
	int		bpp;
	int		line_length;
	int		endian;
}	t_screen;

#endif
