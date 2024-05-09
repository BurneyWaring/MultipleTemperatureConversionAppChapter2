#From the Book:
#Create Compelling Science and Engineering Simulations Using the Godot Engine, Copyright 2024 Burney Waring, ThankGod Egbe, Lateef Kareem 
#Chapter 2

extends Panel

var multiplyarray = []
var additionarray = []
var from
var to
var input

func _ready():
	pass # Replace with function body.
	loadvalues()
	$ItemList.select(0)
	$ItemList2.select(0)
	from = 0
	to = 0	

func convert_temp(input, from, to):
	var output = multiplyarray[to][from]*input + additionarray[to][from]
	return output
	
func loadvalues():
	#https://en.wikipedia.org/wiki/Conversion_of_scales_of_temperature
#Creating a 2D matrix of values
#The first row is:
#multiplyarray[0] = [1.0, 1.0, 0.5556, 0.5556, 1.25]
#The third value is the third column of that row:
#multiplyarray[0][2] = [0][2] = 0.5556

#from (columns)
#0 Celcius
#1 Kelvin
#2 Fahrenheit
#3 Rankine
#4 Reaumur	

#to (rows)
#0 Celcius
#1 Kelvin
#2 Fahrenheit
#3 Rankine
#4 Reaumur

#output = multiplyarray[to][from]*input + additionarray[to][from]

	multiplyarray = [
[1.0, 1.0, 0.5556, 0.5556, 1.25], 
[1.0, 1.0, 0.55556, 0.55556, 1.25],
[1.8, 1.8, 1.0, 1.0, 2.25],
[1.8, 1.8, 1.0, 1.0, 2.25],
[0.8, 0.8, 0.4444, 0.4444, 1.0]
]

	additionarray = [
[0.0, 273.15, -17.7778, -273.15, 0.0],
[273.15, 0.0, 255.3722, 0.0, 273.15],
[32.0, -459.67, 0.0, -459.67, 32.0],
[491.67, 0, 459.67, 0.0, 491.67],
[0.0, -218.52, -14.2222, -218.52, 0.0]
]	


func _on_ItemList_item_selected(index):
	from = index
	_on_Button_pressed()

func _on_ItemList2_item_selected(index):
	to = index
	_on_Button_pressed()

func _on_Button_pressed():
	input = float($LineEdit.text)
	var temp = convert_temp(input, from, to)
	$Label5.text = str(stepify(temp, 0.01))
	

