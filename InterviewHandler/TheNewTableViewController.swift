//
//  TheNewTableViewController.swift
//  InterviewHandler
//
//  Created by Abdulrahman Alkhatib on 15/08/2017.
//  Copyright © 2017 Abdulrahman Alkhatib. All rights reserved.
//

import UIKit

class TheNewTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    var interviews : [Interview]  = []
    static public var interviews2 : [Interview] = []
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TheNewTableViewController.interviews2 = self.interviews
        //print("tables in table \(TheNewTableViewController.interviews2.count)")
       
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interviews.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "interviweCell", for: indexPath)
        cell.textLabel?.text = interviews[indexPath.row].KullaniciNo
        cell.detailTextLabel?.text = interviews[indexPath.row].Tarih?.substring(to: (interviews[indexPath.row].Tarih?.index((interviews[indexPath.row].Tarih?.startIndex)!, offsetBy: 10))!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCellIndexPath = tableView.indexPathForSelectedRow
        performSegue(withIdentifier: "SecondSegue", sender: interviews[selectedCellIndexPath!.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dataTransferer = segue.destination as? InterviewDetailsViewController
        dataTransferer?.interview = (sender as? Interview)!
    }
    
    
    
    
    @IBAction func popupTrigger(_ sender: UIButton) {
        //let controller = storyboard!.instantiateViewController(withIdentifier: "scene storyboard id")

        
        let popupVC = storyboard!.instantiateViewController(withIdentifier: "popupMenu") as? PopupMenuViewController
        self.addChildViewController(popupVC!)
        popupVC!.view.frame = self.view.frame
        self.view.addSubview((popupVC?.view)!)
        popupVC?.didMove(toParentViewController: self)
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
