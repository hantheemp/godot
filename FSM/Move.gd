extends State
class_name Move

func Enter():
	print("Entering Move")

func Update(delta : float):
		
	if Input.is_action_just_pressed("Attack"):
		state_transition.emit(self, "Attack")
		
func Exit():
	print("Exiting Move")
