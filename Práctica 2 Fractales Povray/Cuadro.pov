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


camera {
    //location <0, 80, 0> //Cenital centrada
    //location <0, 40, -20> //Frontal picada 40
    //location <30, 20, -20> //Frontal picada 20
    location <0, 10, -50> //Frontal picada 10
    //location <0, 5, -30> //Frontal picada 5
    //location <0, 3, -20> //Frontal picada 3
    //location <0, 0, -20> //Frontal normal
    
    //location <10, 50, -80>
    
    look_at <0, 0, 0>                            
    
	right <1/1,0,0>
	//right <image_width/image_height,0,0>
	//angle 30
}                      

light_source {
	<10, 150, -200>, 1.3
	parallel
	point_at 0
	
}


//------------------------------------------------------------------------*/    	

#declare Pigment_1 = pigment { magnet 1
    julia <0.360, 0.250>, 20  interior 1, 1
    scale 0.26 rotate<0,40,0>
    color_map{[0.0 color rgb <1,0.5,0>]
            [0.1 color rgb <1,0,0.5>]
            [0.4 color rgb <1,1,0>]
            [1.0 color rgb <1,1,1>]
            [1.0 color rgb <0,0,0>]}
}
         
 	

#declare Pigment_2 = pigment{ magnet 2 // magnet type 1 or 2
    mandel 20  interior 1, 1
    scale  0.36 rotate<0,40,0>
    color_map{[0.0 color rgb <0,0.5,0>]
            [0.2 color rgb <0,0,1>]
            [0.4 color rgb <1,0.5,0>]
            [1.0 color rgb <1,1,1>]
            [1.0 color rgb <0,0,0>]}
}

#declare Pigment_3 = pigment{ mandel 50 exponent 2 //2...33
         // interior 1,2 exterior 1,2
         scale 0.50 translate<0.15,0,0>
         color_map{[0.00 color rgb <0.5,0,0.25>]
                   [0.08 color rgb <0.8,0,0.10>]
                   [0.20 color rgb <1,0.4,0.05>]
                   [0.30 color rgb <1,0.7,0>]
                   [0.60 color rgb <0.0,0,0>]
                   [0.80 color rgb <0,0,0>]
                   [1.00 color rgb <251/255,132/255,240/255>]}
}

#declare cuadro1 = object {
    difference{
        box {
            <0,0,0>
            <2,1,0.1>
            pigment{
                Pigment_2
            }
        }
        scale 10
    }
}

#declare cuadro2 = object{      
    box {
        <0,0,0>
        <2,1,0.1>
        pigment{ 
            Pigment_1
        } 
        normal { 
            pigment_pattern { Pigment_1 }
                3 
        } 
        finish { phong 1 }
        scale 10
    }
}

#declare cuadro3 = object{      
    box {
        <0,0,0>
        <0.5,1,0.05>
        pigment{ 
            Pigment_3
        } 
        normal { 
            pigment_pattern { Pigment_3 }
                3 
        } 
        finish { phong 1 }
        scale 20
    }
}
/*
object {cuadro1}
object {
    cuadro2
    translate <-20,0,0>
    }
object {cuadro3}
*/