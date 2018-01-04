# Console.gd
# This is the main controller.

extends Control

onready var DebugCommands = preload("res://Assets/Scripts/Autoload/DebugCommands.gd")

onready var console = get_node("/root/main/GUI/Console")

onready var input = get_node("/root/main/GUI/Console/Input")
onready var debug_log = get_node("/root/main/GUI/Console/Debug")

var debug = []
var commands = {}

var active = true

func _ready():
	
	debug_log.set_scroll_follow(true)
	debug_log.append_bbcode("© 2018 By Lucas Coelho - Welcome to my Console Debug System use [color=#66ccff]help[/color] to see avaliable commands. Feel free to make your improvements. [color=#ff9933]GITHUB[/color]: https://github.com/lcrabbit/Godot-Runtime-Console [color=#ff9933]Itch.io[/color]: https://lcrabbit.itch.io/")
	
	register_command("help", {
			description = "Shows avaliable commands.",
			args = "",
			num_args = 0
			})
	
	register_command("echo", {
				description = "Prints a string in console",
				args = "+ <string>",
				num_args = 1
			})
		
	register_command("show", {
				description = "Prints a variable in console",
				args = "+ <variable_name>",
				num_args = 1
			})
	
	register_command("get_position", {
			description = "Returns a Vector2 of Player's position.",
			args = "",
			num_args = 0
			})
	
	register_command("set_position", {
			description = "Set Player's position using X and Y Vector2 coordinates",
			args = "<Vector2 X and Y>",
			num_args = 2
			})
		
	register_command("scene", {
			description = "Goes to specified scene",
			args = "<Scene_name>",
			num_args = 1
			})

func _input(event):
	if event.is_action_pressed("ui_select"):
		if !input.text.empty():
			handle_command(input.text)
	
	if event.is_action_pressed("toggle_console"):
		toggle_console()


func register_command(name, args):
	commands[name] = args

func append_bbcode(bbcode):
	debug_log.set_bbcode(debug_log.get_bbcode() + bbcode)

func describe_command(cmd):
	var command = commands[cmd]
	var description = command.description
	var args = command.args
	var num_args = command.num_args
	if num_args >= 1:
		append_bbcode("[color=#66ccff]" + cmd + ":[/color] " + description + " [color=#ccff99](usage: " + cmd + " " + args + ")[/color]\n")
	else:
		append_bbcode("[color=#66ccff]" + cmd + ":[/color] " + description + " [color=#ccff99](usage: " + cmd + ")[/color]\n")

func handle_command(text):
	input.cursor_set_line(0)
	var cmd = text.split(" ", true)
	
	if commands.has(cmd[0]):
		var command = commands[cmd[0]]
		print("> " + text)
		
		if cmd.size() == 1 && !command.num_args == 0:
			describe_command(cmd[0])
		else:
			if command.num_args == 0:
				DebugCommands.call(cmd[0].replace(".",""))
			elif command.num_args < 2:
				DebugCommands.call(cmd[0].replace(".", ""), text)
			elif command.num_args == 2:
				DebugCommands.call(cmd[0].replace(".", ""), cmd[1], cmd[2])

func toggle_console():
	if active:
		active = false
		console.visible = false
	else:
		active = true
		console.visible = true