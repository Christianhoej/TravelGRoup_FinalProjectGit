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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //TEST2
        
        
        //kalgpiusgh;;
        //rewrytwertrwetrew
    }
    
    let datasession = Countrydata();
    
    @IBAction func selectCountry(_ sender: Any) {
        datasession.getCountry(name: "denmark")
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

