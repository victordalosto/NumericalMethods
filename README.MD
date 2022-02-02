# Numerical Methods

This library provides **Numerical Solutions** for Mathematical and Physical Equations using computacional methods.
All the scripts functions are implemented in [Matlab](https://www.mathworks.com/), providing a complete output solution for some of the most common problems found in Engineering using a: direct, recursive, or iterative approach.

> **Note:** Although Matlab provides solutions for some of the functions here implemented, it doesn't always provide all the desired parameters.

## Functions

The list of the functions is listed below.

[List of Content](#list-of-content)
- [Curve Fitting](#curve-fitting)
- [Quadrature: Newton Cotes](#quadrature-newton-cotes)
- [Quadrature: Gauss](#quadrature-gauss)
- [Interpolation: Newton](#interpolation-newton)
- [Interpolation: Vandermonde](#interpolation-vandermonde)
- [Optimization](#optimization)
- [Roots: Bisection](#roots-bisection)
- [Roots: Newton](#roots-newton)
- [Fourier Serie](#fourier-serie)
- [Derivative](#derivative)
- [ODE RungeKutta](#ode-rungekutta)


## List of content


### Curve Fitting
Construct and output a Curve graph using a Polynomial ($y = c_0 + c_1x¹ + c_2x²+\dots$) or Exponential ($y = c_0 \cdot e^{c_1}$) function that best fits a series of data points. The function uses interpolation using a regression approach.
_

### Quadrature Newton Cotes
The quadrature rule by Newton-Cotes evaluates the integral of a function by an approximation of a linear combination of functions, $y_i:=f(x_i)$, equaled spaced. The function here uses the closed formula 3/8 Simpson's Rule.
_

### Quadrature Gauss
The Gauss quadrature rules is designed so that an $N$ point quadrature will exactly integrate a polynomial of degree $2N−1$ or lower. The calculation of the weights and abscissae uses tabulations to solve the function for any interval: $\int_{a}^{b}f(x)dx \simeq  \sum_{i=1}^{n}w_if(x_i)$.
_

### Interpolation Newton
This method allows the definition of an analytical function for a conjunct of discrete data. The function output a Curve and Polynomial, where the coefficients are found using the centered divided differences process $p(x) = y_0 + \sum_{i=1}^{n}(\Delta^iy_0\prod_{j=0}^{i-1}(x-x_i)))$.
_

### Interpolation Vandermonde
This method finds the continuous curves that pass through the set of input points using the Vandermonde matrix approach. 
>**Carefully** in using this function since Vandermonde matrix tend to be badly ill-conditioned.

_
### Optimization
Iterative method for finding the roots of a differentiable function $F$, which are solutions to the equations $F(x)=0$, applied to the derivative $f'$.
_

### Roots Bisection
This method finds the root $x_k$ value of a continuous function $f(x)$. This script uses the # Intermediate value theorem ($f(a)\cdot f(b) <0$) to find the root interval, and the bisection method to converge the solution.
_

### Roots Newton
This root-finding algorithm uses Newton's method to produce successives better approximations to the root (zero value) of a function. The script uses sucessive solution of the equation: $x_{n+1}=x_n-f(x_n)/{f'(x_n)}$.
_

### Fourier Serie
This function provides output a series to represent infinite or periodic functions using sin and cos trigonometric equations. The general formula is given by: $T(t) = a_0/2 +  \sum_{i=1}^{n}[a_n \cdot cos({n\pi t}/L) + b_n \cdot sin({n\pi t}/L)]$.
_

### Derivative
Function that calculates the first 4 derivatives of a function using the numerical approach by Derivation of Centered Difference
_

### ODE RungeKutta
Solution of Ordinary Differential Equation using Runge-Kutta of 5th order
_

```