global_settings {
	photons {
    	count 500000
    	autostop 0
    	jitter .4
	}
}

sky_sphere {
	pigment {
		gradient y
		color_map {
			[ 0.5  color CornflowerBlue ]
			[ 1.0  color MidnightBlue ]
		}
		scale 2
		translate -1
	}
	emission rgb <0.8,0.8,1>
}

camera {
	location < -5, 10, -20>
	look_at < 0.0, 0.0, 0.0>
	right <image_width/image_height,0,0>
}