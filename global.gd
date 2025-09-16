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
	"Dock Receive": "Long ago, the dock nations...",
	"Confirm Receive": "Long ago, the confirm nations...",
	"Inventory": "Long ago, the inventory nations...",
	"Picking": "Long ago, the picking nations...",
	"Packing": "Long ago, the packing nations...",
	"Shipping": "Long ago, the shipping nations...",
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
