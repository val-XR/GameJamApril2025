extends Node

# resources dictionary. Referenced for resource scanner
var resources = {
	"IronOre2":     {"display_name": "Iron Ore", "value": "45"},
	"UraniumOre2":   {"display_name": "Uranium Ore", "value": "250"},
	"GoldOre2":      {"display_name": "Gold Ore", "value": "90"},
	"O2Tank2":      {"display_name": "O2 Tank", "value": "40"},
	"ScrapPipe2":      {"display_name": "Pipe Scrap", "value": "35"},
	"ScrapPropeller2":      {"display_name": "Propeller Scrap", "value": "40"},
	}

# passes resource dictionary. Call it through ResourcesDictionary.dictionary
func dictionary():
	return resources
