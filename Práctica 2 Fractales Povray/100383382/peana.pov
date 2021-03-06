#include "colors.inc"
#include "woods.inc"     
#include "escultura.pov"


/*
global_settings {
	photons {
    	count 500000
    	autostop 0
    	jitter .4
	}
} 
*/

/*------------------------------------------------------------------------
camera {
    //location <0, 80, 0> //Cenital centrada
    //location <0, 40, -20> //Frontal picada 40
    //location <30, 20, -200> //Frontal picada 20
    location <0, 30, -50> //Frontal picada 10
    //location <0, 5, -30> //Frontal picada 5
    //location <0, 3, -20> //Frontal picada 3
    //location <0, 0, -20> //Frontal normal
    
    //location <10, 50, -80>
    
    look_at <0, 30, 0>                            
    
	right <1/1,0,0>
	//right <image_width/image_height,0,0>
	//angle 30
}
//------------------------------------------------------------------------
light_source {
	<-15, 50, -20>, 1.3
	parallel
	point_at 0
	
}
//------------------------------------------------------------------------*/ 
#declare peana = object {
    union{
        box {
            <0,0,0>
            <10,30,10>
            texture{
                pigment{
                    color White
                }
            }
        }
        box {
            <-1,30,-1>
            <11,31,11>
            texture{
                T_Wood23
            }
        }
    }
}

#declare esculturaPeana = object {
    union{
        object {peana}   
        object {
            escultura1        
            scale 4
            translate <5,35,5>
        }
    }
}
