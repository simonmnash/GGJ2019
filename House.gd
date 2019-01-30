extends Node

var score = -100


func _on_DisableFloor_area_entered(area):
	if area.get_parent().is_in_group("dog_harassers"):
		area.get_node("CollisionShape2D").disabled = true
	score = score + 10
	$Score.text = "SCORE: " + str(score)



func _on_Dog_dog_hit():
	score = score + 90
	$Score.text = "SCORE: " + str(score)



func _on_Cat_snozzal():
	score = score + 5
	$Score.text = "SCORE: " + str(score)