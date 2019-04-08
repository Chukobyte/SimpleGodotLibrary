#SelectListHandler.gd

extends Reference

class_name SelectListHandler

var _index := 0
var _list : Array
var _loops : bool

func _init(list_array : Array, loops = true) -> void:
	_list = list_array
	_loops = loops

func increment_position():
	if _index + 1 < _list.size():
		_index += 1
	else:
		if _loops:
			_index = 0
	return _list[_index]

func decrement_position():
	if _index - 1 >= 0:
		_index -= 1
	else:
		if _loops:
			_index = _list.size() - 1
	return _list[_index]
	
func get_current_item():
	return _list[_index]
	
func reset_index(index = 0) -> void:
	_index = index

func _exit_tree():
	_list.empty()
