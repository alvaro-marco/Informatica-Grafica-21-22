#include "colors.inc"
#include "woods.inc"
#include "Cuenco.pov"
#include "Ambientador.pov"
#include "bola_vidrio.pov"
#include "estrella_vidrio.pov"
#include "Escena.pov"


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
        [0.5 color Grey]
        [1 color Blue]
      }
      scale 2
      translate -1
    }
  }


/*------------------------------------------------------------------------*/
camera {
    location <0, 80, 0> //Cenital centrada
    //location <0, 40, -20> //Frontal picada 40
    //location <30, 20, -20> //Frontal picada 20
    //location <0, 10, -50> //Frontal picada 10
    //location <0, 5, -30> //Frontal picada 5
    //location <0, 3, -20> //Frontal picada 3
    //location <0, 0, -20> //Frontal normal
    
    //location <10, 50, -80>
    
    look_at <0, 6, 0>                            
    
	right <1/1,0,0>
	//right <image_width/image_height,0,0>
	//angle 30
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
	<10, 150, 200>, 1.3
	parallel
	point_at 0
	
}
/*------------------------------------------------------------------------*/      
//Mesa (suelo)
 object {Suelo}
//Fondo

object{Pared}    
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
	scale 1.1
	translate <-7, 0, -7>	
}
object{
	EstrellaVidrio
	scale <1.3,1.7,1.3>
	rotate <0, 30, 0>
	translate <-6, 0, 15>	
}

