extends CanvasLayer

const PLUS_S : String = "+"
const DIVIDE_S : String = " / "

var food_working: int
var stick_working: int
var stone_working: int
var mud_working: int
var clay_working: int

var working_total : int
var in_village : int

# Ui Elelments 
@onready var pop_number: Label = get_node("VillagerStats/VBoxContainer/PopulationAndWorking/PopNumber")
@onready var work_number: Label = get_node("VillagerStats/VBoxContainer/PopulationAndWorking/WorkNumber")
@onready var dead_number: Label = get_node("VillagerStats/VBoxContainer/DeadAndInVillage/DeadNumber")
@onready var in_village_number: Label = get_node("VillagerStats/VBoxContainer/DeadAndInVillage/InVillageNumber")
@onready var food_number: Label = get_node("VillagerStats/VBoxContainer/Food/Number")
@onready var sticks_number: Label = get_node("VillagerStats/VBoxContainer/SticksStones/SticksNumber")
@onready var stones_number: Label = get_node("VillagerStats/VBoxContainer/SticksStones/StonesNumber")
@onready var mud_number: Label = get_node("VillagerStats/VBoxContainer/MudClay/MudNumber")
@onready var clay_number: Label = get_node("VillagerStats/VBoxContainer/MudClay/ClayNumber")
@onready var foraging_level_number: Label = get_node("VillagerStats/VBoxContainer/ForagingLevel/Number")
@onready var foraging_per_worker_number: Label = get_node("VillagerStats/VBoxContainer/ForagingPerWorker/Number")
@onready var gathering_level_number: Label = get_node("VillagerStats/VBoxContainer/GatheringLevel/Number")
@onready var gathering_pre_worker_number: Label = get_node("VillagerStats/VBoxContainer/GatheringPerWorker/Number")
@onready var foraging_working_number: Label = get_node("Jobs/JobsEntitys/Food/Number")
@onready var stick_working_number: Label = get_node("Jobs/JobsEntitys/Sticks/Number")
@onready var stone_working_number: Label = get_node("Jobs/JobsEntitys/Stones/Number")
@onready var mud_working_number: Label = get_node("Jobs/JobsEntitys/Mud/Number")
@onready var clay_working_number: Label = get_node("Jobs/JobsEntitys/Clay/Number")

@onready var day_night_bar: ProgressBar = get_node("Jobs/JobsEntitys/MorningNight/ProgressBar")
@onready var food_progress_bar: ProgressBar = get_node("Jobs/JobsEntitys/Food/ProgressBar")
@onready var stick_progress_bar: ProgressBar = get_node("Jobs/JobsEntitys/Sticks/ProgressBar")
@onready var stone_progress_bar: ProgressBar = get_node("Jobs/JobsEntitys/Stones/ProgressBar")
@onready var mud_progress_bar: ProgressBar = get_node("Jobs/JobsEntitys/Mud/ProgressBar")
@onready var clay_progress_bar: ProgressBar = get_node("Jobs/JobsEntitys/Clay/ProgressBar")

signal food_plus_btn_pressed
signal food_sub_btn_pressed
signal stick_plus_btn_pressed
signal stick_sub_btn_pressed
signal stone_plus_btn_pressed
signal stone_sub_btn_pressed
signal mud_plus_btn_pressed
signal mud_sub_btn_pressed
signal clay_plus_btn_pressed
signal clay_sub_btn_pressed

signal day_night_done
signal food_bar_done
signal sticks_bar_done
signal stone_bar_done
signal mud_bar_done
signal clay_bar_done

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func game_ui_update(data: GameData, delta: float):
	day_night_cycle(delta, day_night_bar, day_night_done)
	
	progress_bar_logic(food_progress_bar, food_bar_done, delta, data.food_forging, data.foraging_level)
	progress_bar_logic(stick_progress_bar, sticks_bar_done, delta, data.stick_gathering, data.gathering_level)
	progress_bar_logic(stone_progress_bar, stone_bar_done, delta, data.stone_gathering, data.gathering_level)
	progress_bar_logic(mud_progress_bar, mud_bar_done, delta, data.mud_gathering, data.gathering_level)
	progress_bar_logic(clay_progress_bar, clay_bar_done, delta, data.clay_gathering, data.gathering_level)
	
	get_set_value_display(pop_number, data.population, 1, data.max_food / 2)
	get_set_value_display(work_number, data.working)
	get_set_value_display(dead_number, data.dead)
	get_set_value_display(in_village_number, data.in_village)
	get_set_value_display(food_number, data.food, 1, data.max_food)
	get_set_value_display(sticks_number, data.sticks, 1, data.max_sticks)
	get_set_value_display(stones_number, data.stones, 1, data.max_stones)
	get_set_value_display(mud_number, data.mud, 1, data.max_mud)
	get_set_value_display(clay_number, data.clay, 1, data.max_clay)
	
	get_set_value_display(foraging_level_number, data.foraging_level)
	get_set_value_display(foraging_per_worker_number, data.foraging_per_worker, 2)
	get_set_value_display(gathering_level_number, data.gathering_level)
	get_set_value_display(gathering_pre_worker_number, data.gathering_per_worker, 2)
	
	get_set_value_display(foraging_working_number, data.food_forging)
	get_set_value_display(stone_working_number, data.stone_gathering)
	get_set_value_display(stick_working_number, data.stick_gathering)
	get_set_value_display(mud_working_number, data.mud_gathering)
	get_set_value_display(clay_working_number, data.clay_gathering)

func get_set_value_display(location: Label,value: int, mode: int = 0, max_value: int = 0):
	match mode:
		1: # current/Max value display: 00 / 00
			location.text = DoubleValueAmount(value) + DIVIDE_S + DoubleValueAmount(max_value) 
		2: # Adds a plus symbol in the display
			location.text =  PLUS_S + DoubleValueAmount(value)
		_: # Default display value
			location.text = DoubleValueAmount(value)
		
func DoubleValueAmount(value : int):
	if value < 10:
		return "0" + str(value)
	else:
		return str(value)

# Button Pressed
func _food_add_pressed() -> void:
	food_plus_btn_pressed.emit()
func _food_sub_pressed() -> void:
	food_sub_btn_pressed.emit()

func _sticks_add_pressed() -> void:
	stick_plus_btn_pressed.emit()
func _sticks_sub_pressed() -> void:
	stick_sub_btn_pressed.emit()
	
func _stones_add_pressed() -> void:
	stone_plus_btn_pressed.emit()
func _stones_sub_pressed() -> void:
	stone_sub_btn_pressed.emit()
	
func _mud_add_pressed() -> void:
	mud_plus_btn_pressed.emit()
func _mud_sub_pressed() -> void:
	mud_sub_btn_pressed.emit()
	
func _clay_add_pressed() -> void:
	clay_plus_btn_pressed.emit()
func _clay_sub_pressed() -> void:
	clay_sub_btn_pressed.emit()	

# progress bars
func progress_bar_logic(bar: ProgressBar,shout: Signal,  delta: float, worker: int,  level: int):
	if worker > 0:
		if bar.value == bar.max_value:
			bar.value = 0
			print(bar.name)
			print(shout.get_name())
			shout.emit()
		else:
			bar.value += (level * 15) * delta

func day_night_cycle(delta: float, bar: ProgressBar, shout: Signal):
	bar.value += delta * 5
	if bar.value == bar.max_value:
		shout.emit()
		bar.value = 0


 
