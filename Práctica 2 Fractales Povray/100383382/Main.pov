#include "colors.inc"
#include "woods.inc"
#include "Cuadro.pov"
#include "Museo.pov" 
#include "peana.pov"


/*
global_settings {
	photons {
    	count 500000
    	autostop 0
    	jitter .4
	}
} 
*/
/*------------------------------------------------------------------------*/
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

global_settings {
	photons {
    	count 500000
    	autostop 0
    	jitter .4
	} 
	max_trace_level 25
	//ambient_light 0
	assumed_gamma 1
} 

camera {
    //location <0, 1000, 0> //Cenital centrada
    //location <0, 40, -20> //Frontal picada 40
    location <30, 50, -200> //Frontal picada 20
    //location <0, 10, -50> //Frontal picada 10
    //location <0, 5, -30> //Frontal picada 5
    //location <0, 3, -20> //Frontal picada 3
    //location <0, 0, -20> //Frontal normal
    
    //location <10, 50, -80>
    
    look_at <100, 0, 50>                            
    
	//right <1/1,0,0>
	right <image_width/image_height,0,0>
	//angle 30
}
                
light_source {
	<1, 10, -3>, 1.3
	parallel
	point_at 0
	                                                 
	                                                 
}
//------------------------------------------------------------------------*/  
//http://paulbourke.net/fractals/povfrac/final/
//http://www.f-lohmueller.de/pov_tut/tex/tex_760e.htm

object{
    museo
}   
object {
    cuadro1
    translate <0,10,-1>
    scale <3.5,3.5,0>
}
object {
    cuadro2
    translate <7,10,35.5>
    rotate <0,90,0>
    scale 3.5
}    
    
object {
    cuadro3
    scale <3.5,3.5,0>
    rotate <0,90,0>  
    translate <124.5,15,60>
}  
object {
    esculturaPeana  
    rotate <0,30,0>
    translate <50,0,-120>
}

object {
  escultura2 
  scale 75 
  translate <200,50,400>
}
