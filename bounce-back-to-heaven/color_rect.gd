extends ColorRect

@onready var bgblk = $"."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bgblk.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	await get_tree().create_timer(1.5).timeout
	bgblk.visible = false
