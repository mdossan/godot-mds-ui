class_name MdsKeyBinder extends HBoxContainer

@export var action_label: String = "Action"
@export var action_name: String = "jump"
@export var is_listening_input: bool = false

func _ready() -> void:
	%ActionLabel.text = action_label
	var events = InputMap.action_get_events(action_name)
	if events.is_empty():
		return
	var first_event: InputEvent = events.get(0)
	var key_name: String = first_event.as_text().split(" - ")[0]
	%Key.text = key_name

func _input(event: InputEvent) -> void:
	if not is_listening_input:
		return
	if not event.is_pressed():
		return
	InputMap.action_erase_events(action_name)
	InputMap.action_add_event(action_name, event)
	is_listening_input = false
	%Key.text = event.as_text()

func _on_key_pressed() -> void:
	is_listening_input = true
	%Key.text = "Listening input..."
