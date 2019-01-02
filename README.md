# Godot-Runtime-Console
In-Game console to Godot 3.0 for debugging purposes

![Alt Text](https://i.imgur.com/Xk81Z67.png)

Still have some work to do. Some instructions below:

Observations:
- Press Insert to send the command.
- Stay tuned in the nodes paths, otherwise you can get errors.

Default commands:

- help = show registered commands

- echo <string> = print what you write after it.
  
- show <variable> = print the value of some variable (must be stored in Globals.gd)
  
- clear = clears log.

# Example commands:

- get_position = get a Vector2 position of your player (I've made a KinematicBody2D to show how it would be)

- set_position <Vector2 X Y> = set the set-up player position 

- scene <name> = goes to specified scene. (must be in Assets/Scenes/ folder)
  
  # Adding a new Command:
  - First of all you'll need to call `register_command` function [`Assets/Scripts/Autoload/Console.gd`], with takes a string `name` and an `args` object with `description`, `args`(both to be showed on the log) and `num_args` fields.
  
  - Then you simply make a function with **the same name** as your `name` declared onto register_command calling, and setup your command actions inside this function.
  
