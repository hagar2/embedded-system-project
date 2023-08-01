
_main:

;MyProject.c,3 :: 		void main() {
;MyProject.c,4 :: 		adcon1 =7;
	MOVLW      7
	MOVWF      ADCON1+0
;MyProject.c,5 :: 		trisb=0, trisc=0 ,trisa=0;
	CLRF       TRISB+0
	CLRF       TRISC+0
	CLRF       TRISA+0
;MyProject.c,6 :: 		trisa.b3=trisa.b1=1;
	BSF        TRISA+0, 1
	BTFSC      TRISA+0, 1
	GOTO       L__main28
	BCF        TRISA+0, 3
	GOTO       L__main29
L__main28:
	BSF        TRISA+0, 3
L__main29:
;MyProject.c,7 :: 		portb=0,portc=0;
	CLRF       PORTB+0
	CLRF       PORTC+0
;MyProject.c,8 :: 		portb.b7=1;
	BSF        PORTB+0, 7
;MyProject.c,9 :: 		porta=255;
	MOVLW      255
	MOVWF      PORTA+0
;MyProject.c,11 :: 		while(1){
L_main0:
;MyProject.c,12 :: 		if (porta.B3 ){
	BTFSS      PORTA+0, 3
	GOTO       L_main2
;MyProject.c,13 :: 		portb=0;
	CLRF       PORTB+0
;MyProject.c,14 :: 		portb.b7=1;
	BSF        PORTB+0, 7
;MyProject.c,15 :: 		portb.b3=1;
	BSF        PORTB+0, 3
;MyProject.c,16 :: 		portb.b4=1;
	BSF        PORTB+0, 4
;MyProject.c,17 :: 		flag=0;
	CLRF       _flag+0
	CLRF       _flag+1
;MyProject.c,18 :: 		count(23);
	MOVLW      23
	MOVWF      FARG_count_x+0
	MOVLW      0
	MOVWF      FARG_count_x+1
	CALL       _count+0
;MyProject.c,19 :: 		portb=0;
	CLRF       PORTB+0
;MyProject.c,20 :: 		portb.b7=1;
	BSF        PORTB+0, 7
;MyProject.c,21 :: 		portb.b3=0;
	BCF        PORTB+0, 3
;MyProject.c,22 :: 		portb.b1=1;
	BSF        PORTB+0, 1
;MyProject.c,23 :: 		portb.b5=0;
	BCF        PORTB+0, 5
;MyProject.c,24 :: 		portb.b6=1;
	BSF        PORTB+0, 6
;MyProject.c,25 :: 		flag=1;
	MOVLW      1
	MOVWF      _flag+0
	MOVLW      0
	MOVWF      _flag+1
;MyProject.c,26 :: 		count(15);
	MOVLW      15
	MOVWF      FARG_count_x+0
	MOVLW      0
	MOVWF      FARG_count_x+1
	CALL       _count+0
;MyProject.c,27 :: 		portb=0;
	CLRF       PORTB+0
;MyProject.c,28 :: 		portb.b7=1;
	BSF        PORTB+0, 7
;MyProject.c,29 :: 		portb.b3=1;
	BSF        PORTB+0, 3
;MyProject.c,30 :: 		portb.b4=1;
	BSF        PORTB+0, 4
;MyProject.c,32 :: 		}
	GOTO       L_main3
L_main2:
;MyProject.c,34 :: 		porte.B0=1;
	BSF        PORTE+0, 0
;MyProject.c,35 :: 		portb.b7=0;
	BCF        PORTB+0, 7
;MyProject.c,36 :: 		if (!porta.b1){
	BTFSC      PORTA+0, 1
	GOTO       L_main4
;MyProject.c,37 :: 		if(flag==1){
	MOVLW      0
	XORWF      _flag+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main30
	MOVLW      1
	XORWF      _flag+0, 0
L__main30:
	BTFSS      STATUS+0, 2
	GOTO       L_main5
;MyProject.c,38 :: 		portb.b1=0;
	BCF        PORTB+0, 1
;MyProject.c,39 :: 		portb.b2=0;
	BCF        PORTB+0, 2
;MyProject.c,40 :: 		portb.b3=1;
	BSF        PORTB+0, 3
;MyProject.c,41 :: 		portb.b4=0;
	BCF        PORTB+0, 4
;MyProject.c,42 :: 		portb.b5=1;
	BSF        PORTB+0, 5
;MyProject.c,43 :: 		portb.b6=0;
	BCF        PORTB+0, 6
;MyProject.c,44 :: 		portb.b7=1;
	BSF        PORTB+0, 7
;MyProject.c,45 :: 		porta.B0=0;
	BCF        PORTA+0, 0
;MyProject.c,46 :: 		for(count1=3;count1>=0;count1--){
	MOVLW      3
	MOVWF      _count1+0
	MOVLW      0
	MOVWF      _count1+1
L_main6:
	MOVLW      128
	XORWF      _count1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main31
	MOVLW      0
	SUBWF      _count1+0, 0
L__main31:
	BTFSS      STATUS+0, 0
	GOTO       L_main7
;MyProject.c,47 :: 		portc=(count1/10)*16+count1%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _count1+0, 0
	MOVWF      R0+0
	MOVF       _count1+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      4
	MOVWF      R2+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVF       R2+0, 0
L__main32:
	BTFSC      STATUS+0, 2
	GOTO       L__main33
	RLF        FLOC__main+0, 1
	RLF        FLOC__main+1, 1
	BCF        FLOC__main+0, 0
	ADDLW      255
	GOTO       L__main32
L__main33:
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _count1+0, 0
	MOVWF      R0+0
	MOVF       _count1+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDWF      FLOC__main+0, 0
	MOVWF      PORTC+0
;MyProject.c,48 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
	NOP
;MyProject.c,46 :: 		for(count1=3;count1>=0;count1--){
	MOVLW      1
	SUBWF      _count1+0, 1
	BTFSS      STATUS+0, 0
	DECF       _count1+1, 1
;MyProject.c,49 :: 		}           }
	GOTO       L_main6
L_main7:
L_main5:
;MyProject.c,50 :: 		portb.B1=1;
	BSF        PORTB+0, 1
;MyProject.c,51 :: 		portb.b2=0;
	BCF        PORTB+0, 2
;MyProject.c,52 :: 		portb.b3=0;
	BCF        PORTB+0, 3
;MyProject.c,53 :: 		portb.b4=0;
	BCF        PORTB+0, 4
;MyProject.c,54 :: 		portb.b5=0;
	BCF        PORTB+0, 5
;MyProject.c,55 :: 		portb.b6=1;
	BSF        PORTB+0, 6
;MyProject.c,56 :: 		porta.B0=0;
	BCF        PORTA+0, 0
;MyProject.c,57 :: 		portb.b7=0;
	BCF        PORTB+0, 7
;MyProject.c,59 :: 		flag=0;
	CLRF       _flag+0
	CLRF       _flag+1
;MyProject.c,61 :: 		}
	GOTO       L_main10
L_main4:
;MyProject.c,62 :: 		else if(porta.b1){
	BTFSS      PORTA+0, 1
	GOTO       L_main11
;MyProject.c,63 :: 		if (!flag){
	MOVF       _flag+0, 0
	IORWF      _flag+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main12
;MyProject.c,64 :: 		portb.B1=0;
	BCF        PORTB+0, 1
;MyProject.c,65 :: 		portb.b2=1;
	BSF        PORTB+0, 2
;MyProject.c,66 :: 		portb.b3=0;
	BCF        PORTB+0, 3
;MyProject.c,67 :: 		portb.b4=0;
	BCF        PORTB+0, 4
;MyProject.c,68 :: 		portb.b5=0;
	BCF        PORTB+0, 5
;MyProject.c,69 :: 		portb.b6=1;
	BSF        PORTB+0, 6
;MyProject.c,70 :: 		portb.b7=0;
	BCF        PORTB+0, 7
;MyProject.c,71 :: 		porta.B0=1;
	BSF        PORTA+0, 0
;MyProject.c,72 :: 		for(count1=3;count1>=0;count1--){
	MOVLW      3
	MOVWF      _count1+0
	MOVLW      0
	MOVWF      _count1+1
L_main13:
	MOVLW      128
	XORWF      _count1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main34
	MOVLW      0
	SUBWF      _count1+0, 0
L__main34:
	BTFSS      STATUS+0, 0
	GOTO       L_main14
;MyProject.c,73 :: 		portc=(count1/10)*16+count1%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _count1+0, 0
	MOVWF      R0+0
	MOVF       _count1+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      4
	MOVWF      R2+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVF       R2+0, 0
L__main35:
	BTFSC      STATUS+0, 2
	GOTO       L__main36
	RLF        FLOC__main+0, 1
	RLF        FLOC__main+1, 1
	BCF        FLOC__main+0, 0
	ADDLW      255
	GOTO       L__main35
L__main36:
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _count1+0, 0
	MOVWF      R0+0
	MOVF       _count1+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDWF      FLOC__main+0, 0
	MOVWF      PORTC+0
;MyProject.c,75 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	DECFSZ     R11+0, 1
	GOTO       L_main16
	NOP
	NOP
;MyProject.c,72 :: 		for(count1=3;count1>=0;count1--){
	MOVLW      1
	SUBWF      _count1+0, 1
	BTFSS      STATUS+0, 0
	DECF       _count1+1, 1
;MyProject.c,76 :: 		} }
	GOTO       L_main13
L_main14:
L_main12:
;MyProject.c,77 :: 		porta.B0=0;
	BCF        PORTA+0, 0
;MyProject.c,78 :: 		portb.b7=0;
	BCF        PORTB+0, 7
;MyProject.c,79 :: 		portb.B1=0;
	BCF        PORTB+0, 1
;MyProject.c,80 :: 		portb.b2=0;
	BCF        PORTB+0, 2
;MyProject.c,81 :: 		portb.b3=1;
	BSF        PORTB+0, 3
;MyProject.c,82 :: 		portb.b4=1;
	BSF        PORTB+0, 4
;MyProject.c,83 :: 		portb.b5=0;
	BCF        PORTB+0, 5
;MyProject.c,84 :: 		portb.b6=0;
	BCF        PORTB+0, 6
;MyProject.c,85 :: 		flag=1;
	MOVLW      1
	MOVWF      _flag+0
	MOVLW      0
	MOVWF      _flag+1
;MyProject.c,86 :: 		}
L_main11:
L_main10:
;MyProject.c,87 :: 		}
L_main3:
;MyProject.c,89 :: 		}
	GOTO       L_main0
;MyProject.c,91 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_count:

;MyProject.c,94 :: 		void count (int x){
;MyProject.c,95 :: 		for(count1=x;count1>=1;count1--){
	MOVF       FARG_count_x+0, 0
	MOVWF      _count1+0
	MOVF       FARG_count_x+1, 0
	MOVWF      _count1+1
L_count17:
	MOVLW      128
	XORWF      _count1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__count38
	MOVLW      1
	SUBWF      _count1+0, 0
L__count38:
	BTFSS      STATUS+0, 0
	GOTO       L_count18
;MyProject.c,96 :: 		porta.B0=1;
	BSF        PORTA+0, 0
;MyProject.c,97 :: 		portb.b7=1;
	BSF        PORTB+0, 7
;MyProject.c,98 :: 		if(porta.B3==0)return;
	BTFSC      PORTA+0, 3
	GOTO       L_count20
	GOTO       L_end_count
L_count20:
;MyProject.c,99 :: 		portc=(count1/10)*16+count1%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _count1+0, 0
	MOVWF      R0+0
	MOVF       _count1+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      4
	MOVWF      R2+0
	MOVF       R0+0, 0
	MOVWF      FLOC__count+0
	MOVF       R0+1, 0
	MOVWF      FLOC__count+1
	MOVF       R2+0, 0
L__count39:
	BTFSC      STATUS+0, 2
	GOTO       L__count40
	RLF        FLOC__count+0, 1
	RLF        FLOC__count+1, 1
	BCF        FLOC__count+0, 0
	ADDLW      255
	GOTO       L__count39
L__count40:
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _count1+0, 0
	MOVWF      R0+0
	MOVF       _count1+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDWF      FLOC__count+0, 0
	MOVWF      PORTC+0
;MyProject.c,101 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_count21:
	DECFSZ     R13+0, 1
	GOTO       L_count21
	DECFSZ     R12+0, 1
	GOTO       L_count21
	DECFSZ     R11+0, 1
	GOTO       L_count21
	NOP
	NOP
;MyProject.c,102 :: 		if(x==23){
	MOVLW      0
	XORWF      FARG_count_x+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__count41
	MOVLW      23
	XORWF      FARG_count_x+0, 0
L__count41:
	BTFSS      STATUS+0, 2
	GOTO       L_count22
;MyProject.c,103 :: 		if(count1==4){
	MOVLW      0
	XORWF      _count1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__count42
	MOVLW      4
	XORWF      _count1+0, 0
L__count42:
	BTFSS      STATUS+0, 2
	GOTO       L_count23
;MyProject.c,104 :: 		portb.b7=1;
	BSF        PORTB+0, 7
;MyProject.c,105 :: 		portb.b4=0;
	BCF        PORTB+0, 4
;MyProject.c,106 :: 		portb.b5=255;
	BSF        PORTB+0, 5
;MyProject.c,107 :: 		}
L_count23:
;MyProject.c,109 :: 		}
	GOTO       L_count24
L_count22:
;MyProject.c,110 :: 		else if (x==15){
	MOVLW      0
	XORWF      FARG_count_x+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__count43
	MOVLW      15
	XORWF      FARG_count_x+0, 0
L__count43:
	BTFSS      STATUS+0, 2
	GOTO       L_count25
;MyProject.c,111 :: 		if(count1==4){
	MOVLW      0
	XORWF      _count1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__count44
	MOVLW      4
	XORWF      _count1+0, 0
L__count44:
	BTFSS      STATUS+0, 2
	GOTO       L_count26
;MyProject.c,112 :: 		portb.b7=1;
	BSF        PORTB+0, 7
;MyProject.c,113 :: 		portb.b1=0;
	BCF        PORTB+0, 1
;MyProject.c,114 :: 		portb.b2=255;
	BSF        PORTB+0, 2
;MyProject.c,115 :: 		}
L_count26:
;MyProject.c,116 :: 		}
L_count25:
L_count24:
;MyProject.c,95 :: 		for(count1=x;count1>=1;count1--){
	MOVLW      1
	SUBWF      _count1+0, 1
	BTFSS      STATUS+0, 0
	DECF       _count1+1, 1
;MyProject.c,118 :: 		}
	GOTO       L_count17
L_count18:
;MyProject.c,119 :: 		return;
;MyProject.c,120 :: 		}
L_end_count:
	RETURN
; end of _count
