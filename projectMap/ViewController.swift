//
//  ViewController.swift
//  projectMap
//
//  Created by Fadel Muhammad Nasution on 10/17/17.
//  Copyright © 2017 Binus. All rights reserved.
//

import UIKit
import MapKit


struct Location{
    var place: String
    var longitude: Double
    var latitudes: Double
}

struct Title{
    var namaTempat: String
    var subTitle: String
}

class ViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    
    var topView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 20))
    var titleText = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 20))
    
    
//    var span: MKCoordinateSpan
//    var location: CLLocationCoordinate2D
//    var region: MKCoordinateRegion

//    var latitudes: [Double] = [-6.225009, -6.175110, 49.398752, 50.110922, -6.202394]
//    var longitude: [Double] = [106.649656, 106.865039, 8.672434, 8.682127, 106.652710]
    
    var titles: [Title] = {
        var alamSutera1 = Title(namaTempat: "Sushi Kami", subTitle: "Jalan paku alam")
        var jakarta1 =  Title(namaTempat: "RM Sederhana", subTitle: "Jalan Jalan Terus aja ")
        
        
        var a: [Title] = []
        
        a.append(alamSutera1)
        a.append(jakarta1)
        
        return a
    
    }()
    
    var locations: [Location] = {
        var alamSutera = Location(place: "alam sutera", longitude: 106.649656, latitudes: -6.225009)
        var jakarta = Location(place: "jakarta", longitude: 106.865039, latitudes: -6.175110)
        
        var l: [Location] = []
        
        l.append(alamSutera)
        l.append(jakarta)
        
        return l
    }()

//
//    var allLocations: [String] = ["alam sutera", "jakarta", "heidelberg", "berlin", "tanggerang"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    
        
        for location in locations{
            
            
                let span: MKCoordinateSpan = MKCoordinateSpanMake(0.1, 0.1)
                let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.latitudes, location.longitude)
                let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
                map.setRegion(region, animated: true)
                
                let annotation = MKPointAnnotation()
            
            
                annotation.coordinate = location
            
            for title in titles {
                annotation.title = "\(title.namaTempat)"
                annotation.subtitle = "\(title.subTitle)"
            }
                
                let tapGestur = UITapGestureRecognizer(target: self, action: nil)
                tapGestur.numberOfTouchesRequired = 1
            
            
            
                map.addAnnotation(annotation)
            

                
            
            
        }
        
        topView.isUserInteractionEnabled = true
        titleText.text = "Nearby Restaurant"
        titleText.textAlignment = .center
        titleText.textColor = UIColor.red
        topView.addSubview(titleText)
        
        
        self.navigationItem.titleView = topView
        self.navigationController?.navigationBar.backgroundColor = UIColor.black
//        // Do any additional setup after loading the view, typically from a nib.
//        
//        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.1, 0.1)
//        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(-6.225009, 106.649656)
//        let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
//        map.setRegion(region, animated: true)
//        
//        let annotation = MKPointAnnotation()
//        
//        annotation.coordinate = location
//        annotation.title = "Sushi Padang"
//        annotation.subtitle = "Come visit our restaurant!"
//        
//        let tapGestur = UITapGestureRecognizer(target: self, action: nil)
//        tapGestur.numberOfTouchesRequired = 1
//        
//        
//        map.addAnnotation(annotation)
        
       
        
//            var span: MKCoordinateSpan
//            var location: CLLocationCoordinate2D
//            var region: MKCoordinateRegion
//        
//        
//        for i in 0..<allLocations.count{
//            let span: MKCoordinateSpan = MKCoordinateSpanMake(0.1, 0.1)
//            
//            let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(-6.225009, 106.649656)
//            let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
//            map.setRegion(region, animated: true)
        
            
//        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

