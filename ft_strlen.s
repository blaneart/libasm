; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strlen.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ablanar <ablanar@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/01/02 20:48:51 by ablanar           #+#    #+#              ;
;    Updated: 2020/01/05 20:13:18 by ablanar          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global _ft_strlen
section .text

_ft_strlen:
	push	rbp							;	save base pointer on the stack
	mov		rbp, rsp					;	move stack pointer to base
	mov 	rax,-1						;	set rax to -1
	lb1:
		inc rax							;	increment rax by 1
		cmp byte [rdi + rax], 0x00		;	compare char with 0
		jne lb1							;	if not equal repeat cycle
	leave								;	restore the previous stackbase-pointer register
	ret
