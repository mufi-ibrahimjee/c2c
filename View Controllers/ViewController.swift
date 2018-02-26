//
//  ViewController.swift
//  c2cfinal
//
//  Created by Mufaddal Ibrahimjee on 21/02/18.
//  Copyright © 2018 mufaddal. All rights reserved.
//

import UIKit
import FirebaseDatabase

var guestUser : Bool = false

class ViewController: UIViewController {
    
    var ref:DatabaseReference!
    var databaseHandle:DatabaseHandle?
    var rer: String = ""
    
    var postData = [String]()
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var incorrectPasswordLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var guestButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        
        
        username = usernameTextField.text ?? "N/A"
        password = passwordTextField.text ?? "N/A"
        
        if username == "" || password == "" {
            self.showAlert(title : "Error", message : "One of the fields is empty")
        }
        else {
            ref = Database.database().reference().child("Users").child(username)
            ref.observe(.value, with: { (snapshot) in
                print(snapshot)
                
                if snapshot.exists()
                {
                    let dictionary = snapshot.value as? [String:AnyObject]
                    self.rer = (dictionary!["password"] as! String)
                    isLoggedIn = dictionary!["loginstatus"] as! String
                    
                    if isLoggedIn == "false"
                    {
                        if self.rer == password {
                            isLoggedIn = "true"
                            self.ref.updateChildValues(["loginStatus":"true"])
                            wifiUsername = (dictionary!["wifiUsername"] as! String)
                            wifiPassword = (dictionary!["wifiPassword"] as! String)
                            CoreDataHandler.shared.cacheUser(completion: { (isPersisted) in
                                if isPersisted {
                                    self.performSegue(withIdentifier: "goToHomeScreen", sender: Any?.self)
                                }
                            })
                        }
                        else {
                            self.showAlert(title: "Error", message: "Invalid Password")

                        }
                    }
                    else {
                        self.showAlert(title: "Error", message: "You are already logged in with some other device")
                    }
                }
                else{
                    self.showAlert(title: "Error", message: "Invalid Username Or Password")
                }
                
            })
            
        }
        
        
    }
    
    @IBAction func guestButtonTapped(_ sender: Any) {
        guestUser = true
        username = "N/A"
        password = "N/A"
        wifiUsername = "N/A"
        wifiPassword = "N/A"
        self.performSegue(withIdentifier: "goToHomeScreen", sender: Any?.self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func showAlert(title :String , message : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let bttn = UIAlertAction(title: "Done", style: .cancel, handler: nil)
        alert.addAction(bttn)
        present(alert, animated: true, completion: nil)
    }
    
}

