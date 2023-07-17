#include "libft.h"

void    remove_white_space(char *argv)
{
    int i;
    int k;

    i = 0;
    while (ft_isspace(argv[i]))
        i++;
    if (i > 0)
    {
        k = 0;
        while (argv[i])
            argv[k++] = argv[i++];
        while (argv[k])
            argv[k++] = '\0';
    }
}