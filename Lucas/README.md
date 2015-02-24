# BubbleSort

An Assembly implementation of the Lucas method designed for the Altera NIOS II processor.

The origin `C` implementation of this routine is found below:

```C
	int Lucas(int N) {
    	if (N==0)  return 2;
    	if (N==1)  return 1;

   		return   Lucas(N-1) + Lucas(N-2);
	}
```

