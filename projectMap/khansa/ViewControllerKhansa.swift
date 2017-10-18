//
//  ViewController.swift
//  HalalTest
//
//  Created by anindya khansalihara wardhana on 10/15/17.
//  Copyright © 2017 Binus. All rights reserved.
//

import UIKit

var foods : [String] = ["Carbonara", "Pannacotta", "Sushi", "Steak"]


class ViewControllerKhansa: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (foods.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        
        cell.myImage.image =  UIImage(named: foods[indexPath.row])
        cell.myLabel.contentMode = .scaleAspectFill
        cell.myLabel.text = foods[indexPath.row]
        
        return(cell)
    }
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var buttonLeft = UIBarButtonItem(title: "Categories", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        buttonLeft.tintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        var buttonRight = UIBarButtonItem(title: "Maps", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        buttonRight.tintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        
        //self.view.backgroundColor = UIColor.black
        
        self.navigationItem.leftBarButtonItem = buttonLeft
        self.navigationItem.rightBarButtonItem = buttonRight
        
    }
    //
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "SecondViewSegue", sender: foods[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SecondViewSegue"{
            
            let destination = segue.destination as! SecondViewController
            
            let foodname = sender as! String
            destination.foodTitle = "\(foodname)"
            
            let foodimage = sender as! String
            destination.imageBig = "\(foodimage)"
            
            
            
            
            //            if let index = selectedIndex{
            //
            ////                let food = foods[index.section]
            ////                destination.myImage2 = "\(food)"
            //
            //
            //                let foodname = foods[index.section]
            //
            //
            //            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


