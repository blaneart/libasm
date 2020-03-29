; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_read.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ablanar <ablanar@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/01/03 17:05:06 by ablanar           #+#    #+#              ;
;    Updated: 2020/01/05 19:46:51 by ablanar          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global _ft_read

_ft_read:
	push	rbp				;	save base pointer on the stack
	mov		rbp, rsp		;	move stack pointer to base
	mov		rax, 0x2000003	;	set rax to the read function
	syscall					;	call of this function
	jc 		err				;	if the flag of the error is up go to err label
	leave
	ret
err:
	mov		rax,-1			;	set return value to -1
	leave					;	restore the previous stackbase-pointer register
	ret
