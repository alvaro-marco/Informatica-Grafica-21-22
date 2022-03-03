#include "colors.inc"
#include "glass.inc"
#include "Rand.inc"

#macro MakeGlassSphere(loc, rad)
sphere {
	loc, rad
	texture {
		pigment{
			color OrangeRed
			filter 0.7
			transmit 0.2
		}
	}
}
#end

#declare BolaVidrio = object{
	#declare R = 5;
	#declare D = R * 2;
	difference {		
		object {
			MakeGlassSphere(<0.0, R, 0.0>, R)
			interior { 
				ior 1.5
			}
		}
		
		
		#declare S = seed(0);
		#for(Index, 0, 400) 
			object {
				MakeGlassSphere(<D*rand(S)-R, D*rand(S), D*rand(S)-R>, rand(S)*0.2+0.1)
				interior { 
					ior 1
				}
			}
		#end

		finish{
			phong 0.4
		}
		photons{
			target
			reflection on
			refraction on
		}
	}
}