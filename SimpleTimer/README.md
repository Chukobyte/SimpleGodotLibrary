# Simple Godot SimpleTimer

---------------------
## Description

A simple *SimpleTimer* class written in GDScript that defines *SimpleTimer* as a type that is a wrapper for the Timer class.  It's main use is to quickly generate a oneshot timer.  Used for projects developed with [Godot Engine](https://godotengine.org).

-------------
## Properties

```
Timer _timer
```
Internal refernce to `Timer` object.

-----------
## Methods:

```
func _init(time : float, one_shot : bool = true, process_mode : int = Timer.TIMER_PROCESS_IDLE, auto_start = false):
```
init method

```
void start(time : float = -1.0)
```
Starts the timer. Sets `_timer.wait_time` to `time` if `time` > 0. This also resets the remaining time to `_timer.wait_time`.

```
void stop()
```
Stops timer.

```
bool is_stopped()
```
Returns `true` if `_timer` is stopped.

```
void set_wait_time(time : float)
```
Sets `_timer.wait_time`

```
float get_wait_time()
```
Returns value for `_timer.wait_time`

----------
## Signals

```
timeout()
```
Emitted when `_timer` reaches 0.

--------
## Usage

Initialize array:  
```
var stop_watch_timer := SimpleTimer.new(3)
```

Connect signal:  
```
stop_watch_timer.connect("timeout", self, "_on_stop_watch_timer_timeout")
```

Add to scene tree to be able to start timer just like `Timer`:  
```
add_child(stop_watch_timer)
stop_watch_timer.start()
```

---------------
## Compatability

Godot >= 3.1
