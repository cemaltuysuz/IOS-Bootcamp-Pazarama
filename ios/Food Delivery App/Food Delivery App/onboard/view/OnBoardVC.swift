//
//  OnBoardVC.swift
//  Food Delivery App
//
//  Created by cemal tüysüz on 15.01.2022.
//

import UIKit

class OnBoardVC: UIViewController {
    @IBOutlet weak var onBoardCollectionView: UICollectionView!
    @IBOutlet weak var onBoardPageControl: UIPageControl!
    var pages:[Page]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pages = [Page(animationName: "animation1", title: "Learn to Code", description: "Find awesome tutorials on how to code and improve your coding practices"),
                                 Page(animationName: "animation2", title: "Code with Friends", description: "Practice with friends and solve problems together to earn points"),
                                 Page(animationName: "animation3", title: "Always there to Help", description: "Having Trouble? Get guidance from our experienced Mentors")]
                
        self.onBoardCollectionView.backgroundColor = .white
        self.onBoardCollectionView.dataSource = self
        self.onBoardCollectionView.delegate = self
        self.onBoardCollectionView.register(OnBoardCollectionViewCell.self, forCellWithReuseIdentifier: "onBoardCollectionViewCell")
                
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

extension OnBoardVC : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onBoardCollectionViewCell", for: indexPath) as! OnBoardCollectionViewCell
                // function for configuring the cell, defined in the Custom cell class
                cell.configureCell(page: pages![indexPath.item])
                return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                            sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: self.onBoardCollectionView.frame.width, height: self.onBoardCollectionView.frame.height)
        }
    
    func scrollViewDidzEndDecelerating(_ scrollView: UIScrollView) {
        self.onBoardPageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        }

}
