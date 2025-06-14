extends Node
class_name State

#NOTE The changes made in this file will affect all objects that are benefiting from Finite State Machines.
#	  Make changes carefully

@warning_ignore("unused_signal")
signal state_transition

#NOTE Generic Enter State function.
func Enter():
	pass
	
#NOTE Generic Exit State function.
func Exit():
	pass

#Note Generic Update State function.	
func Update(_delta:float):
	pass
	
