// Simple main program to test the Babylonian square
// root algorithm
//
// David John
// February 2015

#include <cmath>
#include <iostream>

using namespace std;

// prototype for Babylonian function

float babylonian(float);

int main()
{

float x, x_sqrt;

cout << "Enter X: ";
cin >> x;

x_sqrt = babylonian(x);

cout << "The square root of " << x << " is " << x_sqrt << endl;
cout << x_sqrt << "*" << x_sqrt << " = " << x_sqrt*x_sqrt << endl;
cout << "Measured error is : " << abs(x_sqrt*x_sqrt-x) << endl;

return 0;

}


