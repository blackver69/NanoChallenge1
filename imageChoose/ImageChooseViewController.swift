//
//  ImageChooseViewController.swift
//  NanoChallenge1
//
//  Created by Ricky on 28/04/22.
//

import Foundation


import UIKit


protocol protocolImageChoose : AnyObject{
    func insertImage(img : String)
}
class ImageChooseViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    

    @IBOutlet weak var imageCollectionView: UICollectionView!
    var imageArr: [String] = ["pencil", "scribble", "trash", "lasso", "folder"]
    
    weak var delegate : protocolImageChoose?
    override func viewDidLoad() {
        super.viewDidLoad()
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = imageCollectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionCell", for: indexPath)as? ImageCollectionViewCell else{
            fatalError()
        }
        
        cell.iconItem.image = UIImage(systemName: imageArr[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.dismiss(animated: true){
            self.delegate?.insertImage(img: self.imageArr[indexPath.row])
        }
    }

}
