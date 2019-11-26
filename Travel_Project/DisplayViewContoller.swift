//
//  DisplayViewContoller.swift
//  Travel_Project
//
//  Created by Hoej, Christian R on 11/25/19.
//  Copyright © 2019 Hoej, Christian R. All rights reserved.
//

import UIKit

class DisplayViewContoller: UIViewController, CountryDataProtocol {
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var languagesLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var governmentLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var gdpLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    
    var countryName:String = "DEFAULT"
    
    var dataSession = Countrydata()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSession.delegate = self
        
        self.dataSession.getCountry(name: countryName)
        
        
        
        // Do any additional setup after loading the view.
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
        //let population = data.value(forKey: "population")
        let language = data.value(forKey: "language")
        let region = data.value(forKey: "region")
        //let government = data.value(forKey: "language")
        //let area = data.value(forKey: "language")
        //let currency = data.value(forKey: "language")
        
        
        //Run this handling on a separate thread
        DispatchQueue.main.async() {
            self.capitalLabel.text="\(capital!)"
            self.countryNameLabel.text="\(name!)"
            //self.populationLabel.text="\(population!)"
            self.languagesLabel.text="\(language!)"
            self.regionLabel.text="\(region!)"
            //self.governmentLabel.text="\(language!)"
            //self.areaLabel.text="\(language!)"
            //self.currencyLabel.text="\(language!)"
            //self.gdpLabel.text="\(language!)"
            
            //self.bodyTextView.text = body
        }
    }

    func responseError(message:String) {
        //Run this handling on a separate thread
        DispatchQueue.main.async() {
            //self.bodyTextView.text = message
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
