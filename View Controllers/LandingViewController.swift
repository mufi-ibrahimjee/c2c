//
//  LandingViewController.swift
//  ACM
//
//  Created by Mufaddal Ibrahimjee on 21/02/18.
//  Copyright © 2018 mufaddal. All rights reserved.
//

import UIKit
import Firebase
class LandingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var ref : DatabaseReference!
    
    @IBAction func bttn6(_ sender: Any) {
        self.dismiss(animated: true, completion: {
            self.ref = Database.database().reference().child("Users").child(username)
            self.ref.updateChildValues(["loginstatus":"false"])
            CoreDataHandler.shared.deleteData(completion: { (_ ) in
                
            })
        })
    }
    
    @IBOutlet weak var timeline: UITableView!
    @IBAction func bttn5(_ sender: Any) {
        
    }
    @IBAction func bttn4(_ sender: Any) {
        
    }
    @IBAction func bttn3(_ sender: Any) {
        if !guestUser {
            self.performSegue(withIdentifier: "scanner", sender: Any?.self)
        }
        else {
            self.showAlert(title: "Error", message: "This feature is only for registered participants")
        }
        
    }
    
    @IBAction func bttn2(_ sender: Any) {
        print("!!!!!!!!!")
        print(wifiPassword)
        print(wifiUsername)
    }
    
    @IBAction func bttn1(_ sender: Any) {
        
    }
    let tm1: [String] = ["Registration","Orientation","Opening Ceremony","Pitch Pits (team formation)","Hack Starts","Dinner","Quiz"]
    
    let pm1: [String] = ["05:30 PM - 07:30 PM (10/03/18)","05:30 PM - 07:30 PM (10/03/18)","07:00 PM - 08:00 PM (10/03/18)","08:00 PM - 09:00 PM (10/03/18)","08:30 PM (10/03/18)","09:00 PM - 10:00 PM (10/03/18)","10:30 PM - 11:30 PM (10/03/18)"]
    
    let tm2: [String] = ["Late Night Snack","Naptime","Coffee","Breakfast","Session 1","Session 2","Lunch","Technical Inspection","Snacks","Elimination Results","Music","Dinner","Jenga Challenge"]
    
    let pm2: [String] = ["02:00 AM (11/03/18)","02:00 AM (11/03/18)","06:00 AM (11/03/18)","08:00 AM - 09:00 AM (11/03/18)","10:00 AM - 11:00 AM (11/03/18)","12:00 PM - 01:00 PM (11/03/18)","01:00 PM - 02:00 PM (11/03/18)","03:00 PM (11/03/18)","06:00 PM (11/03/18)","07:00 PM (11/03/18)","07:30 PM (11/03/18)","09:00 PM - 10:00 PM (11/03/18)","11:00 PM - 01:00 AM (11/03/18)"]
    
    let tm3: [String] = ["Late Night Snack","Naptime","Coffee","Alarming Call","Breakfast","Hack Ends","Expo","Experience Sharing","Closing Ceremony"]
    
    let pm3: [String] = ["02:00 AM 12/03 (12/03/18)","02:00 AM (12/03/18)","06:00 AM (12/03/18)","07:00 AM (12/03/18)","08:00 AM - 09:00 AM (12/03/18)","08:30 AM (12/03/18)","09:00 AM - 11:30 AM (12/03/18)","11:30 AM - 12:00 PM (12/03/18)","12:00 PM - 02:00 PM (12/03/18)"]
    
    var tm : [String] = []
    var pm : [String] = []
    
    var isTapped: Bool = false
    @IBAction func hamburger(_ sender: Any) {
        if isTapped == false {
            UIView.animate(withDuration: 1, animations: {
                self.navBar.transform = CGAffineTransform(translationX:  CGFloat(self.navBar.frame.width), y: 0)
            }, completion: nil)
            isTapped = true
        }
        else if isTapped == true {
            isTapped = false
            UIView.animate(withDuration: 1, animations: {
                self.navBar.transform = CGAffineTransform(translationX:  CGFloat(-self.navBar.frame.width), y: 0)
            }, completion: nil)
        }
    }
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var navBar: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tm = tm1 + tm2 + tm3
        pm = pm1 + pm2 + pm3
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        leadingConstraint.constant = CGFloat(-navBar.frame.width)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor.black
        timeline.backgroundColor = Colors.outer
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tm.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TimelineTableViewCell
        if indexPath.row == 0 {
            cell.cellmarker.image = UIImage(named : "first")
        }
        else if indexPath.row == tm.count-1 {
            cell.cellmarker.image = UIImage(named : "last")
        }
        else {
            cell.cellmarker.image = UIImage(named  : "middle")
        }
        cell.title.text = tm[indexPath.row]
        cell.time.text = pm[indexPath.row]
        cell.container.backgroundColor = Colors.inner
        cell.contentView.backgroundColor = Colors.outer
        cell.time.textColor = Colors.button
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func showAlert(title :String , message : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let bttn = UIAlertAction(title: "Done", style: .cancel, handler: nil)
        alert.addAction(bttn)
        present(alert, animated: true, completion: nil)
    }
}
