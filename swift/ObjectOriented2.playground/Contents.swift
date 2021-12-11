import UIKit

class Home{
    var windowCount:Int?
    init(windowCount:Int) {
        self.windowCount = windowCount
    }
}

class Palace : Home{
    var towerCount:Int?
    init(towerCount:Int,windowCount:Int) {
        self.towerCount = towerCount
        super.init(windowCount: windowCount)
    }
}

class Villa : Home{
    var garage:Bool?
    init(garage:Bool,windowCount:Int) {
        self.garage = garage
        super.init(windowCount: windowCount)
    }
}

var topkapiPalace = Palace(towerCount: 30, windowCount: 100)
var villa = Villa(garage: true, windowCount: 30)

print(topkapiPalace.towerCount!)
print(topkapiPalace.windowCount!)

print(villa.garage!)
print(villa.windowCount!)


