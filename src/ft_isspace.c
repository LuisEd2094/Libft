int ft_isspace(char chr)
{
    if (chr== '\f' || chr== '\n' \
		|| chr== '\r' || chr== '\t' \
		|| chr== '\t' || chr== ' ')
    {
        return (1);
    }
    return (0);
}