# File: scripts/linked_list_node.gd
extends Node

class_name LinkedListNode

var value: Variant # The data stored in this node
var next = null # Reference to the next node in the list - Removed type hint for parsing robustness

func _init(val: Variant):
	value = val

func get_string_representation() -> String: # Renamed from to_string()
	return str(value)
