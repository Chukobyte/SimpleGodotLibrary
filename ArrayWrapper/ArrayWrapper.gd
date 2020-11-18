# ArrayWrapper.gd

extends Reference

class_name ArrayWrapper


var _index := 0
var _array : Array
var _loops : bool

func _init(list_array : Array, loops := true) -> void:
    _array = list_array
    _loops = loops

func increment_position():
    if _index + 1 < _array.size():
        _index += 1
    else:
        if _loops:
            _index = 0
    return _array[_index]

func decrement_position():
    if _index - 1 >= 0:
        _index -= 1
    else:
        if _loops:
            _index = _array.size() - 1
    return _array[_index]

func set_position(index := 0):
    _index = index
    return _array[_index]

func set_position_from_value(value):
    var index := get_item_index(value)
    _index = index
    return _array[_index]

func get_current_item():
    return _array[_index]

func get_item_from_index(index : int):
    return _array[index]

func get_item_index(value) -> int:
    var index := -1
    for i in range(_array.size()):
        if _array[i] == value:
            index = i
            break
    return index

func update_array(item, new_index := _index) -> void:
    _array.append(item)
    _index = new_index

func reset_array(new_array := [], new_index := 0) -> void:
    _array = new_array
    _index = new_index

func _exit_tree() -> void:
    _array.empty()
