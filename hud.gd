extends CanvasLayer

signal start_game

func show_scorelabel(text):
	$pesan.text = text
	$pesan.show()
	$Timer.start()
	
func show_game_over():
	show_scorelabel("game over")
	await $Timer.timeout
	$pesan.text = "Hindar AVO"
	$pesan.show()
	await get_tree().create_timer(1.0).timeout
	$Button.show()
	
func update_score(score):
	$scorelabel.text = str(score)
	
func _on_button_pressed() -> void:
	$Button.hide()
	start_game.emit()
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	$pesan.hide()
	pass # Replace with function body.


func _on_start_game() -> void:
	pass # Replace with function body.
