; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ablanar <ablanar@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/01/02 21:43:26 by ablanar           #+#    #+#              ;
;    Updated: 2020/01/05 19:44:58 by ablanar          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global _ft_strcpy
section .text

_ft_strcpy:
	push	rbp				;
	mov		rbp, rsp
	mov rax, -1				;	setting rax to -1
cpy:
	inc rax					;	incrementing rax by 1 to start from 0
	mov r15b, [rsi + rax]	;	set r15b to the value of the first byte of src
	mov [rdi + rax], r15b	;	set first byte of the dest to the r15b
	cmp byte [rsi + rax],0	;	check this char with '\0'
	jne cpy					;	if not equal jump to the beginning of the cycle
	mov rax, rdi			;	set return value to the pointer of the dst
	leave					;	restore the previous stackbase-pointer register
	ret
