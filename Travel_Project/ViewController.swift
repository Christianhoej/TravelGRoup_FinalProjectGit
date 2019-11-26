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
    
    var dataSession = Countrydata()
    
    var populationVal:String = "200"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    //let countryData = Countrydata()
   
    //let datasession = Countrydata();
    
  
    @IBAction func selectCountry(sender: UIButton!) {
        let country = countryName.text
        //self.dataSession.getCountry(name: country!)
        let vc = DisplayViewContoller()
        vc.countryName = countryName.text!
    }
    
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? DisplayViewContoller
        vc?.countryName = countryName.text!
    }
    
    */

}

