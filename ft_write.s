; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_write.s                                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ablanar <ablanar@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/01/02 16:05:28 by ablanar           #+#    #+#              ;
;    Updated: 2020/01/05 18:56:01 by ablanar          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global _ft_write
section .text

_ft_write:
	push 	rbp				;	save base pointer on the stack
	mov		rbp,rsp			;	move stack pointer to base
	mov		rax,0x2000004	;	set rax to the write function
	syscall					;	call of this function
	jc		err				;	if the flag of the error is up go to err label
	leave					;	restore the previous stackbase-pointer register
	ret
err:
	mov rax,-1				;	set return value to -1
	leave					;	restore the previous stackbase-pointer register
	ret
