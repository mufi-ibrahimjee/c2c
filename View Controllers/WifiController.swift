//
//  WifiController.swift
//  c2cfinal
//
//  Created by Ujjwal Khosla on 23/02/18.
//  Copyright © 2018 mufaddal. All rights reserved.
//

import UIKit
import Firebase

class WifiController: UIViewController {
    
    
    @IBOutlet weak var usernameLbl: UILabel!   
    @IBOutlet weak var passwordLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("!!!!!")
        
       
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(wifiUsername)
        print(wifiPassword)
        usernameLbl.text = wifiUsername
        passwordLbl.text = wifiPassword
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
