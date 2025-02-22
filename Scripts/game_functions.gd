extends Object

# Stage1 Variables
const FIRE_HEAT_FORGER_TRIGGER_AMOUNT = 10
const FIRE_HEAT_FORGER_BOUNES : int = 2
const VILLAGE_FIRE_COST : int = 50
const SIMPLE_CRAFTS_TRIGGER_AMOUNT : int = 15


# Stage 1 Funcitons
#static func 

static func check_fire_heat_d (data: GameData):
	if data.sticks >= FIRE_HEAT_FORGER_TRIGGER_AMOUNT and data.fire_heat == 0:
		data.food_per_forger = data.food_per_forger + FIRE_HEAT_FORGER_BOUNES
		data.fire_heat = 1
	if data.fire_heat == 1:
		data.village_fire = 1

static func check_village_fire_i(data: GameData):
	if data.village_fire == 1:
		data.sticks = data.sticks - VILLAGE_FIRE_COST
		data.village_fire = 2

static func check_simple_crafts_d(data: GameData):
	if data.simple_crafts == 0:
		if data.stones == SIMPLE_CRAFTS_TRIGGER_AMOUNT and data.sticks == SIMPLE_CRAFTS_TRIGGER_AMOUNT and data.food == SIMPLE_CRAFTS_TRIGGER_AMOUNT:
			data.simple_crafts = 1

#static func check_
