#File: DataStructures/Stack.gd
extends Node

class_name  Stack

var items := []

func push(value):
	items.append(value)
	
func pop():
	if is_empty():
		return null
	return items.pop_back()

func peek():
	if is_empty():
		return null
	return items[-1]

func is_empty():
	return items.size() == 0

func size():
	return items.size()
