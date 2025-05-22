#File: Scenes/main.gd
extends Node2D
@onready var stack = Stack.new()
@onready var stack_label = $UI/VBoxContainer/StackLabel
@onready var push_button = $UI/VBoxContainer/PushButton
@onready var pop_button = $UI/VBoxContainer/PopButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_stack_label()
	push_button.pressed.connect(on_push_button_pressed)
	pop_button.pressed.connect(on_pop_button_pressed)
	
func on_push_button_pressed():
	var value = randi_range(1,100)
	stack.push(value)
	update_stack_label()
	
func on_pop_button_pressed():
	stack.pop()
	update_stack_label()


func update_stack_label():
	stack_label.text = "Stack: " + str(stack.items)
