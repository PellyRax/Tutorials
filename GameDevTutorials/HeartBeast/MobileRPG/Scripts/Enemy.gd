extends Node2D

var hp = 25 setget set_hp 

onready var hpLabel = $HPLabel
onready var animationPlayer = $AnimationPlayer

signal on_death

func set_hp(newHP):
	hp = newHP
	hpLabel.text = str(hp) + 'hp'
	
	if hp <= 0:
		emit_signal("on_death")
		queue_free()	
	else:
		animationPlayer.play("Shake")
		yield(animationPlayer, "animation_finished")
		animationPlayer.play("Attack")
		yield(animationPlayer, "animation_finished")
		var battle = get_tree().current_scene
		var playerStats = battle.find_node("PlayerStats")
		playerStats.hp -= 3;
