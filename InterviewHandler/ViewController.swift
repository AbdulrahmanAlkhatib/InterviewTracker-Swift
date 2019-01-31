//
//  ViewController.swift
//  InterviewHandler
//
//  Created by Abdulrahman Alkhatib on 07/08/2017.
//  Copyright © 2017 Abdulrahman Alkhatib. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var handled_interviews : [Interview] = []
    
    var json : [String : Any] = [:]
    
    let url : String = "http://212.174.201.72:2021/api/Gorusme/gorusmeListesiGetir"
    //212.174.201.72:2021
    //192.168.1.202:81
    
    @IBOutlet public weak var kullNo: UITextField!
    
    @IBOutlet weak var SirketKodu: UITextField!
    
    @IBOutlet weak var testLabel: UILabel!
    
    /*
    func getInterviews() -> [Interview]{
        return self.handled_interviews
    }
*/
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func perform() {
        json = ["sirket_kod": "\(SirketKodu.text!)",
                "tarih1": "2010-08-07",
                "tarih2": "\(Interview.getSystemDate())",//sht wrong goes here with giving the end date
                "kullaniciNo": "\(kullNo.text!)"]

        SystemUser.getDataFromApi(givenUrl: url, json : json){ (results : [Interview]) in
            self.handled_interviews = results
        }
        
        performSegue(withIdentifier: "firstSegue", sender: self.handled_interviews)
    }
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "firstSegue"{
            let dataTransferer = segue.destination as? TheNewTableViewController
            dataTransferer?.interviews = handled_interviews
        }
    }


}

