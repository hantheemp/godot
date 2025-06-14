extends Node
class_name FiniteStateMachine

var states : Dictionary = {}
var current_state : State
@export var initial_state : State

#NOTE The changes made in this file will affect all objects that are benefiting from Finite State Machines.
#	  Make changes carefully.

#NOTE Add every state (aka child) to Finite State Machine itself.
func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.state_transition.connect(change_state)

	if initial_state:
		initial_state.Enter()
		current_state = initial_state

#NOTE Call in every frame. Check if the current_state is defined, if so run Update.
func _process(delta):
	if current_state:
		current_state.Update(delta)

# NOTE Handles state transition. The source_state must be equal to current_state.
#	   new_state must be a child of Finite State Machine.
#	   If we are already have a current_state, exit it first. Then enter the new state. 
#	   Set current_state to new_state (continuity).
func change_state(source_state : State, new_state_name : String):
	if source_state != current_state:
		return
	
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		print("New state is empty")
		return
		
	if current_state:
		current_state.Exit()
		
	new_state.Enter()
	
	current_state = new_state
