#declare Pared = object {
    union{
        difference{
            box {
                < -1, 0, -0.1>, < 1, 1, 0.1>
                scale <50, 30, 1>
                rotate<0, -20, 0>
                translate <-10, 0, 35>
                pigment {
                    rgb <0.1607843, 0.17254, 0.1450980>
                }   
            }
            sphere {
                <0,0,0> 20
                pigment{
                    rgb <7/255, 8/255, 6/255>
                }    
                translate <35,25,45>
            } 
        } 
        box {
        <-1.0,-0.1> <1,1,100>
        scale<100,1,1>     
        rotate<0, -20, 0>
            translate <-10, 0, 35>
            pigment {
                rgb <7/255, 8/255, 6/255>
            }  
        }    
    }   
}

#declare Suelo = object{
    plane{
        <0,1,0>,0 //Vector normal, distancia
        texture{
            pigment{color White}
        }  
        finish{
            reflection .05
        }
    }
}