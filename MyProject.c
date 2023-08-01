int count1,flag=1;
void count (int x);
void main() {
     adcon1 =7;
     trisb=0, trisc=0 ,trisa=0;
     trisa.b3=trisa.b1=1;
     portb=0,portc=0;
     portb.b7=1;
     porta=255;
      //b3 red1 b2 yellow1 b1 green1  b4 green2 b5 yellow2 b6 red2
     while(1){
     if (porta.B3 ){
              portb=0;
              portb.b7=1;
              portb.b3=1;
              portb.b4=1;
              flag=0;
              count(23);
              portb=0;
              portb.b7=1;
              portb.b3=0;
              portb.b1=1;
              portb.b5=0;
              portb.b6=1;
              flag=1;
              count(15);
              portb=0;
              portb.b7=1;
              portb.b3=1;
              portb.b4=1;

              }
      else {
           porte.B0=1;
           portb.b7=0;
           if (!porta.b1){
                   if(flag==1){
                      portb.b1=0;
                      portb.b2=0;
                      portb.b3=1;
                      portb.b4=0;
                      portb.b5=1;
                      portb.b6=0;
                      portb.b7=1;
                      porta.B0=0;
                      for(count1=3;count1>=0;count1--){
                      portc=(count1/10)*16+count1%10;
                      delay_ms(1000);
                      }           }
                      portb.B1=1;
                      portb.b2=0;
                      portb.b3=0;
                      portb.b4=0;
                      portb.b5=0;
                      portb.b6=1;
                      porta.B0=0;
                      portb.b7=0;

                      flag=0;

                   }
              else if(porta.b1){
                      if (!flag){
                        portb.B1=0;
                        portb.b2=1;
                        portb.b3=0;
                        portb.b4=0;
                        portb.b5=0;
                        portb.b6=1;
                        portb.b7=0;
                        porta.B0=1;
                        for(count1=3;count1>=0;count1--){
                          portc=(count1/10)*16+count1%10;

                           delay_ms(1000);
                        } }
                        porta.B0=0;
                        portb.b7=0;
                        portb.B1=0;
                        portb.b2=0;
                        portb.b3=1;
                        portb.b4=1;
                        portb.b5=0;
                        portb.b6=0;
                        flag=1;
                        }
           }

       }

 }


 void count (int x){
         for(count1=x;count1>=1;count1--){
          porta.B0=1;
          portb.b7=1;
         if(porta.B3==0)return;
         portc=(count1/10)*16+count1%10;

             delay_ms(1000);
             if(x==23){
               if(count1==4){
                 portb.b7=1;
                 portb.b4=0;
                 portb.b5=255;
                 }

               }
             else if (x==15){
                  if(count1==4){
                     portb.b7=1;
                     portb.b1=0;
                     portb.b2=255;
                     }
                 }

             }
             return;
        }