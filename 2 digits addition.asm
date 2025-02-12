ORG 100h         
; Display the message "Enter the first digit: "
MOV DX, OFFSET msg_input1 
MOV AH, 09h       
INT 21h            
; Read the first digit from the user
MOV AH, 01h       
INT 21h            
SUB AL, '0'        ; Convert ASCII to integer
MOV BL, AL         ; Store the first digit in BL
; Display the message "Enter the second digit: "
MOV DX, OFFSET msg_input2 
MOV AH, 09h        
INT 21h          
; Read the second digit from the user
MOV AH, 01h        
INT 21h           
SUB AL, '0'        ; Convert ASCII to integer
MOV CL, AL         ; Store the second digit in CL
; Perform addition
ADD BL, CL         ; Add the two digits, result in BL
; Convert the result back to ASCII
ADD BL, '0'        ; Convert the sum to ASCII
; Display the message "The result of addition is: "
MOV DX, OFFSET msg_output  
MOV AH, 09h       
INT 21h            
; Print the result
MOV DL, BL        
MOV AH, 02h       
INT 21h            
; Print a new line (CRLF)
MOV DL, 0Dh        
MOV AH, 02h
INT 21h           
MOV DL, 0Ah        
INT 21h            
; Terminate the program
MOV AH, 4Ch        
INT 21h          
; Data section with messages
msg_input1  DB 'Enter the first digit: $'
msg_input2  DB 0Dh, 0Ah, 'Enter the second digit: $'
msg_output  DB 0Dh, 0Ah, 'The result of addition is: $'
END