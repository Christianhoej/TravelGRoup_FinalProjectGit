//
//  LoginViewController.swift
//  Travel_Project
//
//  Created by Hoej, Christian R on 12/4/19.
//  Copyright © 2019 Hoej, Christian R. All rights reserved.
//

import UIKit
import CoreData
import os.log


class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signupUsernameTextfield: UITextField!
    @IBOutlet weak var signupPasswordTextfield: UITextField!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    var users: [NSManagedObject] = []
    
    var userOK:Bool = false
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        //if usernameTextField == users.
        
        if (usernameTextField.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? true) || (passwordTextField.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? true) {
            //noUser()
            let alert = UIAlertController(title: "No input", message: "Please enter a valid username and password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        else{
            checkUser()
            print("USEROK")
            print(userOK)
            if (userOK == false){
                let alert = UIAlertController(title: "No input", message: "Please enter a valid username and password", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true)
                
            }
            else{
                print("login!!!")
            }
            //if (usernameTextField.text)
        }
        
    }
    
    
    @IBAction func signUpPressed(_ sender: Any) {
        if (signupUsernameTextfield.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? true) || (signupPasswordTextfield.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? true) {
                    //noUser()
            print("SIGNUPFEJL")
                }
                else {
            addUser(username: signupUsernameTextfield.text!, password: signupPasswordTextfield.text!)
            /*let alert = UIAlertController(title: "User added!", message: "Please enter your username and password above", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)*/
            print("SIGNUPGODKENDT")
                    //sender.pulsate()
                    //let vc = DisplayViewContoller()
                    //vc.countryName = countryName.text!
                }
        
    }
    
    func addUser(username: String, password: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
          return
        }
          
        let managedContext = appDelegate.persistentContainer.viewContext

        let entity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
        
        let user = NSManagedObject(entity: entity, insertInto: managedContext)
        
        user.setValue(username, forKey: "username")
        user.setValue(password, forKey: "password")
        
        do {
            try managedContext.save()
            users.append(user)
        } catch {
            let nserror = error as NSError
            NSLog("Unable to save \(nserror), \(nserror.userInfo)")
            abort()
            print("NOT SAVED")
        }
    }
    
    func checkUser(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
          return
        }
          
        let managedContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try managedContext.fetch(request)
            for data in result as! [NSManagedObject] {
                if (data.value(forKey: "username") as? String == usernameTextField.text){
                    userOK = true
                    print("USER OK2")
                    print(userOK)
                }
                else {
                    //noUser()
                }
          }
            
        } catch {
            
            print("Failed")
        }
    }
 /*
    func noUser(){
        let alert = UIAlertController(title: "No input", message: "Please enter a valid username and password", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    */
    //Fetching the core data
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
      
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")

        do {
            users = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
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
