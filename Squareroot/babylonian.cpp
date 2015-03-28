// Function to approximate the square root of X using
// the Babylonian algorithm.
//
// David John
// February 2015

#include <cmath>

using namespace std;

float babylonian(float x)
{

float x_old;
float x_new = x/2.0;

do
{
	x_old=x_new;
	x_new = (x_old + x/x_old)/2.0;
}
while (abs(x_old-x_new)>1.0E-40);

return x_new;
}

