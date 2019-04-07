# Simple Godot Array2D

*Version 1.0.0*

--------------
## Description

A simple *Array2D* class written in GDScript that defines *Array2D* as a type that provides a two dimensional array API for
projects developed with [Godot Engine](https://godotengine.org).

-------------
## Properties

```
Array _array
```  
Internal array used to track array of arrays.

-----------
## Methods:

```
void _init(width : int, height : int, initial_values = null)
```
init method.

```
Variant get_value(x : int, y : int)
```
Get a value contained in array

```
void set_value(x : int, y : int, value)
```
Set a value at x and y location in array

```
int width()
```
Returns width (first element) of array

```
int height()
```
Returns height of array

```
void clear()
```
Makes array empty

```
bool empty()
```
Returns if array is empty

```
Array2D duplicate()
```
Returns copy of 2D array.

--------
## Usage

Initialize array:  
```
var 2d_array := Array2D.new(2, 5)
```

---------------
## Compatability

Godot >= 3.1