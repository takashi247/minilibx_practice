#include "mlx.h"

int
	main(void)
{
	void		*mlx;
	void		*mlx_win;
	static int	width = 500;
	static int	height = 500;
	int			i;
	int			j;

	mlx = mlx_init();
	if (!mlx)
		return (1);
	mlx_win = mlx_new_window(mlx, width, height, "Hellow world!");
	if (!mlx_win)
		return (1);
	i = 0;
	while (i < width)
	{
		j = 0;
		while (j < height)
		{
			mlx_string_put(mlx, mlx_win, i, j, 127, "A");
			j += 10;
		}
		i += 10;
	}
	mlx_loop(mlx);
}
