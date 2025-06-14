extends State
class_name Idle

func Enter():
	print("Entering Idle")
	
func Exit():
	print("Leaving Idle")
	
func Update(_delta : float):
	if(Input.get_vector("Left", "Right", "Up", "Down").normalized()):
		state_transition.emit(self, "Move")
		
	elif Input.is_action_just_pressed("Attack"):
		state_transition.emit(self, "Attack")
		
	else:
		print("Idling")
		
	
