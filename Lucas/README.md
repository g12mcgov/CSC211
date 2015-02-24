# Lucas

An Assembly implementation of the Lucas method designed for the Altera NIOS II processor.

The original `C` implementation of this routine is found below:

```C
	int Lucas(int N) {
    	if (N==0)  return 2;
    	if (N==1)  return 1;

   		return   Lucas(N-1) + Lucas(N-2);
	}
```


It also makes use of the built in LED display and uses bit-to-hex conversion to display my name. Though not perfect, it's the best we can do with the standard "block text display".
	
	____
	|__|
	|__|


![demo](http://i1158.photobucket.com/albums/p618/g12mcgov/nios.png)

