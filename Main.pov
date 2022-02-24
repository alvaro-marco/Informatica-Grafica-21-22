#include "colors.inc"
#include "woods.inc"     
#include "Botella.pov"
#include "Cuenco.pov"
#include "Ambientador.pov"
/*------------------------------------------------------------------------*/
camera {
    //location <0, 50, 0> //Cenital centrada
    //location <0, 40, -20> //Frontal picada 40
    //location <30, 20, -20> //Frontal picada 20
    location <0, 10, -50> //Frontal picada 10
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
/*------------------------------------------------------------------------*/ 
union{
                sphere{
                    <5,6,3.75>
                    3.75
                }
                cylinder{
                    <5,6,3.75>
                    <5,11,3.75>
                    1
                }
            }