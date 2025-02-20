extends CharacterBody2D

const SPEED = 200.0
const JUMP_FORCE = 300.0  # Agora positivo, ajustamos no código
const GRAVITY = 980.0

@export var inverted_gravity: bool = true  # Define se o jogador está no teto

func _ready():
		$Animation.flip_v = true  # Espelha a animação verticalmente

func _physics_process(delta: float) -> void:
	# Adiciona a gravidade correta
	if not (is_on_floor() or is_on_ceiling()):
		velocity.y += (-GRAVITY if inverted_gravity else GRAVITY) * delta
		$Animation.flip_v = true

	# Define o que é "chão" para cada player
	var on_ground = is_on_floor() if !inverted_gravity else is_on_ceiling()

	# Pulo
	if Input.is_action_just_pressed("ui_accept") and on_ground:
		velocity.y = JUMP_FORCE 

	# Movimento horizontal
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		

	move_and_slide()
