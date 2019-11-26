//
//  ViewController.swift
//  Travel_Project
//
//  Created by Hoej, Christian R on 11/11/19.
//  Copyright © 2019 Hoej, Christian R. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CountryDataProtocol {

    @IBOutlet weak var selectCountry: UIButton!
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var countryName: UITextField!
    @IBOutlet weak var Country: UILabel!
    @IBOutlet weak var Capital: UILabel!
    @IBOutlet weak var population: UILabel!
    
    var dataSession = Countrydata()
    
    var populationVal:String = "200"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSession.delegate = self
    }
    
    //let countryData = Countrydata()
   
    //let datasession = Countrydata();
    
    
    @IBAction func selectCountry(sender: UIButton!) {
        let country = countryName.text
        self.dataSession.getCountry(name: country!)
        
    }
    
    //MARK: Example Data Protocol
    
    func responseDataHandler(data:NSDictionary) {
        //let title = data["title"] as! String
        if data != nil{
        print(data)
            print("@@@@@")
        }
        else{
            print("LOST")
        }
        
        let name = data.value(forKey: "name")
        let capital = data.value(forKey: "capital")
        
        
        //Run this handling on a separate thread
        DispatchQueue.main.async() {
            self.Capital.text="\(capital!)"
            self.Country.text="\(name!)"
            
            self.populationVal = "\(capital!)"
            
            
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? DisplayViewContoller
        vc?.population = populationVal
    }
    
    

}

