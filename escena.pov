global_settings {
	photons {
    	count 500000
    	autostop 0
    	jitter .4
	}
}

camera {
	location < -5, 10, -20>
	look_at < 0.0, 0.0, 0.0>
	right <image_width/image_height,0,0>
}

plane {
	<0, 1, 0>, 0	
		texture {
			pigment{
				color White
			}
		}
}

light_source {
	< 0, 100, 100>
	color rgb <1, 1, 1>
	photons{
		reflection on
		refraction on
	}
}