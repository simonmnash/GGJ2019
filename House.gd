extends Node

var score = -100


func _on_DisableFloor_area_entered(area):
	if area.get_parent().is_in_group("dog_harassers"):
		area.get_node("CollisionShape2D").disabled = true



func _on_Dog_dog_hit():
	score = score + 100
	$Score.text = "SCORE: " + str(score)
