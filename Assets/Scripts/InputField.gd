extends LineEdit

var command

func _ready():
	set_process_input(true);

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _input(event):
	if event.is_action_pressed("ui_left"):
		var command = get_text()
		#print(String(command))
		
		return command
		
		
func bola(many):
	print(str(many))