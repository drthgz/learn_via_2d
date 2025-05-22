extends Node2D

@onready var value_label = $Value
@onready var background_rect = $Background
@onready var connection_indicator = $ConnectionArrow

var linked_list_node: LinkedListNode # Ref to actual data node
var room_controller: Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func setup(node: LinkedListNode, controller: Node):
	linked_list_node = node
	room_controller = controller
	value_label.text = str(linked_list_node.value)
	background_rect.color = Color.from_hsv(.2, .4, .1)
	
