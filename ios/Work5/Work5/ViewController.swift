//
//  ViewController.swift
//  Work5
//
//  Created by cemal tüysüz on 21.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var keyboardCollectionView: UICollectionView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var historyLabel: UILabel!
    @IBOutlet weak var inputLabel: UILabel!
    
    var actionList = [Action]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CollectionView üstüne mavi bir borderk ekledim.
        let thickness: CGFloat = 2.0
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0.0, y: 0.0, width: self.keyboardCollectionView.frame.size.width, height: thickness)
        topBorder.backgroundColor = UIColor(named: "blue500")?.cgColor
        keyboardCollectionView.layer.addSublayer(topBorder)
        
        fillTheList()
        
        keyboardCollectionView.delegate = self
        keyboardCollectionView.dataSource = self
                
        // Collection View için space / design ayarları
        let design = UICollectionViewFlowLayout()
        // inset (CollectionView)
        design.sectionInset = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2)
        // Horizontal space between Items (Item)
        design.minimumInteritemSpacing = 5
        // Vertical space between Items (Item)
        design.minimumLineSpacing = 5
        
        // Total horizontal space = Left Space(10) + Right Space(10) + 3 Count Item (5 + 5) -> 30
        let width = self.keyboardCollectionView.frame.width
        let heigth = self.keyboardCollectionView.frame.height
        
        design.itemSize = CGSize(width: (width-16)/3, height: (heigth)/CGFloat((actionList.count/3)))
        keyboardCollectionView!.collectionViewLayout = design
        
    }
    
    // Collection view üzerinde listeleyeceğim listemi doldurmak için hazırladığım method.
    func fillTheList(){
        actionList.append(Action(actionId: 1, action: "1", type: .Num))
        actionList.append(Action(actionId: 2, action: "2", type: .Num))
        actionList.append(Action(actionId: 3, action: "3", type: .Num))
        actionList.append(Action(actionId: 4, action: "4", type: .Num))
        actionList.append(Action(actionId: 5, action: "5", type: .Num))
        actionList.append(Action(actionId: 6, action: "6", type: .Num))
        actionList.append(Action(actionId: 7, action: "7", type: .Num))
        actionList.append(Action(actionId: 8, action: "8", type: .Num))
        actionList.append(Action(actionId: 9, action: "9", type: .Num))
        actionList.append(Action(actionId: 10, action: "C", type: .Process))
        actionList.append(Action(actionId: 11, action: "0", type: .Num))
        actionList.append(Action(actionId: 12, action: "+", type: .Process))
    }
}

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actionList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! AcCollectionViewCell
        
        let currentAction = actionList[indexPath.row]
        cell.cellLabel.text = currentAction.action
        
        // oluşturulan hücre process tipinde ise yazı rengi açık mavi olacak.
        if currentAction.type == .Process {
            cell.cellLabel.textColor = UIColor(named: "blue500")
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let action = actionList[indexPath.row]
        
        /**
         Kullanıcının tıkladığı action process değil de bir sayı ise direkt olarak input içerisine yazdırıyorum.
         */
        if action.type != .Process {
            if inputLabel.text != "0"{
                inputLabel.text = "\(inputLabel.text!)\(action.action!)"
            }else{
                inputLabel.text = "\(action.action!)"
            }
        }else {
            /**
             Kullanıcının tıkladığı action bir process ise switch-case ile hangi process olduğuna karar vererek o process'e ait yapılması gereken işlemi gerçekleştiriyorum.
             */
            switch action.actionId {
            case 10:
                inputLabel.text = "0"
                historyLabel.text = ""
                resultLabel.text = "0"
                break
            case 12:
                /**
                 Process toplamı işlemi ise ve input kısmında sadece 0 varsa etkisiz eleman ile toplama işleminin yapmanın anlamı olmadığından bu durumu kontrol ederek işlemi gerçekleştiriyorum.
                 */
                if inputLabel.text != "0"{
                    resultLabel.text = "\(Int(resultLabel.text!)! + Int(inputLabel.text!)!)"
                    historyLabel.text = "\(historyLabel.text!) +\(inputLabel.text!) "
                    inputLabel.text = "0"
                }
                break
            default:
                print("Not found.")
            }
        }
    }
    
    
}

