//
//  SecondViewController.swift
//  HalalTest
//
//  Created by anindya khansalihara wardhana on 10/16/17.
//  Copyright © 2017 Binus. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var selectedIndex: Int?

    
    @IBOutlet weak var myImage2: UIImageView!
    
    @IBOutlet weak var myLabel2: UILabel!
    
    var foodTitle: String?
    var imageBig: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myLabel2.text = foodTitle
        myImage2.image = UIImage(named:imageBig!)
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

