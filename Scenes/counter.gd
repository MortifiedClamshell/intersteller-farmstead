extends VBoxContainer

@onready var space_money_lable: Label = $SpaceMoneyLable

func _on_game_profit_changed(amount) -> void:
	space_money_lable.text = str(amount) + " Space Money"
