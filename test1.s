.data
	print_format:
		.string "sum = %d \n"
    print_format_even:
		.string "%d - even number \n"
         print_format_odd:
		.string "%d - odd number \n"
    print_format1:
		.string "%d -> "
	array:
		.long 20,134,6,28,126,16,31,100,240,66,20,55
	array_end:
	.global main
	.text
.type main, @function
main:
	movl $0,%edx
	movl $array, %ebx
    movl $0,%ecx
	movl (%ebx), %eax
	
	loop_start:
        
        pushl %edx # сохраняем значение //
        pushl %eax #  выводим значение
        pushl $print_format1 # вид вывода
        call printf #  выводим 
        addl $12, %esp #  уравниваем стек 
        movl -4(%esp),%edx #  возвращаем значение  едх
        movl -8(%esp),%eax #  возвращаем значениееах
		orl $16, %eax #  удля операции 5 бит в 0 
		xorl $16, %eax #  тоже для того же 
        addl %eax ,%edx  #  сумма 

        pushl %edx #  для сохранности
        pushl %eax #  для вывода  нового значнеия 
        pushl $print_format_even
        call printf 
        
        addl $12, %esp #  для уравнивания 
        movl -4(%esp),%edx #  забираем значение 
		
		movl %ebx,%ecx #  для проверки  
		addl $4,%ecx	#  на 
        cmpl $array_end, %ecx #  нечётное кол во значений 
		je loop_end #  выход 
		
        movl 4(%ebx),%eax #  новое (нечёт)значение 
        pushl %edx #  для сохранности 
        pushl %eax #  для вывода 
        pushl $print_format1
        call printf
        addl $12, %esp 
        movl -4(%esp),%edx #  возвращаем  
        movl -8(%esp),%eax #  возврат 
        
		orl $10,%eax #  добавление 1 
        addl %eax,%edx #  сумма 
        pushl %edx  #  сохранность 
        
       
        pushl %eax #  вывод 
        pushl $print_format_odd
        call printf 
        addl $12, %esp #  уравнивание 
        movl -4(%esp),%edx # возврат 
		
		addl $8,%ebx #  переход на след числа 
		movl (%ebx),%eax #  передаём значения 
		cmpl $array_end, %ebx #  конец строки 
		jne loop_start
		
	loop_end:
	pushl %edx #  вывод суммы 
	pushl $print_format
	call printf 
	addl $8, %esp
	movl $0, %ebx
	movl $0, %edx
	movl $0, %ecx
	ret 
	
	