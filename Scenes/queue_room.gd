extends Node2D

@export var queue_length: int=5
@export var item_scene: PackedScene
@onready var queue_container = $VBoxContainer/QueueContainer
@onready var goal_container = $VBoxContainer/GoalContainer
@onready var status_label = $VBoxContainer/StatusLabel

var queue:= []
var current_index:=0
var colors = [Color.RED, Color.BLUE, Color.GREEN, Color.YELLOW, Color.PURPLE]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generate_queue()
	generate_goals()
	
func generate_queue():
	for i in range(queue_length):
		var color = colors.pick_random()
		var item = item_scene.instantiate()
		item.modulate = color
		item.queue_room = self # pass a ref
		queue_container.add_child(item)
		queue.append(color)
		

func generate_goals():
	for color in queue:
		var goal = ColorRect.new()
		goal.color = color
		goal.size = Vector2(40,40)
		goal_container.add_child(goal)

func dequeue_item(color_clicked: Color):
	if current_index >= queue.size():
		return
	
	if queue[current_index] == color_clicked:
		status_label.text = "Correct!"
		current_index +=1
	else:
		status_label.text = "Wrong order!"
