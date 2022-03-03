#include "colors.inc"
#include "woods.inc"
#include "Cuenco.pov"
#include "Ambientador.pov"
#include "bola_vidrio.pov"
#include "estrella_vidrio.pov"

/*
global_settings {
	photons {
    	count 500000
    	autostop 0
    	jitter .4
	}
}
*/

  sky_sphere {
    pigment {
      gradient y
      color_map {
        [0.5 color Grey]
        [1 color Blue]
      }
      scale 2
      translate -1
    }
  }


/*------------------------------------------------------------------------*/
camera {
    location <0, 150, 0> //Cenital centrada
    //location <0, 40, -20> //Frontal picada 40
    //location <30, 20, -20> //Frontal picada 20
    //location <0, 10, -50> //Frontal picada 10
    //location <0, 5, -30> //Frontal picada 5
    //location <0, 3, -20> //Frontal picada 3
    //location <0, 0, -20> //Frontal normal
    
    //location <0, 40, -80>
    
    look_at <0, 2, 0>                            
    
	right <image_width/image_height,0,0>
	angle 30
}
/*------------------------------------------------------------------------*/
/*
light_source {
    <0, 2, -10>
    color rgb <1, 1, 1>
}  
light_source {
    <0, 20, 0>
    color rgb <1, 1, 1>
  }
  */
light_source {
	<10, 130, 200>, 1.3
	parallel
	point_at 0
	
}
/*------------------------------------------------------------------------*/      
//Mesa (suelo)
plane{
    <0,1,0>,0 //Vector normal, distancia
    texture{
        pigment{color White}
    }
} 
//Fondo
box {
	< -1, 0, -0.1>, < 1, 1, 0.1>
	scale <50, 30, 1>
	rotate<0, -45, 0>
	translate <-10, 0, 40>
	pigment {
		rgb <0.1607843, 0.17254, 0.1450980>
	}

}
/*------------------------------------------------------------------------*/ 
object{Ambientador
	rotate<0, 5, 0>
	translate <5, 0, 5>
}

object{Cuenco
    scale 1.45
    translate <12,-2,-13>
}

object{
	BolaVidrio
	scale 1.35
	translate <-8, 0, -8>	
}
object{
	EstrellaVidrio
	scale 1.5
	rotate <0, 30, 0>
	translate <-6, 0, 17>	
}

