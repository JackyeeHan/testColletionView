//
//  MyImageViewController.swift
//  testColletionView
//
//  Created by 黃柏瀚 on 2022/6/8.
//

import UIKit

class MyImageViewController: UIViewController {

    var selectedImage:UIImage? = nil
    @IBOutlet weak var theImageView: UIImageView!
    
    var nextImage:(()->())? = nil
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.theImageView.image = selectedImage
        theImageView.backgroundColor = UIColor.black
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func callBack1(_ sender: Any) {
        nextImage?()
    }
    
}
