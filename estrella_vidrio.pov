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
	MakeStar(5, 0.1, 10)
	rotate<0,0,0>
}

#declare Estrella2 = object {
	MakeStar(5, 0.1, 9)
	rotate<0,180,0>
}

#declare Estrella3 = object {
	MakeBeveledHex(4.5, 0.01, 7)
	rotate<0, 90, 0>
	translate <0, 1, 0>
}

#declare Agujero = object {
	MakeBeveledHex(3.35, 0.05, 20)
	rotate<0, 90, 0>
}

difference {
	union{
		object{Estrella1}
		object{Estrella2}
		object{Estrella3}
	}
	object{Agujero}
	texture {
		pigment{
			color Blue
			//color Col_Glass_Bluish
		}
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
	< -50, 100, 0>
	color rgb <1, 1, 1>
}
