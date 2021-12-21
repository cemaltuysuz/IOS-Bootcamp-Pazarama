//
//  Action.swift
//  Work5
//
//  Created by cemal tüysüz on 21.12.2021.
//

import Foundation

/**
Enum sınıfı collectionView üzerinde tuş takımını listelerken
 hangi tuşun neyi ifade ettiğini anlamamı sağlayacak. (Rakam mı ? İşlem mi ? etc.)
  */
enum ActionType {
    case Num
    case Process
}
/**
 actionId referansı ile bir field oluşturmamın sebebi işlem process ise hangi process olduğuna karar vermek.
 Bu durumu aslında button içerisindeki yazıyı kontrol ederek de sağlayabilirdim lakin hardcode şeklinde bir String karşılaştırması yapmayı uygun gormedim.
 */
class Action {
    var actionId:Int?
    var action:String?
    var type:ActionType?
    
    init(){
        
    }
    
    init(actionId:Int,action:String,type:ActionType){
        self.actionId = actionId
        self.action = action
        self.type = type
    }
}
