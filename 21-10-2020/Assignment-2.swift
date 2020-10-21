import Foundation
func checkFermat(a: Float, b: Float, c: Float, n: Float) { 
    
    if n>2 && (pow (a,n) + pow (b,n) == pow(c,n)) {
        print("Holy smokes,Fermat was Wrong!")
    }

    else {
            print("No, that doesn't work")
    }
}
    checkFermat(a: 1, b: 4, c: 5, n: 3)