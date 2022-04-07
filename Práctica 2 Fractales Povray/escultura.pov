/* --------------------------
Entry: 0024
WWW: http://www.b0n541.net
Title: Julia Gold Nugget
Author: Bonsai
---------------------------*/

// Julia Gold Nugget

//#version 3.5;  
/*-------------------------------------------------------------------------    
global_settings {
	max_trace_level 25
	ambient_light 0
	assumed_gamma 1
}    
background {
	
	color rgb 0.25
}//-------------------------------------------------------------------------    
camera {
	location <0, 1, -3>
	look_at <0, 0, 0>          
	right x*image_width/image_height
}                
light_source {
	<-15, 15, -15>
	color rgb 1
    area_light
    <4, 0, 4>, <0, 4, 4>, 10, 10
    adaptive 1 
	jitter
    circular
}
light_source {
	<0, 5, 5>
	color rgb 0.5
	
	shadowless
}
light_source {
	<5, 0, 0>
	color rgb 0.5
	shadowless
}
//-------------------------------------------------------------------------      
difference {
	cylinder {
		
		<-100, 20, 0>,
		< 100, 20, 0>, 21
	}
	
	cylinder {
		
		<-101, 20, 0>,
		< 101, 20, 0>, 20
	}
	
	box {
		
		<-101, -2, -22>,
		< 101, 42,   0>
	}
	
	translate <0, -1, 10>
	
	material {
		
		texture {
			
			pigment {
				
				color rgb 1
			}
		}
	}
}    
plane {
	
	<0, 1, 0>, -1
	
	material {
		
		texture {
			
			pigment {
				
				color rgb 1
			}
		}
	}
}     
//------------------------------------------------------------------------- */  
#declare iteration = 3;     

#declare base = object{
    union {
        
        #while (iteration < 7)
            
            difference {
                
                julia_fractal {
                    
                    <-0.083, 0.0, -0.83, -0.025>
                    quaternion
                    sqr
                    max_iteration iteration
                    precision 10
                    rotate <0, 0, 45>
                }
                
                box {
                    
                    <-4, 0.5 - 2/iteration, -4>, <4, 2, 4>
                }
                material {
            
                    // Copied from stones1.inc
                    // T_Grnt15		
                    texture {
                        
                        pigment {
                            
                            granite
                            turbulence 0.6
                            
                            #declare brighten = 0.2*(iteration - 3);
                            
                            color_map {
                                
                                [0.000, 0.104   color rgbt <0.161, 0.133, 0.118, 0.000> + brighten
                                                color rgbt <0.110, 0.082, 0.071, 0.000>]
                                [0.104, 0.252   color rgbt <0.110, 0.082, 0.071, 0.000> 
                                                color rgbt <0.161, 0.133, 0.118, 0.000> + brighten]
                                [0.252, 0.383   color rgbt <0.161, 0.133, 0.118, 0.000> + brighten 
                                                color rgbt <0.000, 0.000, 0.000, 0.000>]
                                [0.383, 0.643   color rgbt <0.000, 0.000, 0.000, 0.000> 
                                                color rgbt <0.161, 0.133, 0.118, 0.000> + brighten]
                                [0.643, 0.783   color rgbt <0.161, 0.133, 0.118, 0.000> + brighten
                                                color rgbt <0.220, 0.149, 0.137, 0.000> + brighten]
                                [0.783, 0.922   color rgbt <0.220, 0.149, 0.137, 0.000> + brighten
                                                color rgbt <0.000, 0.000, 0.000, 0.000>]
                                [0.922, 0.983   color rgbt <0.000, 0.000, 0.000, 0.000> 
                                                color rgbt <0.220, 0.149, 0.137, 0.000> + brighten]
                                [0.983, 1.001   color rgbt <0.220, 0.149, 0.137, 0.000> + brighten
                                                color rgbt <0.161, 0.133, 0.118, 0.000> + brighten]
                            }
                        }
                        
                        scale 0.2
                    }
                }
            }
            #declare iteration = iteration + 1;
            
        #end                        
    }
} 
#declare rosco = object {
    julia_fractal {
        <-0.083, 0.0, -0.83, -0.025>
        quaternion
        sqr
        max_iteration 9
        precision 50
        
        rotate <0, 0, 45>
        
        material {
            
            texture {
                
                // Copied from golds.inc
                // T_Gold_1A
                #declare GoldBase = <1.00, 0.875, 0.575>;
                #declare CVect1 = GoldBase  - <0.00, 0.20, 0.40>;
                #declare P_Gold1 = rgb CVect1;
                #declare R_GoldA =  P_Gold1 * 0.30 + 0.25;
                #declare A_GoldA =  P_Gold1 * 0.12 + 0.1;
                #declare D_GoldA    = 1-(((R_GoldA.red+R_GoldA.green+R_GoldA.blue)/3)
                                        + ((A_GoldA.red+A_GoldA.green+A_GoldA.blue)/3));
                
                #declare D_GoldA = max(D_GoldA, 0);
                
                #declare F_MetalA  = finish {
                    brilliance 2
                    diffuse D_GoldA
                    ambient A_GoldA
                    reflection R_GoldA
                    metallic 1
                    specular 0.20
                    roughness 1/20
                }			
                pigment { P_Gold1 } 
                finish { F_MetalA }
            }
        }
    }
} 

