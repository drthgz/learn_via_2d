extends Node2D

@export var linked_list_item_scene: PackedScene # drag linkedListItem scene here in inspector

@onready var linked_list_info_label = $UIControls/VBoxContainer/LinkedListInfoLabel
@onready var insert_head_button = $UIControls/VBoxContainer/HBoxContainer/InsertHeadButton
@onready var insert_tail_button = $UIControls/VBoxContainer/HBoxContainer/InsertTailButton
@onready var delete_value_buttom = $UIControls/VBoxContainer/HBoxContainer/DeleteValueButton
@onready var delete_value_input = $UIControls/VBoxContainer/HBoxContainer/DeleteValueInput
@onready var list_display_container = $ListDisplayContainer

var linked_list: LinkedList = LinkedList.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#connect buttons
	insert_head_button.pressed.connect(on_insert_head_pressed)
	insert_tail_button.pressed.connect(on_insert_tail_pressed)
	delete_value_buttom.pressed.connect(on_delete_value_pressed)
	
	#initial display
	update_visual_list()

func on_insert_head_pressed() -> void:
	var value = randi_range(1,99) # use random value for simplicity
	linked_list.insert_at_head(value)
	update_visual_list()

func on_insert_tail_pressed() -> void:
	var value = randi_range(1,99)
	linked_list.insert_at_tail(value)
	update_visual_list()

func on_delete_value_pressed() ->void:
	var value_text = delete_value_input.text
	if value_text.is_empty():
		linked_list_info_label.text = "Please enter a value to delete"
		return
	var value_to_delete: Variant
	# try to parse as int, if not, keep as string
	if value_text.is_valid_int():
		value_to_delete = value_text.to_int()
	else:
		value_to_delete = value_text
	
	var deleted = linked_list.delete_node(value_to_delete)
	if deleted:
		linked_list_info_label.text = "Delete: " + str(value_to_delete)
	else:
		linked_list_info_label.text = "Value not found: " + str(value_to_delete)
	update_visual_list()

func update_visual_list() -> void:
	# clear existing visual items
	for child in list_display_container.get_children():
		child.queue_free()
	
	linked_list_info_label.text = "Linked List: " + linked_list.get_string_representation()
	linked_list_info_label.text += " (Size: "+ str(linked_list.size()) + ")"
	
	var current_node = linked_list.head
	while current_node != null:
		var item_visual = linked_list_item_scene.instantiate()
		list_display_container.add_child(item_visual)
		item_visual.setup(current_node, self) #pass the data node and this controller
		current_node = current_node.next
	
	#Optional: adjust pos if HboxContainer doesn't handle spacing
	var x_offset =0
	for child in list_display_container.get_children():
		child.position.x = x_offset
		x_offset += child.background_rect.size.x +30 # item width + spacing
