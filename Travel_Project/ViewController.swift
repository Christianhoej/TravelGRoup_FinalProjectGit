//
//  ViewController.swift
//  Travel_Project
//
//  Created by Hoej, Christian R on 11/11/19.
//  Copyright © 2019 Hoej, Christian R. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CountryDataProtocol  {

    @IBOutlet weak var selectCountry: UIButton!
    @IBOutlet weak var countryName: UITextField!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var languagesLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var BtnDrop: UIButton!
    
    
    var dataSession = Countrydata()
    
   
    
    var fruitList = ["Orange", "Banana", "Apple", "Blueberry", "Mango", "Cherry", "Grape", "Strawberry"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.isHidden = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    //let countryData = Countrydata()
   
    //let datasession = Countrydata();
    
    @IBAction func onClickDropButton(_ sender: Any) {
       if tblView.isHidden {
            animate(toogle: true, type: BtnDrop)
        } else {
            animate(toogle: false, type: BtnDrop)
        }
        
        
    }
    
    
    func animate(toogle: Bool, type: UIButton) {
        
        if type == BtnDrop {
        
        if toogle {
            UIView.animate(withDuration: 0.3) {
                self.tblView.isHidden = false
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.tblView.isHidden = true
            }
        }
        }
    }
    
    
    
  
    @IBAction func selectCountry(sender: UIButton!) {
        if (countryName.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? true) {
            let alert = UIAlertController(title: "No input", message: "Please enter a valid country", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        else{
            let country = countryName.text
            self.dataSession.getCountry(name: country!)
            
            sender.flash()
            //sender.pulsate()
            //let vc = DisplayViewContoller()
            //vc.countryName = countryName.text!
        }
    }
    
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {

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
        let population = data.value(forKey: "population")
        let language = data.value(forKey: "language")
        let region = data.value(forKey: "region")
        //let government = data.value(forKey: "language")
        let area = data.value(forKey: "area")
       // let currencies = data.value(forKey: "currencies") as? NSArray
        //print(currencies.value(forKey: "code"))
       // let currency = currencies![1]
      //  print(currency)
        let flag = data.value(forKey: "flag")
        
    
        
        //let url = URL(string: flag)
        //let flagData = try? Data(from: url!)
        //flagView.image = UIImage(contentsOfFile: flagData!)
        
        
      /*
        var path: String = Bundle.main.path(forResource: flag as! String, ofType: "svg")!

        var url: NSURL = NSURL.fileURL(withPath: path) as NSURL  //Creating a URL which points towards our path

       //Creating a page request which will load our URL (Which points to our path)
        var request: NSURLRequest = NSURLRequest(url: url as URL)
        webView.loadRequest(request as URLRequest)  //Telling our webView to load our above request
        
        */
        //Run this handling on a separate thread
        DispatchQueue.main.async() {
            self.capitalLabel.text="\(capital!)"
            self.capitalLabel.isHidden = false
            self.countryNameLabel.text="\(name!)"
            self.countryNameLabel.isHidden = false
            self.populationLabel.text="\(population!)"
            self.populationLabel.isHidden = false
            //self.languagesLabel.text="\(language!)"
            self.regionLabel.text="\(region!)"
            self.regionLabel.isHidden = false
            self.areaLabel.text="\(area!)"
            self.areaLabel.isHidden = false
            //self.currencyLabel.text="\(currency!)"
            //self.flagView.image = flag as? UIImage
            
        }
    }

    func responseError(message:String) {
        //Run this handling on a separate thread
        DispatchQueue.main.async() {
            //self.bodyTextView.text = message
        }
    }
    
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? DisplayViewContoller
        vc?.countryName = countryName.text!
    }
    
    */

    
    
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return fruitList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = fruitList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        BtnDrop.setTitle("\(fruitList[indexPath.row])", for: .normal)
        animate(toogle: false, type: BtnDrop)
    }
    
    
}
