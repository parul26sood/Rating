//
//  RatingHistoryViewController.swift
//  Rating
//
//  Created by Parul Sood on 24/05/20.
//  Copyright © 2020 Parul Sood. All rights reserved.
//

import UIKit
import Foundation
class RatingHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
@IBOutlet weak var displayRatingTable: UITableView!
 
  
    var getRating:String = ""
    var ratingArray: [String] {
        get {
            return UserDefaults.standard.array(forKey: "previousRating") as? [String] ?? []
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "previousRating")
        }
    }
    var dateArray: [String] {
           get {
               return UserDefaults.standard.array(forKey: "date") as? [String] ?? []
           }
           set {
               UserDefaults.standard.set(newValue, forKey: "date")
           }
       }
     override func viewDidLoad() {
         // intArray.append(currentValue)
        super.viewDidLoad()
        //print(getRating)
        //UserDefaults.standard.removeObject(forKey: "previousRating")
        //UserDefaults.standard.removeObject(forKey: "date")
        
        ratingArray.append(getRating)
        dateArray.append(dateSet())
      // displayRating.text = "\(ratingArray)" + "\(dateArray)"
  
        // Do any additional setup after loading the view.
        self.displayRatingTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        // (optional) include this line if you want to remove the extra empty cell divider lines
        // self.tableView.tableFooterView = UIView()

        // This view controller itself will provide the delegate methods and row data for the table view.
       displayRatingTable.delegate = self
       displayRatingTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (" Rating History")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ratingArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

          // create a new cell if needed or reuse an old one
        let cell = displayRatingTable.dequeueReusableCell(withIdentifier: "RatingList",for: indexPath) as! RatingDisplayTableViewCell

          // set the text from the data model
        cell.dateLbl.text = self.dateArray[indexPath.row]
        cell.ratingLbl.text = self.ratingArray[indexPath.row]

          return cell
      }
    
    @IBAction func backRstingSet(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
     func dateSet()->String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let dateStr = formatter.string(from: Date())
        return dateStr
    
    }

}
