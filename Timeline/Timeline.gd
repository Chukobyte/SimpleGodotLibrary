# Timeline.gd
extends Node2D

class_name Timeline

signal timeline_started(timeline_id)
signal timeline_finished(timeline_id)

const ID := "id"
const LIFE_TIME := "life_time"
const TIME_RANDOMNESS := "time_randomness"

var timeline_timer := SimpleTimer.new(1.0)

var loops := true
var _timelines : Array
var current_timelines := []
var current_timeline : Dictionary


func _init(timelines := [], does_loop := true) -> void:
    loops = does_loop
    _timelines = timelines
    timeline_timer.connect("timeout", self, "_on_timeline_timer_timeout")
    add_child(timeline_timer)

func start() -> void:
    _process_next_timeline()

func stop() -> void:
    timeline_timer.stop()

func _process_next_timeline() -> void:
    if _timelines.empty():
        return
    var timeline_ended := false
    if current_timelines.empty():
        if loops:
            current_timelines = _timelines.duplicate(true)
        else:
            timeline_ended = true
    if !timeline_ended:
        current_timeline = current_timelines.pop_front()
        if current_timeline.has(TIME_RANDOMNESS):
            var randomness : float = current_timeline[TIME_RANDOMNESS]
        timeline_timer.start(current_timeline[LIFE_TIME] + _get_timeline_randomness(current_timeline))
        emit_signal("timeline_started", current_timeline[ID])

func _get_timeline_randomness(timeline : Dictionary) -> float:
    if timeline.has(TIME_RANDOMNESS):
        var randomness_time : float = current_timeline[TIME_RANDOMNESS]
        var rand_num : int = randi() % int(randomness_time)
        var rand_float : float = clamp(rand_num * randf(), 0.0, randomness_time)
        return rand_float
    return 0.0

func _on_timeline_timer_timeout() -> void:
    emit_signal("timeline_finished", current_timeline[ID])
    _process_next_timeline()
