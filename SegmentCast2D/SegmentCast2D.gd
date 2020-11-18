# SegmentCast2D.gd

extends Reference

class_name SegmentCast2D

var _tree : SceneTree

func _init(tree : SceneTree) -> void:
	_tree = tree

func cast(begin_pos : Vector2, end_pos : Vector2, exclusions = []) -> Array:
	var space_state = _tree.get_root().get_world_2d().get_direct_space_state()
	
	var segment = SegmentShape2D.new()
	segment.set_a(begin_pos)
	segment.set_b(end_pos)

	var query = Physics2DShapeQueryParameters.new()
	query.set_shape(segment)
	query.set_exclude(exclusions)

	var hits = space_state.intersect_shape(query, 32)
	return hits
