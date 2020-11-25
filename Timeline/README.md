# Simple Godot Timeline

---------------------
## Description

A simple *Timeline* class written in GDScript that defines *Timeline* as a type that contains utility functions for creating a timeline containing `SimpleTimer`s.  Used for projects developed with [Godot Engine](https://godotengine.org).

-------------
## Properties

```
bool loops
```
Determines if the Timeline loops when reaching the end.

-----------
## Methods:

```
start()
```
Method to start timeline.  

```
stop()
```
Method to stop timeline.

----------
## Signals

```
timeline_started(timeline_id)
```
Emitted when a new timeline has started.

```
timeline_finished(timeline_id)
```
Emitted when a timeline has finished.

--------
## Usage

Example of an enemy timeline:
```
# Enemy.gd

# Setup timeline data
enum TIMELINE_ID {
    IDLE = 0,
    SHOOT_SHOT = 1
}

const TIMELINES := [
    {
        Timeline.ID: TIMELINE_ID.IDLE,
        Timeline.LIFE_TIME: 1.0,
        Timeline.TIME_RANDOMNESS: 3.0,
    },
    {
        Timeline.ID: TIMELINE_ID.SHOOT_SHOT,
        Timeline.LIFE_TIME: 2.0
    },
]

# Initialize timeline
func _ready() -> void:
    var timeline := Timeline.new(TIMELINES)
    timeline.connect("timeline_started", self, "_on_Timeline_timeline_started")
    add_child(timeline)
    timeline.start()

func _on_Timeline_timeline_started(timeline_id : int) -> void:
    match timeline_id:
        TIMELINE_ID.IDLE:
            # Play idle animation
            pass
        TIMELINE_ID.SHOOT_SHOT:
            # Play shooting animation and initiate attack
            pass
        _:
            pass
```

---------------
## Compatability

Godot >= 3.1
