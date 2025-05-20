extends Node2D

@onready var button = $Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.pressed.connect(_on_pressed)
	
func _on_pressed():
	get_parent().get_parent().dequeue_item(modulate)
