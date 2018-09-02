//
//  ViewController.swift
//  SelfResizingCollectionView
//
//  Created by Sanad Barjawi on 9/2/18.
//  Copyright © 2018 Sanad Barjawi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    /*
     1- Add a height constraint to your collection view.
     2- Set its priority to 999.
     3- Set its constant to any value that only makes it reasonably visible on the storyboard.
     4- Change the bottom equal constraint of the collection view to greater or equal.
     5- Connect the height constraint to an outlet.
     6- Set the priority for the parent view HEIGHT constraint to be less than the priority  of collectionview BOTTOM'S constraint.(eg: bottoms 1000, height 999).
     7- Every time you reload the data on the collection view do the following:

     let height = collectionView.collectionViewLayout.collectionViewContentSize.height
     collectionViewHeight.constant = height
     self.view.layoutIfNeeded()
     */
    
    @IBOutlet weak var collectionViewTest: UICollectionView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewTest.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }

}
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = UIColor.red
        let height = collectionView.collectionViewLayout.collectionViewContentSize.height
        collectionViewHeight.constant = height
        self.view.layoutIfNeeded()
        return cell
    }
}
