#ifndef BISON_VAR_TAB_H
# define BISON_VAR_TAB_H

# ifndef YYSTYPE
#  define YYSTYPE int
#  define YYSTYPE_IS_TRIVIAL 1
# endif
# define	tk_DELIMITADOR	257
# define	tk_if	258
# define	tk_else	259
# define	tk_switch	260
# define	tk_case	261
# define	tk_string	262
# define	numero	263
# define	tk_real	264
# define	tk_int	265
# define	tk_float	266
# define	tk_double	267
# define	tk_char	268
# define	tk_bool	269
# define	tk_object	270
# define	id	271
# define	tk_JUNTAR	272
# define	tk_SEPARAR	273
# define	tk_AUMENTAR	274
# define	tk_DISMINUIR	275
# define	tk_DISMUNUIR	276
# define	tk_IGUAL	277
# define	tk_DIFERENTE	278
# define	tk_CONJUNTO	279
# define	tk_ORQUESTA	280
# define	tk_MAS_ALTO_QUE	281
# define	tk_MAS_BAJO_QUE	282
# define	tk_ALTO_O_IGUAL_A	283
# define	tk_BAJO_O_IGUAL_A	284
# define	tk_main	285


extern YYSTYPE yylval;

#endif /* not BISON_VAR_TAB_H */
