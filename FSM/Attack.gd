extends State
class_name Attack

func Enter():
	print("Entering Attack")
	
func Update(_delta : float):
	if Input.is_action_just_released("Attack"):
		state_transition.emit(self, "Idle")
	
func Exit():
	print("Leaving Attack")
