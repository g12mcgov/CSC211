/*  system reset  (stored at 0x00000000)


    Automatically called when Key0 is pushed


  
    David John
    February 2015
   

*/


.section   .reset, "ax"

.extern  _start
 

 
    /* very sophisticated 
          -- jump to entry point _start (32 bit)*/
    
    
     movia r2,_start
     jmp   r2



.end

   
