//
//  OnBoardVC.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 15.01.2022.
//

import UIKit
import Lottie

class OnBoardVC: UIViewController {
    @IBOutlet weak var onBoardCollectionView: UICollectionView!
    @IBOutlet weak var onBoardPageControl: UIPageControl!
    var pages:[Page]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pages = [Page(animationName: "animation1", title: "Çeşit Çeşit Lezzetler", description: "Çeşitli lezzetlerin bir araya geldiği bu uygulama ile dilediğin yemeği bulabilirsin !"),
                                 Page(animationName: "animation2", title: "Sıcacık Lezzetler", description: "Sıcacık lezzetlerimizi müşterilerimize aynı biçimde ulaştırıyoruz."),
                                 Page(animationName: "animation3", title: "Hızlı Teslimat", description: "Hızlı teslimat avantajları ile yemeğini beklemene gerek yok !")]
                
        self.onBoardCollectionView.backgroundColor = .white
        self.onBoardCollectionView.dataSource = self
        self.onBoardCollectionView.delegate = self
                
        // set the number of pages to the number of Onboarding Screens
        self.onBoardPageControl.numberOfPages = pages!.count
        

    }
    @IBAction func getStartedButton(_ sender: Any) {
        print("Move to other view controller")
    }
    
    @IBAction func pageChanged(_ sender: UIPageControl) {
        onBoardCollectionView.scrollToItem(at: IndexPath(item: sender.currentPage, section: 0), at: .centeredHorizontally, animated: true)
    }
    
}

extension OnBoardVC : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onBoardCollectionViewCell", for: indexPath) as! OnBoardCollectionViewCell
        let currentItem = pages![indexPath.row]
        
        cell.animation = AnimationView(name: currentItem.animationName)
        cell.animation.frame = CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height * 0.8)
                
        // customize the animation
        cell.animation.animationSpeed = 1
        cell.animation.loopMode = .loop
        cell.animation.play()
                
        cell.animationContainer.addSubview(cell.animation)
                
                // set the title and description of the screen
        
                cell.titleLabel.text = currentItem.title
                cell.descriptionTextView.text = currentItem.description
                return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                            sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: self.onBoardCollectionView.frame.width, height: self.onBoardCollectionView.frame.height)
        }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let horizontalCenter = width / 2

        self.onBoardPageControl.currentPage = Int(offSet + horizontalCenter) / Int(width)
    }

}
