# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lsoto-do <lsoto-do@student.42barcel>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/17 12:40:36 by lsoto-do          #+#    #+#              #
#    Updated: 2023/05/10 17:43:32 by lsoto-do         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	libft.a
INCLUDES	=	../include
SRCS_DIR	=	src/
OBJS_DIR	=	obj/
CFLAGS		=	-Wall -Werror -Wextra -I
RM			=	rm -f
AR			=	ar rcs


#Colors

DEF_COLOR = \033[0;39m
GRAY = \033[0;90m
RED = \033[0;91m
GREEN = \033[0;92m
YELLOW = \033[0;93m
BLUE = \033[0;94m
MAGENTA = \033[0;95m
CYAN = \033[0;96m
WHITE = \033[0;97m

###

FILES		=	ft_atoi.c ft_isalpha.c ft_itoa.c ft_lstdelone.c ft_lstnew.c \
				ft_memcpy.c ft_putendl_fd.c ft_strchr.c ft_strjoin.c \
				ft_strmapi.c ft_strtrim.c ft_bzero.c ft_isascii.c \
				ft_lstadd_back.c ft_lstiter.c ft_lstsize.c ft_memmove.c \
				ft_putnbr_fd.c ft_strcmp.c ft_strlcat.c ft_strncmp.c \
				ft_substr.c ft_calloc.c ft_isdigit.c ft_lstadd_front.c \
				ft_lstlast.c ft_memchr.c ft_memset.c ft_putstr_fd.c \
				ft_strdup.c ft_strlcpy.c ft_strnstr.c ft_tolower.c \
				ft_isalnum.c ft_isprint.c ft_lstclear.c ft_lstmap.c \
				ft_memcmp.c ft_putchar_fd.c ft_split.c ft_striteri.c ft_strlen.c\
				ft_strrchr.c ft_toupper.c



SRCS 		= 	$(addprefix $(SRCS_DIR),$(FILES))
OBJS		=	$(addprefix $(OBJS_DIR),$(FILES:.c=.o))

###

OBJSF		= .cache_exists

all:		$(NAME)

$(NAME):	$(OBJS)
			$(AR) $(NAME) $(OBJS)
			ranlib $(NAME)
#			@echo "$(GREEN)Libft compiled! $(DEF_COLOR)"

$(OBJS_DIR)%.o : $(SRCS_DIR)%.c includes/libft.h | $(OBJSF)
#			@echo "$(CYAN)Compiling $< $(DEF_COLOR)"
			$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

$(OBJSF):
			@mkdir -p $(OBJS_DIR)

clean:
		@$(RM) -rf $(OBJS_DIR)
		@$(RM) -r $(OBJSF)
#		@echo "$(GREEN)Libft objects files cleaned!$(DEF_COLOR)"

fclean:	clean
		@$(RM) -f $(NAME)
#		@echo "$(GREEN)Libft executable files cleaned!$(DEF_COLOR)"

re:		fclean all
#		@echo "$(GREEN)Cleaned and rebuilt everything!$(DEF_COLOR)"

norm:
		@norminette $(SRCS) $(INCLUDES)

.PHONY:		all clean fclean re norm
