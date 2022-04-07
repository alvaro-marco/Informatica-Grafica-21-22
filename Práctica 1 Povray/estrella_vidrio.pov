#include "colors.inc"
#include "glass.inc"
#include "Rand.inc"

//#include "escena.pov"

#macro MakeStar(rad, bevel, height)
	prism {
		linear_sweep 
		linear_spline 
		0,
		height,
		6,
		
		<cos(0 - bevel)*rad, sin(0 - bevel)*rad>,
		<cos(0 + bevel)*rad, sin(0 + bevel)*rad>,
		<cos(2*pi/3 - bevel)*rad, sin(2*pi/3 - bevel)*rad>,
		<cos(2*pi/3 + bevel)*rad, sin(2*pi/3 + bevel)*rad>,
		<cos(4*pi/3 - bevel)*rad, sin(4*pi/3 - bevel)*rad>,
		<cos(4*pi/3 + bevel)*rad, sin(4*pi/3 + bevel)*rad>
	}
#end

#macro MakeBeveledHex(rad, bevel, height)
	prism {
		linear_sweep
		linear_spline
		0,
		height,
		12,

		<cos(0 - bevel)*rad, sin(0 - bevel)*rad>,
		<cos(0 + bevel)*rad, sin(0 + bevel)*rad>,
		<cos(2*pi/6 - bevel)*rad, sin(2*pi/6 - bevel)*rad>,
		<cos(2*pi/6 + bevel)*rad, sin(2*pi/6 + bevel)*rad>,
		<cos(4*pi/6 - bevel)*rad, sin(4*pi/6 - bevel)*rad>,
		<cos(4*pi/6 + bevel)*rad, sin(4*pi/6 + bevel)*rad>,
		<cos(6*pi/6 - bevel)*rad, sin(6*pi/6 - bevel)*rad>,
		<cos(6*pi/6 + bevel)*rad, sin(6*pi/6 + bevel)*rad>,
		<cos(8*pi/6 - bevel)*rad, sin(8*pi/6 - bevel)*rad>,
		<cos(8*pi/6 + bevel)*rad, sin(8*pi/6 + bevel)*rad>,
		<cos(10*pi/6 - bevel)*rad, sin(10*pi/6 - bevel)*rad>,
		<cos(10*pi/6 + bevel)*rad, sin(10*pi/6 + bevel)*rad>
		
	}
#end

#declare Estrella1 = object {
	MakeStar(5, 0.1, 7.9)
	rotate<0,0,0>
}

#declare Estrella2 = object {
	MakeStar(5, 0.1, 7)
	rotate<0,180,0>
}

#declare Estrella3 = object {
	MakeBeveledHex(4.5, 0.01, 5)
	rotate<0, 90, 0>
	translate <0, 1, 0>
}

#declare Agujero = object {
	MakeBeveledHex(3.35, 0.05, 20)
	rotate<0, 90, 0>
}


#declare EstrellaVidrio = object{

	#declare A = 0.1;
	#declare R = 5;

	difference {
		object{
			union{
				object{Estrella1}
				object{Estrella2}
				object{Estrella3}
			}
		}
		object{Agujero}
		texture {
			pigment{
				color Grey
				filter 0.4
				transmit 0.5
			}
		}
		finish{
			phong 5
		}
		interior { 
			ior 1.5
		}
		photons{
			target
			reflection on
			refraction on
		}
		normal {
			gradient x
			normal_map {
				[0.9  marble turbulence 0.5 scale 5]
			}
		}
        finish{
            reflection .02
        }
    }
}