# Game-of-Life
This is a MATLAB project from the University of Auckland MATHS 199 course.
In this project we were given the task to create a game of life simulator
In the project brief we were given the specifications of each function we were expected to create.

Project Description:
In this project, our goal was to write a MATLAB project to search for a period-19 oscillator.

Function Descriptions:

- The gameoflife_search: function takes in a nxm matrix where the entries are randomly generated in way that will hopefully find a period-19 oscillator.
- neighborsum: function takes an nxm matrix A and cell coordinates (i,j) in that cell. It returns the number of alive cells surrounding it
- golupdate: function takes in an nxm matrix A and updates the matrix using the game of life rules
- lifetextin: function takes in filename for game of life pattern which is encoded in plaintext and returns the corresponding matrix of 0's and 1's 
- lifetextout: function takes a input filename and a 0-1 matrix. It returns the matrix in a plaintext file
- gameoflife: funciton takes in a filename, the number of times to apply game of life rules, padding constants, and magnification constant. At each step the function shows the result as an image. The function returns the resulting matrix after implementing Game of Life rules n-times
