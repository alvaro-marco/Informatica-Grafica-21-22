#include "colors.inc"
#include "woods.inc"
/*------------------------------------------------------------------------*/
camera {
    //location <0, 50, 0> //Cenital centrada
    //location <0, 40, -20> //Frontal picada 40
    location <30, 20, -20> //Frontal picada 20
    //location <0, 10, -50> //Frontal picada 10
    //location <0, 5, -30> //Frontal picada 5
    //location <0, 3, -20> //Frontal picada 3
    //location <0, 0, -20> //Frontal normal
    
    look_at <0, 2, 0>
}
/*------------------------------------------------------------------------*/
light_source {
    <0, 2, -10>
    color rgb <1, 1, 1>
}  
light_source {
    <0, 20, 0>
    color rgb <1, 1, 1>
  }
/*------------------------------------------------------------------------*/      
//Mesa (suelo)
plane{
    <0,1,0>,0 //Vector normal, distancia
    texture{
        pigment{color Red}
    }
} 
//Fondo
plane{
    <0,0,-1>,-10
    pigment{color Blue}
}  

/*
------------------------------------------Rotando una forma    
*/

#declare ContornoBotella = object {
    sor{
        11,
        <0,1>
        <2,1>
        <3,1.2>
        <3.5,2>
        <3.5,8>
        <3,8.5>
        <2,8.6>
        <1,8.7>
        <0.75,9>
        <1.2,9.5>
        <1,10>
        texture {
            pigment{
                color White
                filter 0.5
                transmit 0.2
            }
        }
        finish{
            phong 5
        }
        interior { 
            ior 1.2
        }
        normal {
            gradient x
            normal_map {
                [0.9  marble turbulence 0 scale 5]
            }
        }
    }
}

#declare Botella = object{
    difference{
        object{ContornoBotella}
        union{
            object{
                ContornoBotella
                scale <0.9,0.9,0.9>
            }
            cylinder{
                <0,7,0>
                <0,11,>
                0.72
            }
        }
    }
}