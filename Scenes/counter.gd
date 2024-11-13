extends VBoxContainer

@onready var wheat_lable: Label = $WheatLable

func _on_game_wheat_changed(amount) -> void:
	wheat_lable.text = str(amount) + " Wheat"
