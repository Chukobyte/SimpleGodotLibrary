#Array2D.gd
extends Reference

class_name Array2D

var _array := []

func _init(width : int, height : int, initial_values = null) -> void:
	_create_2d_array(width, height, initial_values)

func _create_2d_array(width : int, height : int, value) -> void:
	for y in range(height):
		_array.append([])
		_array[y].resize(width)

		for x in range(width):
			_array[y][x] = value

func get_value(x : int, y : int):
	return _array[y][x]

func set_value(x : int, y : int, value) -> void:
	_array[y][x] = value

func width() -> int:
	if empty():
		return 0
	else:
		return _array[0].size()

func height() -> int:
	if empty():
		return 0
	else:
		return _array.size()

func clear() -> void:
	_array.clear()

func empty() -> bool:
	return _array.empty()

func duplicate() -> Array2D:
	var new_array : Array2D
	new_array = (load(get_script().resource_path) as GDScript).new(width(), height()) as Array2D
	for x in width():
		for y in height():
			new_array.set_value(x, y, _array[y][x])
	return new_array
