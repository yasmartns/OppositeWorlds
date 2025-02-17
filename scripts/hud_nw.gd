extends CanvasLayer
var coins = 0

func _ready() -> void:
	$Coins2.text = str(coins)

func _on_coin_2_collected() -> void:
	coins = coins + 1
	_ready()
