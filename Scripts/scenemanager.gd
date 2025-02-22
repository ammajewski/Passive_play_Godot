class_name SceneManager
extends Control

const PLUS_POP_REQUIREMENT: int = 2


var game_data : GameData = GameData.new()
var title_screen_scene : CanvasLayer
var game_screen_scene : CanvasLayer
var in_game : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	title_screen_scene = get_node("IntroPanelScreen")
	game_screen_scene = get_node("GameScreen")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if in_game:
		game_screen_scene.game_ui_update(game_data, delta)

func _on_intro_panel_screen_new_game() -> void:
	in_game = true
	game_data.newGame()
	title_screen_scene.hide()
	game_screen_scene.show()
	
# + and - Buttons logic
func _on_game_screen_food_plus_btn_pressed() -> void:
	if game_data.in_village > 0:
		game_data.food_forging += 1
		game_data.working += 1
		game_data.in_village -= 1
func _on_game_screen_food_sub_btn_pressed() -> void:
	if game_data.food_forging > 0:
		game_data.food_forging -= 1
		game_data.working -= 1
		game_data.in_village += 1
 
func _on_game_screen_stick_plus_btn_pressed() -> void:
	if game_data.in_village > 0:
		game_data.stick_gathering += 1
		game_data.working += 1
		game_data.in_village -= 1
func _on_game_screen_stick_sub_btn_pressed() -> void:
	if game_data.stick_gathering > 0:
		game_data.stick_gathering -= 1
		game_data.working -= 1
		game_data.in_village += 1

func _on_game_screen_stone_plus_btn_pressed() -> void:
	if game_data.in_village > 0:
		game_data.stone_gathering += 1
		game_data.working += 1
		game_data.in_village -= 1
func _on_game_screen_stone_sub_btn_pressed() -> void:
	if game_data.stone_gathering > 0:
		game_data.stone_gathering -= 1
		game_data.working -= 1
		game_data.in_village += 1
	
func _on_game_screen_mud_plus_btn_pressed() -> void:
	if game_data.in_village > 0:
		game_data.mud_gathering += 1
		game_data.working += 1
		game_data.in_village -= 1
func _on_game_screen_mud_sub_btn_pressed() -> void:
	if game_data.mud_gathering > 0:
		game_data.mud_gathering -= 1
		game_data.working -= 1
		game_data.in_village += 1

func _on_game_screen_clay_plus_btn_pressed() -> void:
	if game_data.in_village > 0:
		game_data.clay_gathering += 1
		game_data.working += 1
		game_data.in_village -= 1
func _on_game_screen_clay_sub_btn_pressed() -> void:
	if game_data.clay_gathering > 0:
		game_data.clay_gathering -= 1
		game_data.working -= 1
		game_data.in_village += 1

# When Progress Bar is compleated
func _on_game_screen_day_night_done() -> void:
	if game_data.food < game_data.population:
		game_data.food = 0
		game_data.population -= 1
	else:
		game_data.food -= game_data.population
	
	if game_data.food - game_data.population > PLUS_POP_REQUIREMENT and game_data.population != game_data.population_Max:
		game_data.population += 1
		game_data.in_village += 1

func _on_game_screen_food_bar_done() -> void:
	game_data.food += (game_data.food_forging * game_data.foraging_per_worker) 

func _on_game_screen_sticks_bar_done() -> void:
	game_data.sticks += (game_data.stick_gathering * game_data.gathering_per_worker) 

func _on_game_screen_stone_bar_done() -> void:
	game_data.stones += (game_data.stone_gathering * game_data.gathering_per_worker) 

func _on_game_screen_mud_bar_done() -> void:
	game_data.mud += (game_data.mud_gathering * game_data.gathering_per_worker) 

func _on_game_screen_clay_bar_done() -> void:
	game_data.clay += (game_data.clay_gathering * game_data.gathering_per_worker) 

# max check functions
func food_check_max():
	if game_data.food > game_data.max_food:
		game_data.food = game_data.max_food
