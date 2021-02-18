# CH4-examples
in class examples from CH4 in the book

## C++ Analog to M
```
int* foo;

cout << foo << endl; //memory address of foo
cout << *foo << endl; //value at memory address foo
```

## ASM version
```
@foo //declare variable foo

//if we had a COUT function...
cout A //memory address of foo
cout M //value at memory address foo
```