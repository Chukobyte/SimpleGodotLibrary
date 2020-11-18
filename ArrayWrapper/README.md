# Simple Godot ArrayWraper
---------------------

## Description

A simple *ArrayWraper* class written in GDScript that defines *ArrayWraper* as a type that provides an list API useful for adding guards to the array limits for projects developed with [Godot Engine](https://godotengine.org).

## Properties

```
int _index
```
Internal index used for keep track of current list item.

```
int _list
```
Contains list of items passed into `_init()`

```
bool _loops
```
If set to `true` will roll over list when index is out of bounds with respect to `_list` size.

## Methods:

```
void _init(list : Array, loops = true)
```
init method

```
Variant increment_position()
```
Increases `_index` by 1 and returns object `_list[_index]`

```
Variant decrement_position()
```
Decreases `_index` by 1 and returns object `_list[_index]`

```
Variant get_current_item()
```
Returns object `_list[_index]`

```
Variant reset_index(index = 0)
```
Set `_index` to value in `index`

## Usage
-----

Initialize array:  
```
var options_list_handler := ArrayWraper.new(["Music", "Sound", "Back"])
```

Example:  
```
print(options_list_handler.get_current_item()) # prints "Music"
print(options_list_handler.decrement_position()) # prints "Sound"
```

----------------
## Compatability

Godot >= 3.1
