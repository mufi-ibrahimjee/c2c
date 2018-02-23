//
//  SponsorTableViewController.swift
//  c2cfinal
//
//  Created by Ujjwal Khosla on 22/02/18.
//  Copyright © 2018 mufaddal. All rights reserved.
//



import UIKit

class sponsorTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let elements: [String] = ["acm_int","bala","Cblogo","custombaba","digitalocean","docker","dot_tech","fests.infologo","geek","git","github","HasuraLogoHorizontal","ibm","jetbrains","jsp","npm","ozone","product","sketch","skill","slack","stickermule","travis","twilio","wolfram2","zeplin","zulip"]
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
        // return UITableViewAutomaticDimension
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! customsponsor
        
        // cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
        // cell.frame = CGRectMake(0.0, 0.0, 320.0, 300);
        cell.animalLbl.text = elements[indexPath.row]
        cell.animalImage.image = UIImage(named: elements[indexPath.row])
        cell.cellView.layer.shadowRadius = 1
        cell.cellView.layer.shadowOpacity = 0.3
        cell.cellView.layer.shadowOffset = CGSize(width: -1, height: 1)
        
        //  cell.animalImage.layer.cornerRadius = cell.animalImage.frame.height / 2
        
        return cell
    }
    
    
}


















/*
 // Override to support conditional editing of the table view.
 override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the specified item to be editable.
 return true
 }
 */

/*
 // Override to support editing the table view.
 override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
 if editingStyle == .delete {
 // Delete the row from the data source
 tableView.deleteRows(at: [indexPath], with: .fade)
 } else if editingStyle == .insert {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
 
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the item to be re-orderable.
 return true
 }
 */

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */




