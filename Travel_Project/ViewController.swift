//
//  ViewController.swift
//  Travel_Project
//
//  Created by Hoej, Christian R on 11/11/19.
//  Copyright © 2019 Hoej, Christian R. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var selectCountry: UIButton!
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var countryName: UITextField!
    @IBOutlet weak var Country: UILabel!
    @IBOutlet weak var Capital: UILabel!
    @IBOutlet weak var population: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //TEST2
        
        
        //kalgpiusgh;;
        //rewrytwertrwetrew
    }
    
    let countryData = Countrydata()
   
    let datasession = Countrydata();
    @IBAction func selectCountry(sender: UIButton!) {
        let country = countryName.text
        self.datasession.getCountry(name: country!)
        
    }
    
    //MARK: Example Data Protocol
    
    func responseDataHandler(data:NSDictionary) {
        //let title = data["title"] as! String
        let name = data["name"] as! String
        
        //Run this handling on a separate thread
        DispatchQueue.main.async() {
            self.testLabel.text = name
            //self.bodyTextView.text = body
        }
    }

    func responseError(message:String) {
        //Run this handling on a separate thread
        DispatchQueue.main.async() {
            self.testLabel.text = "Error!"
            //self.bodyTextView.text = message
        }
    }
    

}

