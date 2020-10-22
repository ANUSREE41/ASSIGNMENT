import Foundation
var checkFermat = {
    (a: Float, b: Float, c: Float, n: Float) -> String in 
     
        if n>2 && (pow (a,n) + pow (b,n)  == pow(c,n)) {
        return "Holy smokes,Fermat was Wrong!"
        }
    
        else {
        return "No, that doesn't work"
        }
 }

    print (checkFermat (1,2,3,4))