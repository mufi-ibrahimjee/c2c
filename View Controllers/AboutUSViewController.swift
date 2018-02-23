//
//  ViewController.swift
//  ACM
//
//  Created by Pranav Karnani on 21/02/18.
//  Copyright © 2018 Pranav Karnani. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var aboutUsDescription: UILabel!
    @IBOutlet weak var aboutUsLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    
    var titles : [String] = ["Faculty Organisers","Student Organisers","About Us"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.backgroundColor = Colors.inner
        aboutUsLabel.textColor = UIColor.white
        aboutUsDescription.textColor = UIColor.white

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AboutUsTableViewCell
        cell.titleLabel.text = titles[indexPath.row]
        cell.container.backgroundColor = Colors.outer
        cell.titleLabel.textColor = UIColor.white
        return cell
    }
    
}

