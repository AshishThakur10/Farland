extends CanvasLayer
var coin = 0
func _ready() -> void:
	$Coins.text = String(coin)


func _on_coin_collected() -> void:
	coin = coin + 1
	_ready()