//-----------------------------------------------------------------------------------------------------------------------   
/* --------------------------
Entry: 0026
WWW: http://www.student.tue.nl/e/r.a.m.vliegen
Title: RingSphere
Author: Roel Vliegen

This is a basic recursive object. The only trick I used was the use of focal blur to fake some antialiasing. I do not know how to set antialiasing from within the pov-file. 
It is a simple object, but I like the "openness" very much.
---------------------------*/

// runtime about 3 hours 20 minutes on 2.93Ghz Xeon.
// Declaring T_Chrome_1A texture so no include is needed

#declare F_MetalA  = finish { ambient 0.35 brilliance 2 diffuse 0.3 metallic specular 0.80 roughness 1/20 reflection 0.1 }  
#declare P_Chrome1   = color rgb <0.20, 0.20, 0.20>;
#declare T_Chrome_1A = texture { pigment { P_Chrome1 } finish { F_MetalA  } }

/*  
camera 
{                    
   right 0.5*x  up 0.5*y
             
   location <4,4,0>
   look_at 0   
   
   // focal blur instead of antialiasing... 
   aperture 1/10000
   blur_samples 10
}    
     
sky_sphere { pigment { color rgb 1 } }
light_source {< 20, 10, 50> color rgb <1,1,1> }
light_source {< 50, 10, 20> color rgb <1,1,1> }
light_source {< 0, 0, -20> color rgb <1,1,0> }

*/
// declare basis object for recursion: ringsphere
#declare ring = torus { 1, 0.04 }
#declare ringsphere = 
   union {
      object { ring }
      object { ring rotate <90,0,0> }
      object { ring rotate <0,0,90> }
   }
      
// create fractal object from basisobject                
#declare fractal = ringsphere;             
#declare aaa = 0;               
#while (aaa<4)               
   #declare fractal =                
      union {                
         object { ringsphere }                
         object { fractal scale 0.5 translate <0.5,0,0> }                
         object { fractal scale 0.5 translate <-0.5,0,0> }                
         object { fractal scale 0.5 translate <0,0.5,0> }                
         object { fractal scale 0.5 translate <0,-0.5,0> }                
         object { fractal scale 0.5 translate <0,0,0.5> }                
         object { fractal scale 0.5 translate <0,0,-0.5> }                
      }             
   #declare aaa = aaa + 1;
#end                 
#declare MAT = 
   material {
      texture {
         pigment {rgbt <0.8,0.8,0.0,0.3>}
         finish {
            reflection { 0.1, 1.0 fresnel on }
            conserve_energy
         }
      }     
      interior { ior 2 } 
   }      
#declare escultura2 = object {                   
   fractal rotate <20,30,40>                  
   material { MAT }
}
/*object {
   fractal rotate <0,45,> scale 20 translate <4,4,0>*(-4) 
   texture { T_Chrome_1A }
}*/

//-----------------------------------------------------------------------------------------------------------------------   
#declare escultura1 = object{
    union{
        object{base}
        object {rosco}
    }
}

//object {escultura2}
