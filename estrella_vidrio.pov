#include "colors.inc"
#include "glass.inc"
#include "Rand.inc"


camera {
	location < -10, 20, -20>
	look_at < 0.0, 0.0, 0.0>
}

#declare A = 0.1;
#declare R = 5;

 // Prisma generado por extrusión
 #macro MakeStar(rad, bevel, height)
prism {
    linear_sweep  // También puede configurarse para que tome forma de pirámide conic_sweep
    linear_spline  // Tipo de función para unir los puntos ( quadratic_spline, cubic_spline… ojo puntos de control) 
    0, // Base
    height, // Altura
    6, // Puntos de la base
    
    <cos(0 - bevel)*rad, sin(0 - bevel)*rad>,
    <cos(0 + bevel)*rad, sin(0 + bevel)*rad>,
    <cos(2*pi/3 - bevel)*rad, sin(2*pi/3 - bevel)*rad>,
    <cos(2*pi/3 + bevel)*rad, sin(2*pi/3 + bevel)*rad>,
    <cos(4*pi/3 - bevel)*rad, sin(4*pi/3 - bevel)*rad>,
    <cos(4*pi/3 + bevel)*rad, sin(4*pi/3 + bevel)*rad>
	texture {
		pigment{
			color Blue//Col_Glass_Bluish
		}
	}
}
#end

 #macro MakeBeveledPrism(sections, rad, bevel, height)
prism {
    linear_sweep  // También puede configurarse para que tome forma de pirámide conic_sweep
    linear_spline  // Tipo de función para unir los puntos ( quadratic_spline, cubic_spline… ojo puntos de control) 
    0, // Base
    height, // Altura
    3, // Puntos de la base
    
     #declare a = 0;
     #declare interval = 2*pi/sections;
     
     
     { <0, 0>, <1, 0>, <0, 1> }
     /*
	#for(Index, 0, sections)
		<cos(interval - bevel)*rad, sin(0 - bevel)*rad>
	#end
	*/
	texture {
		pigment{
			color Blue//Col_Glass_Bluish
		}
	}
}
#end

#declare Estrella1 = object {
	MakeStar(5, 0.1, 10)
	rotate<0,0,0>
}

#declare Estrella2 = object {
	MakeStar(5, 0.1, 9)
	rotate<0,180,0>
}

#declare Agujero = object {
	MakeBeveledPrism(6, 4, 0.1, 10)
}

difference {
	union{
		object{Estrella1}
		object{Estrella2}
	}
	intersection{
		object{Estrella1}
		object{Agujero}
	scale 1.01
	}
}


plane{
	<0, 1, 0> 0	
	
	texture {
		pigment{
			color Grey
		}
	}
}

light_source {
	< 50, 100, 0>
	color rgb <1, 1, 1>
	rotate <0, 0, -clock*360>
}
