//
//  Countrydata.swift
//  Travel_Project
//
//  Created by Hoej, Christian R on 11/18/19.
//  Copyright © 2019 Hoej, Christian R. All rights reserved.
//

import UIKit

protocol CountryDataProtocol {
    func responseDataHandler(data: NSDictionary)
    func responseError(message:String)
    
}

struct Data: Decodable{
    let population: String
    let capital: String
    let languages: String
    let religion: String
    let government: String
    let area: String
    let currency: String
    let gdp: String
}

class Countrydata{
    
    private let urlSession = URLSession.shared
    private let urlPathBase = "https://restcountries.eu/rest/v2/name/"
        
        
    private var dataTask:URLSessionDataTask? = nil

    var delegate:CountryDataProtocol? = nil
        
    init() {}
       
    func getCountry(name: String) {
            
        var urlPath = self.urlPathBase
        var countryName = name.replacingOccurrences(of: " ", with: "+")
        var temp = "\(countryName)?fullText=true"
            
        urlPath = urlPath + temp
            
        let url:NSURL? = NSURL(string: urlPath)
            
            //let url = NSURL(string: "https://restcountries.eu/rest/v2/name/\(name)?fullText=true")
            
            let dataTask = self.urlSession.dataTask(with: url! as URL) { (data, response, error) -> Void in
                if error != nil {
                    print(error!)
                } else {
                    do {
                        let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                        
                        //print(jsonResult)
                        //let jsonResult = try JSONSerialization.jsonObject(with: data!, options: [])
                        
                    /*
                        if let dictionary = data as? [String: Any] {
                            print("1")
                            if let number = dictionary["name"] as? String {
                                // access individual value in dictionary
                                print("WHAT")
                            }

                            for (key, value) in dictionary {
                                // access all key / value pairs in dictionary
                            }

                            if let nestedDictionary = dictionary["anotherKey"] as? [String: Any] {
                                // access nested dictionary values by key
                            }
                        }
                        */
                        
              
                        if jsonResult != nil {
                            //let name = jsonResult["name"] as? [[String: Any]]
                                
                            print("WWWWWWWW")
                            //print(jsonResult)
                            let values: NSDictionary? = jsonResult![0] as? NSDictionary
                            
                            
                            //print(values)
                            self.delegate?.responseDataHandler(data: values!)
                            
                            
                            let names = values?.value(forKey: "name") as? String
                            let capital = values?.value(forKey: "capital")

                            print(names)
                            print(capital)
                            
                            
                            //let data : NSDictionary? = jsonResult!["alpha2Code"] as? NSDictionary
                            //print(data)
                            
//let capital: String? = jsonResult["capital"] as? String
                           /* if name != nil && capital != nil {
                                self.delegate?.responseDataHandler(data: jsonResult as! NSDictionary)
                                print("WWWWWWWWWWWW")
                            } else {
                                print("FEEEEEEJL")
                                self.delegate?.responseError(message: "Fake data not found")
                            }*/
                        }
                        else{
                            print("FFFFFFF")
                        }
                        
                        /*guard let data1 = jsonResult as? [NSDictionary] else {
                              return
                        }
                        guard let current = data1 as? [NSDictionary] else {
                              return
                        }*/
                        /*
                        print("Raw data:\n\(data!)\n")
                        let dataString = String(data: data!, encoding: String.Encoding.utf8)
                        print("Human-readable data:\n\(dataString!)")
                        
                        // fullName: String = "First Last"
                        let fullNameArr = dataString!.split(separator: ",")

                        //var name: String = String(fullNameArr[0])
                        let name = jsonResult?.value(forKey: "name")
                        var capital: String = String(fullNameArr[5])
                        var population: String = String(fullNameArr[12])
                        
                        
                        //print(firstName.replacingOccurrences(of: "'", with: ""))
                         
                         */
                        
                        //print(population)
                    
                    } catch {
                    }
                }
            }
            dataTask.resume()
        }
    }

    
    





