//
//  SecondViewController.swift
//  Rating
//
//  Created by Parul Sood on 24/05/20.
//  Copyright © 2020 Parul Sood. All rights reserved.
//

import UIKit
import Foundation

class SecondViewController: UIViewController {

    var rating:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
         RatingShowLabel.text = "\(Slider.value)"
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var RatingShowLabel: UILabel!
    
    @IBOutlet weak var Slider: UISlider!
    
     
    @IBAction func SliderValue(_ sender: Any) {
        
       rating = Int(Slider.value)
        
       RatingShowLabel.text = "\(rating)"
        
    }
    
    @IBAction func SubmitRating(_ sender: Any) {
       performSegue(withIdentifier: "rating" , sender: self)
 
       
   
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "rating") {
        //Checking identifier is crucial as there might be multiple
        // segues attached to same view
            let detailVC = segue.destination as! RatingHistoryViewController
          detailVC.getRating = "\(rating)"
        
          
        
    }
}
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
