# File: scripts/linked_list.gd
extends Node

class_name LinkedList

var head: LinkedListNode = null # The first node in the list (can still type hint here)
var _size: int = 0

# Add a new node to the front of the list
func insert_at_head(value: Variant) -> void:
	var new_node = LinkedListNode.new(value)
	new_node.next = head
	head = new_node
	_size += 1

# Add a new node to the end of the list
func insert_at_tail(value: Variant) -> void:
	var new_node = LinkedListNode.new(value)
	if head == null:
		head = new_node
	else:
		var current = head
		while current.next != null:
			current = current.next
		current.next = new_node
	_size += 1

# Delete the first occurrence of a node with a given value
func delete_node(value: Variant) -> bool:
	if head == null:
		return false

	if head.value == value:
		head = head.next
		_size -= 1
		return true

	var current = head
	while current.next != null:
		if current.next.value == value:
			current.next = current.next.next
			_size -= 1
			return true
		current = current.next
	return false # Value not found

# Search for a node with a given value
func search(value: Variant) -> LinkedListNode:
	var current = head
	while current != null:
		if current.value == value:
			return current
		current = current.next
	return null # Value not found

# Get the size of the list
func size() -> int:
	return _size

# Check if the list is empty
func is_empty() -> bool:
	return head == null

# Convert the list to a string for display (for debugging/visuals)
func get_string_representation() -> String: # Renamed from to_string()
	var s = "["
	var current = head
	while current != null:
		s += current.get_string_representation() # Call the renamed method on the node
		if current.next != null:
			s += " -> "
		current = current.next
	s += "]"
	return s
