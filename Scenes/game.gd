extends Control

var profit = 0

#Wheat variables
var wheat_amount = 1
var wheat_timer = 0
var wheat_timer_D = 1

#Carrot variables
var carrot_button_cost = 25
var carrot_amount = 5

signal profit_changed


#Wheat
func _on_wheat_timer_timeout() -> void:
	wheat_timer == wheat_timer_D
	"value" == wheat_timer
	
func _on_wheat_button_button_down() -> void:
	if wheat_timer == 0:
		profit += wheat_amount
		emit_signal("profit_changed", profit)
	else:
		pass
	
#Carot
func _on_carrot_button_button_down() -> void:
	profit += carrot_amount
	emit_signal("profit_changed", profit)
