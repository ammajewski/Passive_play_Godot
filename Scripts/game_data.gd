class_name GameData

# Current Stage

# Villagers stats
var population : int
var population_Max : int
var dead : int
var working : int
var in_village : int

# Resources
var food: int
var sticks: int
var stones: int
var wood: int
var mud: int
var clay: int

var max_food: int
var max_sticks: int
var max_stones : int
var max_wood: int
var max_mud: int
var max_clay: int

# collection Stats
var foraging_level: int
var foraging_per_worker: int
var gathering_level : int
var gathering_per_worker : int

# villager allocation
var food_forging : int
var stick_gathering : int
var stone_gathering : int
var mud_gathering : int
var clay_gathering : int

# save and load
func loadData ():
	# Load Save Data Josn
	pass
	
func saveData():
	# Make Save data Josn
	pass
	
# New Game option
func newGame ():
	# Stats
	population = 5
	dead = 0
	working = 0
	in_village = 5
	
	# resorces
	food = 10
	sticks = 0
	stones = 0
	wood = 0
	mud = 0
	clay = 0
	
	max_food = 30
	max_sticks = 20
	max_stones = 20
	max_wood = 20
	max_mud = 20
	max_clay = 20
	
	# collection stats
	foraging_level = 1 
	foraging_per_worker = 1 
	gathering_level = 1  
	gathering_per_worker = 1  
	
	# worker allocation
	food_forging = 0
	stick_gathering = 0
	stone_gathering = 0
	mud_gathering = 0
	clay_gathering = 0
