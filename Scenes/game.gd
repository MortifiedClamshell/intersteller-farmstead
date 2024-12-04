extends Control

var profit = 0
var auto = 1

#Wheat variables
var wheat_amount = 1
var wheat_auto_cost = 30
var wheat_auto_amount = 1/1.5
var wheat_auto_obtained = false
var wheat_upgrade_cost = 30

#Carrot variables
var carrot_button_cost = 25
var carrot_amount = 10
var carrot_auto_cost = 150
var carrot_auto_amount = 1/1.5
var carrot_auto_obtained = false
var carrot_upgrade_cost = 150

#Beet variables
var beet_button_cost = 250
var beet_amount = 25
var beet_auto_cost = 450
var beet_auto_amount = 1/1.5
var beet_auto_obtained = false
var beet_upgrade_cost = 450

signal profit_changed

func ai_auto_pressed(auto_cost,auto_obtained,AIUpgradesMenu_VBoxContainer_timer):
	if profit >= auto_cost:
		if not auto_obtained:
			profit -= auto_cost
			emit_signal("profit_changed", profit)
			AIUpgradesMenu_VBoxContainer_timer.start(auto)
		else:
			profit -= auto_cost
			emit_signal("profit_changed", profit)

#Wheat
func update_wheat():
	$CropsMenu/VBoxContainer/Wheat/WheatAuto/WheatAuto.text = str(snapped(float(wheat_auto_amount*wheat_amount), 0.01)) + "\n Space Money per second"
	$CropsMenu/VBoxContainer/Wheat/WheatProfit.text = "\n+" + str(snapped(float(wheat_amount), 0.01)) + " Space Money"
	$ButtonUpgradesMenu/VBoxContainer/WheatUpgrade/WheatUpgrade.text = "Upgrade Wheat Price by x1.5\n" + str(wheat_upgrade_cost) + " Space Money"

func _on_wheat_button_button_down() -> void:
	profit += wheat_amount
	emit_signal("profit_changed", profit)

func _on_wheat_ai_auto_pressed() -> void:
	ai_auto_pressed(wheat_auto_cost,wheat_auto_obtained, $AIUpgradesMenu/VBoxContainer/WheatAuto/WheatTimer)
	if not wheat_auto_obtained and $AIUpgradesMenu/VBoxContainer/WheatAuto/WheatTimer.time_left >0:
		wheat_auto_obtained = true
		$CropsMenu/VBoxContainer/Wheat/WheatAuto.visible = true
	if wheat_auto_obtained:
		wheat_auto_cost *= 2
		wheat_auto_amount  *= 1.5
		$AIUpgradesMenu/VBoxContainer/WheatAuto/WheatAIAuto.text = "Upgrade Wheat Auto by x1.5 \n Cost " + str(wheat_auto_cost) + " Space Money"
	update_wheat()
	"""
	if profit >= wheat_auto_cost:
		if wheat_auto_obtained == false:
			profit -= wheat_auto_cost
			emit_signal("profit_changed", profit)
			$CropsMenu/VBoxContainer/Wheat/WheatAuto.visible = true
			$AIUpgradesMenu/VBoxContainer/WheatAuto/WheatTimer.start(auto)
			wheat_auto_obtained == true
			wheat_auto_cost *= 2
			$AIUpgradesMenu/VBoxContainer/WheatAuto/WheatAIAuto.text = "Upgrade Wheat Auto by x1.5 \n Cost " + str(wheat_auto_cost) + " Space Money"
		else:
			profit -= wheat_auto_cost
			emit_signal("profit_changed", profit)
			wheat_auto_cost *= 2
			wheat_auto_amount *= 1.5
			$AIUpgradesMenu/VBoxContainer/WheatAuto/WheatAIAuto.text = "Upgrade Wheat Auto by x1.5 \n Cost " + str(wheat_auto_cost) + "Space Money"
	update_wheat()
	"""

func _on_wheat_timer_timeout() -> void:
	profit += wheat_auto_amount*wheat_amount
	emit_signal("profit_changed", profit)
	$AIUpgradesMenu/VBoxContainer/WheatAuto/WheatTimer.start(auto)

func _on_wheat_upgrade_pressed() -> void:
	if profit >= wheat_upgrade_cost:
		profit -= wheat_upgrade_cost
		emit_signal("profit_changed", profit)
		wheat_amount *= 1.5
		wheat_upgrade_cost *= 2
		update_wheat()
	else:
		pass

#Carot
func update_carrot() -> void:
	$CropsMenu/VBoxContainer/Carrot/CarrotAuto/CarrotAuto.text = str(snapped(float(carrot_auto_amount*carrot_amount), 0.01)) + "\n Space Money per second"
	$CropsMenu/VBoxContainer/Carrot/CarrotProfit.text = "\n+" + str(snapped(float(carrot_amount), 0.01)) + " Space Money"
	$ButtonUpgradesMenu/VBoxContainer/CarrotUpgrade/CarrotUpgrade.text = "Upgrade Carrot Price by x1.5\n" + str(carrot_upgrade_cost) + " Space Money"

