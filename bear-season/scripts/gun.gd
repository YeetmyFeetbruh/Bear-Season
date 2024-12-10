extends Node3D

@onready var player = $"../../.."
@onready var gun_anim = $AnimationPlayer
@onready var gun_anim2 = $AnimationPlayer2
@onready var ray_cast = $"../RayCast3D"
@onready var shoot_particles = $GPUParticles3D
@onready var shoot_particles2 = $GPUParticles3D2

var aiming = false
func _unhandled_input(event):
	if Input.is_action_just_pressed("reload") && visible == true:
		if player.ammo_loaded < 2 && player.ammo_total > 0: # Can reload
			$reload.play()
			gun_anim.play("Reload")
			await gun_anim.animation_finished
			var ammo_used = 2 - player.ammo_loaded
			var prev_total = player.ammo_total
			player.ammo_total = max(0, player.ammo_total - ammo_used)
			player.ammo_loaded += prev_total - player.ammo_total
		else: # Can't reload
			$click.play()
	if Input.is_action_just_pressed("shoot") && visible == true:
		if player.ammo_loaded > 0:
			player.ammo_loaded -= 1
			shoot_particles.emitting = true
			shoot_particles2.emitting = true
			if ray_cast.is_colliding():
				ray_cast.get_collider().get_parent().die()
				$kill.play()
			else:
				$fire.play()
			if aiming == false:
				gun_anim2.play("shoot")
			else:
				gun_anim2.play("shoot2")
		else:
			$click.play()
	if Input.is_action_pressed("aim") && visible == true:
		if aiming == false:
			gun_anim2.play("aim")
		aiming = true
	elif visible == true:
		if aiming == true:
			gun_anim2.play_backwards("aim")
		aiming = false
		
