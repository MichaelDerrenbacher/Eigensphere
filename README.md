# Eigensphere

Graphical visualizer of 3 dimensional eigenvectors

Code takes an input matrix A and scales it with vectors modeling a unit sphere.

________________________________________________________________________________________

eigencheck.m is used in V1 only, it finds the angles between to vectors

V1 is a 2-dimensional variant used to test the concept, has minimal commenting

V2 is a prototype of V3, functional works but has an extremely high runtime

V3 is the commented final version
______________

The matrix A can be any of dimensions 3x3 or less, with empty dimension filled in with 0.

For example A = [1 2 0 ; 2 1 0; 0 0 0]; = [1 2 ; 2 1]

For this reason V3 functionally encompasses V1 as it can do lower dimensions.
__________

Code is entirely my own and was written during the Winter of 2018.
During this project I learned more about coordinate systems, plotting techniques, and what eigenvectors and values actually look like. Project was inspired by my calc IV professor who showed a pre-calculated demonstration of a 2-D visualizer. My V1 is different as it is calculates the eigenvectors in real time geometrically rather than beforehand.