func _on_carrot_unlock_pressed() -> void:
	if profit >= carrot_button_cost:
		profit -= carrot_button_cost
		emit_signal("profit_changed", profit)
		$CropsMenu/VBoxContainer/Carrot/CarrotUnlock.disabled = true
		$CropsMenu/VBoxContainer/Carrot/CarrotUnlock.visible = false
		$CropsMenu/VBoxContainer/Carrot/CarrotButton.disabled = false
		$CropsMenu/VBoxContainer/Carrot/CarrotProfit.visible = true
		$AIUpgradesMenu/VBoxContainer/CarrotAuto.visible = true
		$ButtonUpgradesMenu/VBoxContainer/CarrotUpgrade.visible = true
		update_carrot()
	else:
		pass

func _on_carrot_button_button_down() -> void:
	profit += carrot_amount
	emit_signal("profit_changed", profit)

func _on_carrot_ai_auto_pressed() -> void:
	ai_auto_pressed(carrot_auto_cost,carrot_auto_obtained,$AIUpgradesMenu/VBoxContainer/CarrotAuto/CarrotTimer)
	if not carrot_auto_obtained and $AIUpgradesMenu/VBoxContainer/CarrotAuto/CarrotTimer.time_left >0:
		carrot_auto_obtained = true
		$CropsMenu/VBoxContainer/Carrot/CarrotAuto.visible = true
	if carrot_auto_obtained:
		carrot_auto_cost *= 2
		carrot_auto_amount  *= 1.5
		$AIUpgradesMenu/VBoxContainer/CarrotAuto/CarrotAIAuto.text = "Upgrade Carrot Auto by x1.5 \n Cost " + str(carrot_auto_cost) + " Space Money"
	update_carrot()

func _on_carrot_timer_timeout() -> void:
	profit += carrot_amount*carrot_auto_amount
	emit_signal("profit_changed", profit)
	$AIUpgradesMenu/VBoxContainer/CarrotAuto/CarrotTimer.start(auto)

func _on_carrot_upgrade_pressed() -> void:
	if profit >= carrot_upgrade_cost:
		profit -= carrot_upgrade_cost
		emit_signal("profit_changed", profit)
		carrot_amount *= 1.5
		carrot_upgrade_cost *= 2
		update_carrot()
	else:
		pass

#Beet
func update_beet() -> void:
	$CropsMenu/VBoxContainer/Beet/BeetAuto/BeetAuto.text = str(snapped(float(beet_auto_amount*beet_amount), 0.01)) + "\n Space Money per second"
	$CropsMenu/VBoxContainer/Beet/BeetProfit.text = "\n +" + str(snapped(float(beet_amount), 0.01)) + " Space Money"
	$ButtonUpgradesMenu/VBoxContainer/BeetUpgrade/BeetUpgrade.text = "Upgrade Beet Price by x1.5\n" + str(beet_upgrade_cost) + " Space Money"

func _on_beet_unlock_pressed() -> void:
	if profit >= beet_button_cost:
		profit -= beet_button_cost
		emit_signal("profit_changed", profit)
		$CropsMenu/VBoxContainer/Beet/BeetUnlock.disabled = true
		$CropsMenu/VBoxContainer/Beet/BeetUnlock.visible = false
		$CropsMenu/VBoxContainer/Beet/BeetButton.disabled = false
		$CropsMenu/VBoxContainer/Beet/BeetProfit.visible = true
		$AIUpgradesMenu/VBoxContainer/BeetAuto.visible = true
		$ButtonUpgradesMenu/VBoxContainer/BeetUpgrade.visible = true
		update_beet()
	else:
		pass

func _on_beet_button_button_down() -> void:
	profit += beet_amount
	emit_signal("profit_changed", profit)

func _on_beet_ai_auto_pressed() -> void:
	ai_auto_pressed(beet_auto_cost,beet_auto_obtained, $AIUpgradesMenu/VBoxContainer/BeetAuto/BeetTimer)
	if not beet_auto_obtained and $AIUpgradesMenu/VBoxContainer/BeetAuto/BeetTimer.time_left >0:
		beet_auto_obtained = true
		$CropsMenu/VBoxContainer/Beet/BeetAuto.visible = true
	if beet_auto_obtained:
		beet_auto_cost *= 2
		beet_auto_amount  *= 1.5
		$AIUpgradesMenu/VBoxContainer/BeetAuto/BeetAIAuto.text = "Upgrade Beet Auto by x1.5 \n Cost " + str(beet_auto_cost) + " Space Money"
	update_beet()

func _on_beet_timer_timeout() -> void:
	profit += beet_amount*beet_auto_amount
	emit_signal("profit_changed", profit)
	$AIUpgradesMenu/VBoxContainer/BeetAuto/BeetTimer.start(auto)

func _on_beet_upgrade_pressed() -> void:
	if profit >= beet_upgrade_cost:
		profit -= beet_upgrade_cost
		emit_signal("profit_changed", profit)
		beet_amount *= 1.5
		beet_upgrade_cost *= 2
		update_beet()
	else:
		pass
