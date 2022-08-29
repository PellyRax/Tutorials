extends Node

onready var enemy = $Enemy
onready var battleActionButtons = $UI/BattleActionButtons

func _ready():
	battleActionButtons.add_constant_override("hseparation", 8)
	battleActionButtons.add_constant_override("vseparation", 3)
	
func _on_SwordButton_pressed():
	if enemy:
		enemy.hp -= 4


func _on_Enemy_on_death():
	battleActionButtons.hide()
	enemy = null
