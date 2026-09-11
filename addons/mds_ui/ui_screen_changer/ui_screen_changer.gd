class_name MdsUiScreenChanger extends CanvasLayer

@export var current_screen_id: String = "MAIN"

signal transition_requested(new_screen_id: String)

func _ready() -> void:
	request_transition("MAIN")

func request_transition(new_screen_id: String) -> void:
	for child: MdsUIScreen in get_children():
		child.visible = new_screen_id == child.screen_id
	current_screen_id = new_screen_id
	transition_requested.emit(new_screen_id)
