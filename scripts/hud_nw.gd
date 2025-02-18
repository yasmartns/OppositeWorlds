extends CanvasLayer
var coins2 = 0
@onready var key = $Key2


func _ready() -> void:
	$Coins2.text = str(coins2)

func _on_coin_2_collected() -> void:
	coins2 = coins2 + 1
	_ready()
