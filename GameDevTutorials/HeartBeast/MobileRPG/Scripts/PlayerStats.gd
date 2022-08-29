extends Node

var maxHP = 25;
var hp = maxHP setget set_hp;

var maxAP = 3;
var ap = maxAP setget set_ap;

var maxMP = 10;
var mp = maxMP setget set_mp;

signal end_turn
signal hp_changed(value)
signal ap_changed(value)
signal mp_changed(value)

func set_hp(value):
	hp = min(value, maxHP)
	emit_signal("hp_changed", hp)
	
func set_ap(value):
	ap = min(value, maxAP)
	emit_signal("ap_changed", ap)
	
func set_mp(value):
	mp = min(value, maxMP)
	emit_signal("mp_changed", mp)
