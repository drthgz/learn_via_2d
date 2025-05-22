extends Node2D

@onready var button = $Button
var queue_room: Node # gets set from queueRoom

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.pressed.connect(_on_pressed)
	
func _on_pressed():
	if queue_room:
		queue_room.dequeue_item(modulate)
