# Simple Godot SegmentCast2D
---------------------

--------------
## Description

A simple *SegmentCast2D* class written in GDScript that defines *SegmentCast2D* as a type that provides an segment casting API for
projects developed with [Godot Engine](https://godotengine.org).

-------------
## Properties

```
SceneTree _tree
```  
Reference to scene tree

-----------
## Methods:

```
void _init(tree : SceneTree)
```  
init method

```
Array cast(begin_pos : Vector2, end_pos : Vector2, exclusions = [])
```  
Cast a segment cast ffrom `being_pos` to `end_pos`.  Will return an array of objects collided except for those included in `exclusions`.

--------
## Usage

Initialize array:  
```
var segment_cast := SegmentCast2D.new(get_tree())
```

----------------
## Compatability

Godot >= 3.1
