# Simple Godot Library
---------------------

*Version 1.2.0*

## Description

A simple library of `Script Classes` written in GDScript for projects developed with [Godot Engine](https://godotengine.org).

-----------------------------------------------------------------------------------------------------------------------------

## Instruction To Run Test Locally

The `Test` folder contains scenes and scripts related to testing the functionality of the script class library.

1. Download the latest version of [Godot](https://godotengine.org).
2. Clone this repo into a local workspace.
3. Import the project into Godot.
4. Run `Test.tscn` scene.  It is the main scene for the project.  Output from the tests are printed to the console.

-----------------------------------------------------------------------------------------------------------------------------

## Libraries

### Array2D

Class Name: Array2D
Description: API used to create a two dimensional array.

### SimpleLogger

Class Name: Logger
Description: API used to create a simple logger.

### SegmentCast2D

Class Name: SegmentCast2D
Description: API used to create a segment cast object that can be used as an alternative for ray cast.

### ArrayWrapper

Class Name: ArrayWrapper
Description: Array wrapper API, useful for having boundaries.

### SimpleTimer

Class Name: SimpleTimer
Description: Wrapper API for `Timer`.  Useful for creating quick one_shot timers.

### Window

Class Name: Window
Description: API used to toggle fullscreen/windowed and take screen shots.

----------------
## Compatability

Godot >= 3.1
