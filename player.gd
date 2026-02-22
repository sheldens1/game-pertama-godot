extends Area2D
signal hit()

@export var kecepatan = 400.0	
var screen_size
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("jalan_kanan"):
		velocity.x += 1
	if Input.is_action_pressed("jalan_kiri"):
		velocity.x -= 1
	if Input.is_action_pressed("jalan_atas"):
		velocity.y -= 1
	if Input.is_action_pressed("jalan_bawah"):
		velocity.y += 1
		
	if velocity.length() > 0 :
		velocity = velocity.normalized() * kecepatan
		$AnimatedSprite2D.play()
	else :
		$AnimatedSprite2D.stop()
	pass
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x != 0 :
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y != 0 :
		$AnimatedSprite2D.animation = "up"
		$AnimatedSprite2D.flip_v = velocity.y > 0
		
		if velocity.x < 0 :
			$AnimatedSprite2D.flip_h = true
		else :
			$AnimatedSprite2D.flip_h = false


func _on_body_entered(body: Node2D) -> void:
	hide()
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)
	pass # Replace with function body.

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
