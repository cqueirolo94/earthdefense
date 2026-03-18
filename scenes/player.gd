extends CharacterBody2D

@export var LaserShot : PackedScene
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var shots_timer = 0.0
var shots_frecuency: float = 1 # 2 shots each second
var shots_period: float = 1 / shots_frecuency # .5 seconds per shot

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity = direction * SPEED
	else: 
		velocity = Vector2.ZERO

	move_and_slide()

func _process(delta: float) -> void:
	if _should_fire(delta):
		shoot()
	pass

func _should_fire(delta: float) -> bool:
	shots_timer += delta
	if shots_timer >= shots_period:
		shots_timer = 0.0
		return true
	return false

func shoot():
	var ls = LaserShot.instantiate()
	owner.add_child(ls)
	ls.transform = $Muzzle.global_transform
