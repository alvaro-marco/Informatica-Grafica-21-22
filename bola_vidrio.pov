#include "colors.inc"
#include "glass.inc"
#include "Rand.inc"


#declare R = 5;
#declare D = R * 2;
	
camera {
	location < -10, 10, -10>
	look_at < 0.0, R, 0.0>
}

difference{
	
	sphere {
		<0.0, R, 0.0>, R
		texture {
			pigment{
				color Col_Glass_Yellow
			}
		}
	}
	
	#declare S = seed(0);
	#for(Index, 0, 400) 
		sphere {
			<D*rand(S)-R, D*rand(S), D*rand(S)-R>, rand(S)*0.2+0.1
			texture {
				pigment{
					color Col_Glass_Yellow
				}
			}
		}
	#end
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
	< 100, 100, 100>
	color rgb <1, 1, 1>
}
