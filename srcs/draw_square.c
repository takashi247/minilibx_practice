#include "mlx.h"
#include "minilibx_practice.h"

void
	mlx_pixel_put_screen(t_screen *screen, int x, int y, int color)
{
	char	*dst;

	dst = screen->addr + (y * screen->line_length + x * (screen->bpp / 8));
	*(unsigned int*)dst = color;
}

int
	main(void)
{
	void		*mlx;
	void		*mlx_win;
	static int	width = 500;
	static int	height = 500;
	t_screen	screen;
	int			col;
	int			row;
	const int	c_start = 100;
	const int	c_end = 400;
	const int	r_start = 100;
	const int	r_end = 400;

	mlx = mlx_init();
	if (!mlx)
		return (1);
	mlx_win = mlx_new_window(mlx, width, height, "Hellow world!");
	if (!mlx_win)
		return (1);
	screen.img = mlx_new_image(mlx, width, height);
	if (!screen.img)
		return (1);
	screen.addr = mlx_get_data_addr(screen.img, &screen.bpp, &screen.line_length, &screen.endian);
	col = c_start;
	while (col < c_end)
	{
		row = r_start;
		while (row < r_end)
		{
			if (col == c_start || col == c_end - 1)
				mlx_pixel_put_screen(&screen, col, row, 0x000000FF);
			else if (row == r_start || row == r_end - 1)
				mlx_pixel_put_screen(&screen, col, row, 0x000000FF);
			row++;
		}
		col++;
	}
	mlx_put_image_to_window(mlx, mlx_win, screen.img, 0, 0);
	mlx_loop(mlx);
}
