# Window.gd
extends Reference

class_name Window

var base_size : Vector2
var windowed_size : Vector2


func _init(_base_size := Vector2(800, 600), _windowed_size := Vector2(800, 600)) -> void:
    base_size = _base_size
    windowed_size = _windowed_size

static func center() -> void:
    var screen_size = OS.get_screen_size()
    var window_size = OS.get_window_size()
    OS.set_window_position(screen_size * 0.5 - window_size * 0.5)

func set_fullscreen(viewport : Viewport, fullscreen := true) -> void:
    if fullscreen:
        OS.set_window_fullscreen(fullscreen)
    else:
        set_windowed(viewport)

func set_windowed(viewport : Viewport) -> void:
    var window_size := OS.get_screen_size()

    OS.set_borderless_window(false)
    OS.set_window_fullscreen(false)

    if windowed_size <= window_size:
        OS.set_window_size(windowed_size)
        viewport.set_size(windowed_size)
    else:
        # I set the windowed version to an arbitrary 80% of screen size here
        var scale : float = min(window_size.x / base_size.x, window_size.y / base_size.y) * 0.8
        var scaled_size : Vector2 = (base_size * scale).round()
        OS.set_window_size(scaled_size)
        viewport.set_size(scaled_size)

    center()

static func is_full_screen() -> bool:
    return OS.window_fullscreen

static func take_screen_shot(scene_tree : SceneTree, file_path : String) -> void:
    var viewport : Viewport = scene_tree.get_current_scene().get_viewport()
    viewport.set_clear_mode(Viewport.CLEAR_MODE_ONLY_NEXT_FRAME)
    yield(scene_tree, "idle_frame")
    yield(scene_tree, "idle_frame")
    var image := viewport.get_texture().get_data()
    image.flip_y()
    image.save_png(file_path)
