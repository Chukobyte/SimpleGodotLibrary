#SimpleTimer.gd
extends Node2D

class_name SimpleTimer

signal timeout

var _timer : Timer

func _init(time : float, one_shot : bool = true, process_mode : int = Timer.TIMER_PROCESS_IDLE, auto_start = false):
	_timer = Timer.new()
	_timer.wait_time = time
	_timer.one_shot = true
	_timer.process_mode = Timer.TIMER_PROCESS_IDLE
	_timer.autostart = auto_start
	_timer.connect("timeout", self, "_on__timer_timeout")
	
func _ready():
	add_child(_timer)

func start(time : float = -1.0) -> void:
	_timer.start(time)
	
func stop() -> void:
	_timer.stop()

func is_stopped() -> bool:
	return _timer.is_stopped()
	
func set_wait_time(time : float) -> void:
	_timer.wait_time = time

func get_wait_time() -> float:
	return _timer.wait_time

func _on__timer_timeout() -> void:
	emit_signal("timeout")
