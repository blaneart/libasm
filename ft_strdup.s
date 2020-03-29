; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strdup.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ablanar <ablanar@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/01/03 17:31:49 by ablanar           #+#    #+#              ;
;    Updated: 2020/01/05 19:44:41 by ablanar          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global _ft_strdup
section .text
extern _malloc
extern _ft_strlen
extern _ft_strcpy

_ft_strdup:
	push	rbp						;	save base pointer on the stack
	mov 	rbp, rsp				; 	change base pointer to the stack pointer
	mov 	r15, rdi				;	copy string to another register
	call 	_ft_strlen				;	count the length of string
	mov 	rdi, rax				;	put length of the string to the first arg reg
	inc 	rdi						;	pass to malloc strlen + 1
	mov 	r14, rdi				;	save the length of the string
	call 	_malloc					;	returns pointer to memory in rax
	mov 	rdi, rax				;	pass the pointer to fisrt arg
	mov 	rsi, r15				;	pass the pointer of the string to copy
	call 	_ft_strcpy				;	copy the string to the allocated memory
	mov 	byte [rax + r14],0x00	;	null terminate the string
	leave							;	restore the previous stackbase-pointer register
	ret
