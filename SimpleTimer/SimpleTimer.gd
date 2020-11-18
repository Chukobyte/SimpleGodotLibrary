# SimpleTimer.gd
extends Timer

### A SIMPLE WRAPPER TO HELP WITH TIMER INITIALIZATION ###

class_name SimpleTimer


func _init(wait_time_value : float, one_shot_value := true, process_mode_value := Timer.TIMER_PROCESS_IDLE, auto_start_value := false) -> void:
    wait_time = wait_time_value
    one_shot = one_shot_value
    process_mode = process_mode_value
    autostart = auto_start_value

func trigger_timeout() -> void:
    stop()
    emit_signal("timeout")

func random_start(min_value : int, max_value : int) -> void:
    var rand_value := clamp((randi() % max_value) + randf(), min_value, max_value)
    start(rand_value)
