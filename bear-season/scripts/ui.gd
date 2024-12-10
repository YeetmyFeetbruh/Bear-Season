extends CanvasLayer

@onready var hotbar = $hotbar
@onready var player = $"../Player"

var equipped: String

# If statement monstrosity that controls hotbar
func _unhandled_key_input(event):
	var buttons = hotbar.get_children()
	if Input.is_key_pressed(KEY_1):
		for button in buttons:
			button.disabled = true
		buttons[0].disabled = false
		equipped = 'flashlight'
		player.switch_hand()
	if Input.is_key_pressed(KEY_2):
		for button in buttons:
			button.disabled = true
		buttons[1].disabled = false
		equipped = 'gun'
		player.switch_hand()
	if Input.is_key_pressed(KEY_3):
		for button in buttons:
			button.disabled = true
		buttons[2].disabled = false
		equipped = 'axe'
		player.switch_hand()
	if Input.is_key_pressed(KEY_4):
		for button in buttons:
			button.disabled = true
		buttons[3].disabled = false
		equipped = 'placeholder'
		player.switch_hand()
	if Input.is_key_pressed(KEY_5):
		for button in buttons:
			button.disabled = true
		buttons[4].disabled = false
		equipped = 'placeholder'
		player.switch_hand()
