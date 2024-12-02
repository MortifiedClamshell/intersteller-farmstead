extends VBoxContainer

@onready var space_money_lable: Label = $SpaceMoneyLable

func _on_game_profit_changed(amount) -> void:
	space_money_lable.text = str(snapped(float(amount), 0.01)) + " Space Money"
