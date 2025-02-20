extends CanvasLayer
var coins = 0
@onready var key = $Key
var hasKey := false


func _ready() -> void:
	$Coins.text = str(coins)

func _on_coin_collected() -> void:
	coins = coins + 1
	_ready()

func set_has_key(valor):
	hasKey = valor
