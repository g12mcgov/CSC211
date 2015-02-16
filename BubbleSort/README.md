# BubbleSort

A simple bubble-sort routine written in Assembly designed for the Altera NIOS II processor.

The origin `C` implementation of this routine is found below:

```C
	void bsort(int X[], int N) {
		bool madeaswap = true;

		for (int i = N - 1; i > 0 && madeaswap; i--) {
			madeaswap = false;

			for(int j = 0; j < i; j++) {
				if(X[j] > X[j+1]) {
				int temp = X[j];
				X[j] = X[j+1];
				X[j+1] = temp;

				madeaswap = true;
				}
			}
		}
		return;
	}
```