# Godot-Runtime-Console
In-Game console to Godot 3.0 for debugging purposes

![Alt Text](https://i.imgur.com/lf823rW.png)

Still have some work to do. Some instructions below:

Observations:
- Press Insert to send the command.
- Stay tuned in the nodes paths, otherwise you can get errors.

default commands:

help = show registered commands

echo <string> = print what you write after it.
  
show <variable> = print the value of some variable (must be stored in Globals.gd)
#
example commands:

get_position = get a Vector2 position of your player (I've made a KinematicBody2D to show how it would be)

set_position <Vector2 X Y> = set the set-up player position 

scene <name> = goes to specified scene. (must be in Assets/Scenes/ folder)
