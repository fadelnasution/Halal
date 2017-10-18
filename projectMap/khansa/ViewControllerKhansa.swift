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
        
        var buttonRight = UIBarButtonItem(title: "Maps", style: UIBarButtonItemStyle.plain, target: self, action: #selector(move))
        
        
        
        buttonRight.tintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        
        //self.view.backgroundColor = UIColor.black
        
        self.navigationItem.leftBarButtonItem = buttonLeft
        self.navigationItem.rightBarButtonItem = buttonRight
        
    }
    
//    let tapGesture = UITapGestureRecognizer(target: self, action: Selector(("move")))
//    buttonRight.addGestureRecognizer(tapGesture)
    

    
    
     func move(_ sender: UITapGestureRecognizer){
        var sb = UIStoryboard.init(name: "Main", bundle: nil)
        var vc = sb.instantiateViewController(withIdentifier: "showMapController") as UIViewController
        
    
        present(vc, animated: true, completion: nil)
    }
    
//    let sb = UIStoryboard(name: "Main", bundle: nil)
//    let vc = sb.instantiateViewController(withIdentifier: "ViewController") as UIViewController
//    present(vc, animated: true, completion: nil)

//
//    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"storyboard2" bundle:nil];
//    [self presentModalViewController:[storyboard instantiateViewControllerWithIdentifier:@"storyboard2initialviewcontroller"] animated:NO];
    
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
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


