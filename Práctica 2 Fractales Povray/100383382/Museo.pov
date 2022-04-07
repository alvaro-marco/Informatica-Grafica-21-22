#include "colors.inc"
#include "woods.inc"   


/*
global_settings {
	photons {
    	count 500000
    	autostop 0
    	jitter .4
	}
} 
*/

/*------------------------------------------------------------------------ */    
camera {
    location <0, 1000, 0> //Cenital centrada
    //location <0, 40, -20> //Frontal picada 40
    //location <30, 20, -200> //Frontal picada 20
    //location <0, 10, -50> //Frontal picada 10
    //location <0, 5, -30> //Frontal picada 5
    //location <0, 3, -20> //Frontal picada 3
    //location <0, 0, -20> //Frontal normal
    
    //location <10, 50, -80>
    
    look_at <100, 0, 50>                            
    
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
//------------------------------------------------------------------------ */                  
#declare pared = object {
    box{
        <0,-10,0>
        <10,10,10>
        texture{
            pigment{
                color White
            }
        }
    }
}

#declare suelo = object {
    plane {
        <0,1,0>,0
        texture{
            T_Wood26             //6 14  15  16 22  26
        }
        scale<100,0,100>
    }
}    

#declare techo = object {
    box{
        <-50,100,-100>
        <150,110,100>
        texture{
            T_Wood5
        }
    }
}


#declare museo = object{ 
    merge{
        object {
            pared
            scale <13,10,10>
            translate <-50,0,0>
        }
        object {
            pared
            scale <30,10,3>
            translate<-80,0,125>
            rotate <0,90,0>
        }  
        object{
            pared             
            scale <30,20,1>
            translate <0,0,500>
        }
        object {suelo}
        object {techo}
    }
}



//object{museo}   
