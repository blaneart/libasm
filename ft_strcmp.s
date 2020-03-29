; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcmp.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ablanar <ablanar@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/01/02 22:21:05 by ablanar           #+#    #+#              ;
;    Updated: 2020/01/05 18:55:41 by ablanar          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global _ft_strcmp
section .text
extern _ft_strlen
_ft_strcmp:
	push	rbp			;	save base pointer on the stack
	mov		rbp, rsp	;	move stack pointer to base
cmps:
	mov		r8,[rdi]	;	set r8 to the value of the char of the s1
	cmp		r8,[rsi]	;	compare it with the first char of the s2;
	jne		diff		;	if it is greater go to greater label
	cmp		r8,0		;	compare it with '\0'
	je		equal		;	if it is equal to '\0' jump to equal label
	inc		rdi			;	move to the next char of the s1
	inc		rsi			;	move to the next char of the s2
	jmp		cmps		;	repeat cycle
diff:
	mov		bx,[rdi]	;	move char from first string to register bx
	mov		dx,[rsi]	;	move char from second string to register dx
	sub		bx,dx		;	subtruct one char from another
	movsx	rax,bx		;	set return value to the 1
	jmp		label		;	jump to exit
equal:
	mov		rax,0		;	set return value to the 0
	jmp		label		;	jump to exit
label:
	leave				;	restore the previous stackbase-pointer register
	ret
