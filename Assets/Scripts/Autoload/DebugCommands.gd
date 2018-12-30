# DebugCommands.gd

extends SceneTree

static func help():
	var commands = Console.commands
	for command in commands:
		# List Commands
		Console.describe_command(command)

static func echo(text):
	# Erase "echo" from the output
	text.erase(0, 5)
	Console.append_bbcode(">[color=#ff9933] " + text + "[/color]\n")

static func clear():
	Console.clear()

# This "variable" argument must be in Globals.gd
static func show(variable):
	# Erase "show" from the output
	variable.erase(0, 5)
	if (str(Globals.get(variable)) == null):
		Console.append_bbcode(">[color=#ff9933] " + variable + "[/color]: Null or not declared.\n")
		return
	Console.append_bbcode(">[color=#ff9933] " + variable + "[/color]: " + str(Globals.get(variable)) + "\n")

# Some example optional commands to show how it works
static func get_position():
	# Print Player Position
	Console.append_bbcode(">[color=#ff9933] " + str(Globals.player.get_global_position()) + "[/color]\n")

static func set_position(x, y):
	Globals.player.set_global_position(Vector2(x, y))

static func scene(name):
	#SceneTree.change_scene
	var scene_name = name.replace("scene ", "")
	if (scene_name.replace(" ", "").empty()):
		Console.append_bbcode("Please use a valid scene name.\n")
		return
	Globals.get_tree().change_scene("res://Assets/Scenes/" + scene_name + ".tscn")