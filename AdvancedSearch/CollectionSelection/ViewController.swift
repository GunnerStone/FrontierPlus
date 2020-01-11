//
//  ViewController.swift
//  AdvancedSearch
//
//  Created by Frontier Companion on 1/9/20.
//  Copyright © 2020 Frontier Companion. All rights reserved.
//

import UIKit

protocol CanRecieve {
    func passDataBack(data: String)
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var delegate:CanRecieve?
    var data = ""
    
    private let sectionInsets = UIEdgeInsets(top:10.0,
                                             left: 10.0,
                                             bottom: 10.0,
                                             right: 0.0)
    private let itemsPerRow: CGFloat = 3
    
    private let relativeFontConstant:CGFloat = 0.046
    
    let colors = ["Appaloosa", "Bay", "Bay Roan", "Black", "Blue Roan", "Brown","Buckskin", "Chestnut", "Cremelo", "Gray", "Palomino", "Pinto","Red Roan"]
    
    let colorImages: [UIImage] = [
    
        UIImage(named: "missing")!,
        UIImage(named: "missing")!,
        UIImage(named: "missing")!,
        UIImage(named: "missing")!,
        UIImage(named: "missing")!,
        UIImage(named: "missing")!,
        UIImage(named: "missing")!,
        UIImage(named: "missing")!,
        UIImage(named: "missing")!,
        UIImage(named: "missing")!,
        UIImage(named: "missing")!,
        UIImage(named: "missing")!,
        UIImage(named: "missing")!
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        cell.contentLabel.text = colors[indexPath.item]
        cell.contentLabel.font = cell.contentLabel.font.withSize(self.view.frame.height * relativeFontConstant / itemsPerRow)
        cell.contentImageView.image = colorImages[indexPath.item]
        
        //Disable gestures (needed to allow users to click on a cell)
        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
        
        return cell
    }
    
    @objc func tap(_ sender: UITapGestureRecognizer) {

       let location = sender.location(in: self.collectionView)
       let indexPath = self.collectionView.indexPathForItem(at: location)

       if let index = indexPath {
        print(colors[index.row])
       }
    }
    
    func collectionView( _ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
      //2
      let paddingSpace = sectionInsets.left  * (itemsPerRow + 1)
      let availableWidth = view.frame.width - paddingSpace
      let widthPerItem = availableWidth / itemsPerRow

        return CGSize(width: widthPerItem, height: widthPerItem * 1.15)
    }

    //3
    func collectionView( _ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
      return sectionInsets
    }

    // 4
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
      return sectionInsets.left
    }
    
    
    
}


