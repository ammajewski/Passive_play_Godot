extends CanvasLayer

signal new_game
# Called when the node enters the scene tree for the first time.

func _on_new_game_pressed() -> void:
	new_game.emit()
