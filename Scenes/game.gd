extends Control

var profit = 10000000000
var auto = 1

#Wheat variables
var wheat_amount = 1
var wheat_auto_cost = 30
var wheat_auto_amount = 1
var wheat_auto_upgrade = 0

#Carrot variables
var carrot_button_cost = 25
var carrot_amount = 5
var carrot_auto_cost = 30
var carrot_auto_amount = 1
var carrot_auto_upgrade = 0

#Beet variables
var beet_button_cost = 250
var beet_amount = 25
var beet_auto_cost = 500
var beet_auto_amount = 1
var beet_auto_upgrade = 0

signal profit_changed

#Wheat
	
func _on_wheat_button_button_down() -> void:
	profit += wheat_amount
	emit_signal("profit_changed", profit)
	
func _on_wheat_ai_auto_pressed() -> void:
	if profit >= wheat_auto_cost:
		if wheat_auto_upgrade == 0:
			profit -= wheat_auto_cost
			emit_signal("profit_changed", profit)
			$CropsMenu/VBoxContainer/Wheat/WheatAuto.visible = true
			$AIUpgradesMenu/VBoxContainer/WheatAuto/WheatTimer.start(auto)
			wheat_auto_upgrade += 1
			wheat_auto_cost *= 2
			$AIUpgradesMenu/VBoxContainer/WheatAuto/WheatAIAuto.text = "Upgrade Wheat Auto by x1.5 \n Cost " + str(wheat_auto_cost)
		else:
			profit -= wheat_auto_cost
			emit_signal("profit_changed", profit)
			wheat_auto_cost *= 2
			wheat_auto_amount *= 1.5
			$AIUpgradesMenu/VBoxContainer/WheatAuto/WheatAIAuto.text = "Upgrade Wheat Auto by x1.5 \n Cost " + str(wheat_auto_cost)
			$CropsMenu/VBoxContainer/Wheat/WheatAuto/WheatAuto.text = str(snapped(float(wheat_auto_amount*wheat_amount), 0.01)) + "\n Wheat per second"
	else:
		pass
		
func _on_wheat_timer_timeout() -> void:
	profit += wheat_auto_amount*wheat_amount
	emit_signal("profit_changed", profit)
	$AIUpgradesMenu/VBoxContainer/WheatAuto/WheatTimer.start(auto)



#Carot
func _on_carrot_unlock_pressed() -> void:
	if profit >= carrot_button_cost:
		profit -= carrot_button_cost
		emit_signal("profit_changed", profit)
		$CropsMenu/VBoxContainer/Carrot/CarrotUnlock.disabled = true
		$CropsMenu/VBoxContainer/Carrot/CarrotUnlock.visible = false
		$CropsMenu/VBoxContainer/Carrot/CarrotButton.disabled = false
		$CropsMenu/VBoxContainer/Carrot/CarrotProfit.visible = true
		$AIUpgradesMenu/VBoxContainer/CarrotAuto.visible = true
	else:
		pass
		
func _on_carrot_button_button_down() -> void:
	profit += carrot_amount
	emit_signal("profit_changed", profit)

func _on_carrot_ai_auto_pressed() -> void:
	if profit >= carrot_auto_cost:
		if carrot_auto_upgrade == 0:
			profit -= carrot_auto_cost
			emit_signal("profit_changed", profit)
			$CropsMenu/VBoxContainer/Carrot/CarrotAuto.visible = true
			$AIUpgradesMenu/VBoxContainer/CarrotAuto/CarrotTimer.start(auto)
			carrot_auto_upgrade += 1
			carrot_auto_cost *= 2
			$AIUpgradesMenu/VBoxContainer/CarrotAuto/CarrotAIAuto.text = "Upgrade Carrot Auto by x1.5 \n Cost " + str(carrot_auto_cost)
		else:
			profit -= carrot_auto_cost
			emit_signal("profit_changed", profit)
			carrot_auto_cost *= 2
			carrot_auto_amount *= 1.5
			$AIUpgradesMenu/VBoxContainer/CarrotAuto/CarrotAIAuto.text = "Upgrade Carrot Auto by x1.5 \n Cost " + str(carrot_auto_cost)
			$CropsMenu/VBoxContainer/Carrot/CarrotAuto/CarrotAuto.text = str(snapped(float(carrot_auto_amount*carrot_amount), 0.01)) + "\n Carrot per second"
	else:
		pass
	
func _on_carrot_timer_timeout() -> void:
	profit += carrot_amount*carrot_auto_amount
	emit_signal("profit_changed", profit)
	$AIUpgradesMenu/VBoxContainer/CarrotAuto/CarrotTimer.start(auto)

#Beet
func _on_beet_unlock_pressed() -> void:
	if profit >= beet_button_cost:
		profit -= beet_button_cost
		emit_signal("profit_changed", profit)
		$CropsMenu/VBoxContainer/Beet/BeetUnlock.disabled = true
		$CropsMenu/VBoxContainer/Beet/BeetUnlock.visible = false
		$CropsMenu/VBoxContainer/Beet/BeetButton.disabled = false
		$CropsMenu/VBoxContainer/Beet/BeetProfit.visible = true
		$AIUpgradesMenu/VBoxContainer/BeetAuto.visible = true
	else:
		pass

func _on_beet_button_button_down() -> void:
	profit += beet_amount
	emit_signal("profit_changed", profit)
	
func _on_beet_ai_auto_pressed() -> void:
	if profit >= beet_auto_cost:
		if beet_auto_upgrade == 0:
			profit -= beet_auto_cost
			emit_signal("profit_changed", profit)
			$CropsMenu/VBoxContainer/Beet/BeetAuto.visible = true
			$AIUpgradesMenu/VBoxContainer/BeetAuto/BeetTimer.start(auto)
			beet_auto_upgrade += 1
			beet_auto_cost *= 2
			$AIUpgradesMenu/VBoxContainer/BeetAuto/BeetAIAuto.text = "Upgrade Beet Auto by x1.5 \n Cost " + str(beet_auto_cost)
		else:
			profit -= beet_auto_cost
			emit_signal("profit_changed", profit)
			beet_auto_cost *= 2
			beet_auto_amount *= 1.5
			$AIUpgradesMenu/VBoxContainer/BeetAuto/BeetAIAuto.text = "Upgrade Beet Auto by x1.5 \n Cost " + str(beet_auto_cost)
			$CropsMenu/VBoxContainer/Beet/BeetAuto/BeetAuto.text = str(snapped(float(beet_auto_amount*beet_amount), 0.01)) + "\n Beet per second"
	else:
		pass
	
func _on_beet_timer_timeout() -> void:
	profit += beet_amount*beet_auto_amount
	emit_signal("profit_changed", profit)
	$AIUpgradesMenu/VBoxContainer/BeetAuto/BeetTimer.start(auto)


func _on_wheat_upgrade_pressed() -> void:
	pass # Replace with function body.
