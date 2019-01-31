//
//  FilteredTableViewController.swift
//  InterviewHandler
//
//  Created by Abdulrahman Alkhatib on 17/08/2017.
//  Copyright © 2017 Abdulrahman Alkhatib. All rights reserved.
//

import UIKit

class FilteredTableViewController: UITableViewController {

    var interviews : [Interview] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(interviews.count)
        
        
    }

    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.interviews.count
    }

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilteredInterviewCell", for: indexPath)

        cell.textLabel?.text = interviews[indexPath.row].KullaniciNo!
        cell.detailTextLabel?.text = interviews[indexPath.row].Tarih!.substring(to: interviews[indexPath.row].Tarih!.index(interviews[indexPath.row].Tarih!.startIndex, offsetBy: 10))
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCellIndexPath = tableView.indexPathForSelectedRow
        performSegue(withIdentifier: "FifthSegue", sender: interviews[selectedCellIndexPath!.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dataTransferer = segue.destination as? InterviewDetailsViewController
        dataTransferer?.interview = (sender as? Interview)!
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

}
