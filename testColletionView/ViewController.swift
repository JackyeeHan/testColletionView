//
//  ViewController.swift
//  testColletionView
//
//  Created by 黃柏瀚 on 2022/5/24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var theCollectionView: UICollectionView!
    @IBOutlet weak var numberInLineSegment: UISegmentedControl!
    
    var images:[UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        images = [
            UIImage(named: "001")!,
            UIImage(named: "002")!,
            UIImage(named: "003")!,
            UIImage(named: "004")!,
            UIImage(named: "005")!,
            UIImage(named: "006")!,
         ]
        
        theCollectionView.dataSource = self
        theCollectionView.delegate = self
        
        let numberInLine = CGFloat(numberInLineSegment.selectedSegmentIndex + 3)
        self.setCollectionViewLayout(numberInLine)
        
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
               NotificationCenter.default.addObserver(self, selector: #selector(shouldRotateObject(_:)), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        }
    
    @objc func shouldRotateObject(_ sender:Any?){
        let numberInLine = CGFloat(numberInLineSegment.selectedSegmentIndex + 3)
            setCollectionViewLayout(numberInLine)
         print("rotate")
     }
    
    
    @IBAction func nilx(_ sender: Any) {
        let numberInLine = CGFloat(numberInLineSegment.selectedSegmentIndex + 3)
            setCollectionViewLayout(numberInLine)
    }
    
    
    //設定Collection Flow
    func setCollectionViewLayout(_ numberOfItemInLine: CGFloat){
        
        let layout = UICollectionViewFlowLayout()
        
        //取得 safeArea 大小
        let viewsize = view.safeAreaLayoutGuide.layoutFrame.size
        
        //設定section的間距，四個數值分別代表上下左右的間距
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        //設定每一行的間距
        layout.minimumLineSpacing = 1
        
        //設定cell的大小
        layout.itemSize = CGSize(width: viewsize.width / numberOfItemInLine - 10, height: viewsize.width / numberOfItemInLine - 10)
        
        theCollectionView.setCollectionViewLayout(layout, animated: false)
        
    }
    
    
    
    
    //CollectionView DataSource & Delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! MyCollectionViewCell
        cell.theImageView.image = images[indexPath.row]
        
        cell.backgroundColor = UIColor.black
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            print("選了 \(indexPath)")
        
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let nextVC = storyBoard.instantiateViewController(identifier: "myImageVC") as? MyImageViewController
        nextVC?.modalPresentationStyle = .fullScreen
        
        if let nextVC = nextVC {
            
            nextVC.selectedImage = images[indexPath.row]
            
            nextVC.nextImage = {
            nextVC.theImageView.image = self.images[indexPath.row + 1]
            }
            self.present(nextVC, animated: true, completion: nil)
            }
        
        
    }
}

