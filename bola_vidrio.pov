#include "colors.inc"
#include "glass.inc"
#include "Rand.inc"


global_settings {
	photons {
    	count 500000
    	autostop 0
    	jitter .4
	}
}

#declare R = 5;
#declare D = R * 2;
	
camera {
	location < -20, 20, -10>
	look_at < 0.0, R, 0.0>
	right <image_width/image_height,0,0>
}

#macro MakeGlassSphere(loc, rad, indexofref)
sphere {
	loc, rad
	texture {
		pigment{
			color OrangeRed
			filter 0.7
			transmit 0.2
		}
	}
	finish{
		phong 0.4
	}
	interior { 
		ior indexofref
	}
}
#end

difference {
	
	MakeGlassSphere(<0.0, R, 0.0>, R, 1.5)
	
	
	#declare S = seed(0);
	#for(Index, 0, 400) 
		MakeGlassSphere(<D*rand(S)-R, D*rand(S), D*rand(S)-R>, rand(S)*0.2+0.1, 1)
	#end

	photons{
		target
		reflection on
		refraction on
	}
}

plane {
	<0, 1, 0>, 0	
	
		texture {
			pigment{
				color Grey
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
