# Numerical Methods

This library provides **Numerical Solutions** for Mathematical and Physical Equations using computational methods.
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
Construct and output a Curve graph using a Polynomial or Exponential function that best fits a series of data points. The function uses interpolation using a regression approach.


### Quadrature Newton Cotes
The quadrature rule by Newton-Cotes evaluates the integral of a function by an approximation of a linear combination of functions, equaled spaced. The function here uses the closed formula 3/8 Simpson's Rule.


### Quadrature Gauss
The Gauss quadrature rules are designed so that an N point quadrature will exactly integrate a polynomial of degree 2N−1 or lower. The calculation of the weights and abscissae uses tabulations to solve the function for any interval.


### Interpolation Newton
This method allows the definition of an analytical function for a conjunct of discrete data. The function output a Curve and Polynomial, where the coefficients are found using the centered divided differences process.


### Interpolation Vandermonde
This method finds the continuous curves that pass through the set of input points using the Vandermonde matrix approach. 
>**Carefully** in using this function since the Vandermonde matrix tends to be badly ill-conditioned.


### Optimization
Iterative method for finding the roots of a differentiable function F, which are solutions to the equations F(x)=0, applied to the derivative f'.


### Roots Bisection
This method finds the root value of a continuous function f(x). This script uses the # Intermediate value theorem to find the root interval, and the bisection method to converge the solution.


### Roots Newton
This root-finding algorithm uses Newton's method to produce successive better approximations to the root (zero value) of a function. The script uses successive solution of the equation.


### Fourier Serie
This function provides output a series to represent infinite or periodic functions using sin and cos trigonometric equations.


### Derivative
Function that calculates the first 4 derivatives of a function using the numerical approach by Derivation of Centered Difference


### ODE RungeKutta
Solution of Ordinary Differential Equation using Runge-Kutta of 5th order
