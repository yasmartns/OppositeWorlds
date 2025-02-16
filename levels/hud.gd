extends CanvasLayer
var coins = 0

func _ready() -> void:
	$Coins.text = str(coins)
	$Coins.text = str(coins)

func _on_coin_collected() -> void:
	coins = coins + 1
	_ready()
