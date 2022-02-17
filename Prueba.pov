#include "colors.inc"
#include "woods.inc"
/*------------------------------------------------------------------------*/
camera {
    //location <0, 50, 0> //Cenital centrada
    //location <0, 40, -20> //Frontal picada 40
    //location <0, 20, -20> //Frontal picada 20
    //location <0, 10, -20> //Frontal picada 10
    location <0, 5, -20> //Frontal picada 5
    //location <0, 3, -20> //Frontal picada 3
    //location <0, 0, -20> //Frontal normal
    
    look_at <0, 0, 0>
}
/*------------------------------------------------------------------------*/
light_source {
    <0, 20, -20>
    color rgb <1, 1, 1>
}  
light_source {
    <0, 10, 0>
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
difference{
    merge{
        sor{ // Cuenco
            7,
            <3,0>,<2.7,1>,<2.5,2.5> //Base --> 3 puntos
            ,<3.5,3>,<4.5,5>,<5,6>,<6,7>// Bol --> 4 puntos
            //,<5.5,7.5>,<8,9>            
        
            pigment{color White}
        } 
        torus{
            4.65,0.3
            translate <0,6,0>
            pigment {color White}
        }
       
    }
   
    sphere { // Hueco del cuenco    
        <0,7,0>, 4.7       
        pigment {color Grey}
    }
}