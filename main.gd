extends Node

@export var mob_scene: PackedScene
var score

func game_over() -> void:
	$scoretimer.stop()
	$mobtimer.stop()
	$HUD.show_game_over()
	$music.stop()
	$mati.play()
	pass # Replace with function body.

func new_game() -> void :
	score = 0
	$player.start($startposition.position)
	$player.show()
	$starttimer.start()
	$HUD.update_score(score)
	$HUD.show_scorelabel("get ready")
	get_tree().call_group("mobs", "queue_free")
	$music.play()
	pass

func _on_mobtimer_timeout() -> void:
	var mob = mob_scene.instantiate()
	
	var mob_spawn_location = $mobpath/mobspawnlocation
	mob_spawn_location.progress_ratio = randf()
	mob.position = mob_spawn_location.position	
	
	var direction = mob_spawn_location.rotation + PI / 2
	direction += randf_range(-PI / 4, PI /4)
	mob.rotation = direction
	
	var velocity =Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	
	add_child(mob)
	pass # Replace with function body.


func _on_scoretimer_timeout() -> void:
	score += 1
	$HUD.update_score(score)

func _on_starttimer_timeout() -> void:
	$mobtimer.start()
	$scoretimer.start()
	pass # Replace with function body.


func _on_hud_start_game() -> void:
	new_game()
