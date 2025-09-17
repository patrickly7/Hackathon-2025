extends Node

var IS_PRACTICE = false
var PRACTICE_GAME = ""

var NEXT_GAME_SCENE = "res://scenes/dock_receive.tscn"
var CURRENT_GAME = "Dock Receive"

# Dock Receive
var DOCK_RECEIVE_TIME_TAKEN = 0
var DOCK_RECEIVE_MISTAKES = 0
var DOCK_RECEIVE_MEDAL = "Gold"

# Confirm Receive
var CONFIRM_RECEIVE_TIME_TAKEN = 0
var CONFIRM_RECEIVE_MISTAKES = 0
var CONFIRM_RECEIVE_MEDAL = "Gold"

# Inventory
var INVENTORY_TIME_TAKEN = 0
var INVENTORY_MISTAKES = 0
var INVENTORY_MEDAL = "Gold"

# Picking
var PICKING_TIME_TAKEN = 0
var PICKING_MISTAKES = 0
var PICKING_MEDAL = "Gold"

# Packing
var PACKING_TIME_TAKEN = 0
var PACKING_MISTAKES = 0
var PACKING_MEDAL = "Gold"

# Shipping
var SHIPPING_TIME_TAKEN = 0
var SHIPPING_MISTAKES = 0
var SHIPPING_MEDAL = "Gold"

var DESCRIPTION_DICT = {
	"Dock Receive": "Scan packages as they whoosh past!\nMove with arrows, scan with spacebar!",
	"Confirm Receive": "Verify correct cards!\nMatches go in ACCEPTED!\nMismatches go in EXCEPTIONS!",
	"Inventory": "Count cards in each cabinet!\nUse buttons to change count!\nPress ENTER to guess!",
	"Picking": "Pick cards from cabinets!\nHover over cabinets to open!\nClick to pick!",
	"Packing": "Pack cards into boxes!\nFollow the prompts with arrow keys!",
	"Shipping": "Load boxes for shipping!\nClick the box that matches the current space!",
}

func prepareNextGame():
	match Global.CURRENT_GAME:
		"Dock Receive":
			CURRENT_GAME = "Confirm Receive"
		"Confirm Receive":
			CURRENT_GAME = "Inventory"
		"Inventory":
			CURRENT_GAME = "Picking"
		"Picking":
			CURRENT_GAME = "Packing"
		"Packing":
			CURRENT_GAME = "Shipping"
		"Shipping":
			CURRENT_GAME = ""
		_:
			pass
