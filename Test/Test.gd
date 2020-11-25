# Test.gd
extends Node

const TEST_SEPARATOR := "------------------------------------------------------"

func _ready() -> void:
    print("Test started!")
    print(TEST_SEPARATOR)
    execute_all_test()
    print("Test completed!")
    get_tree().quit()

func execute_all_test() -> void:
    window_test()
    array_wrapper_test()
    array_2d_test()
    logger_test()
    segment_cast_2d_test()
    simple_timer_test()
    timeline_test()

func logger_test() -> void:
    print("Logger test started!")
    var logger := Logger.new()
    logger.info("Info Log Test")
    logger.warn("Warn Log Test")
    logger.debug("Debug Log Test")
    logger.error("Error Log Test")
    print("Logger test completed!")
    print(TEST_SEPARATOR)

func array_wrapper_test() -> void:
    print("Array Wrapper test started!")
    var array_wrapper := ArrayWrapper.new(["first", "second", "third"])
    assert(array_wrapper.increment_position() == "second")
    assert(array_wrapper.increment_position() == "third")
    assert(array_wrapper.increment_position() == "first")
    print("Array Wrapper test completed!")
    print(TEST_SEPARATOR)

func array_2d_test() -> void:
    print("Array 2D test started!")
    var array_2d := Array2D.new(3, 3, null)
    array_2d.set_value(0, 1, "left")
    array_2d.set_value(1, 1, "center")
    array_2d.set_value(2, 1, "right")
    array_2d.set_value(1, 0, "up")
    array_2d.set_value(1, 2, "down")

    assert(array_2d.get_value(0, 1) == "left")
    assert(array_2d.get_value(1, 1) == "center")
    assert(array_2d.get_value(2, 1) == "right")
    assert(array_2d.get_value(1, 0) == "up")
    assert(array_2d.get_value(1, 2) == "down")
    print("Array 2D test completed!")
    print(TEST_SEPARATOR)

func segment_cast_2d_test() -> void:
    print("Segment Cast 2D test started!")
    var segment_cast_2d := SegmentCast2D.new(get_tree())
    var hits := segment_cast_2d.cast(Vector2(-1, -1), Vector2(1, 1))
    assert(hits.empty())
    print("Segment Cast 2D test completed!")
    print(TEST_SEPARATOR)

func simple_timer_test() -> void:
    print("Simple Timer test started!")
    var simple_timer := SimpleTimer.new(1.0)
    assert(simple_timer.wait_time == 1.0)
    print("Simple Timer test completed!")
    print(TEST_SEPARATOR)

func window_test() -> void:
    print("Window test started!")
    var window := Window.new()
    window.center()
    window.set_fullscreen(get_viewport(), true)
    assert(window.is_full_screen())
    window.set_fullscreen(get_viewport(), false)
    assert(!window.is_full_screen())
    print("Window test completed!")
    print(TEST_SEPARATOR)

func timeline_test() -> void:
    print("Timeline test started!")
    var timeline := Timeline.new([
        {
            Timeline.ID: "idle",
            Timeline.LIFE_TIME: 1.0,
            Timeline.TIME_RANDOMNESS: 3.0,
        },
        {
            Timeline.ID: "talk",
            Timeline.LIFE_TIME: 2.0
        },
    ])
    assert(!timeline._timelines.empty())
    print("Timeline test completed!")
    print(TEST_SEPARATOR)
