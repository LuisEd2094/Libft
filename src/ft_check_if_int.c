int	ft_isdigit(int c)
{
	if (c >= '0' && c <= '9')
		return (1);
	return (0);
}

int	get_sign(int *k, char *argv)
{
	int	sign;
	int	i;

	i = (*k);
	sign = 0;
	if ((argv[i] == '-' || argv[i] == '+') && ft_isdigit(argv[i + 1]))
	{
		if (argv[i] == '-' )
			sign = -1;
		else if (argv[i] == '+')
			sign = 1;
		(*k)++;
	}
	else
		sign = 0;
	return (sign);
}

int	check_if_valid_num(char *str)
{
	int	i;
	int	sign;

	i = 0;
	sign = get_sign(&i, str);
	while (str[i])
	{
		if ((sign && i == 10) || (!sign && i == 9))
			return (check_last_digit(sign, str, i));
		if (!ft_isdigit(str[i]))
			return (0);
		i++;
	}
	return (1);
}