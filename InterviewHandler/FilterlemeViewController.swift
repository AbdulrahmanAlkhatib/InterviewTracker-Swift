//
//  FilterlemeViewController.swift
//  InterviewHandler
//
//  Created by Abdulrahman Alkhatib on 15/08/2017.
//  Copyright © 2017 Abdulrahman Alkhatib. All rights reserved.
//

import UIKit




class FilterlemeViewController: UIViewController {

    var interviews : [Interview] = []
    
    var filteredInterviews : [Interview] = []
    
    
    @IBOutlet weak var startDate: UIDatePicker!
    
    @IBOutlet weak var lastDate: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interviews = TheNewTableViewController.interviews2
        
        //print("tables in filterleme : \(TheNewTableViewController.interviews2.count)")
        //print("filterlemes in filterleme \(interviews.count)")
    }
    
    
    @IBAction func filterle(_ sender: UIButton) {
        filteredInterviews.removeAll()
        let formatter : DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "tr_TR")
        
        for inter in interviews{
            let interviewDate = inter.Tarih?.substring(to: inter.Tarih!.index((inter.Tarih?.startIndex)! , offsetBy: 10))
            if (interviewDate != nil){
                let fallsBetween = (startDate.date...lastDate.date).contains(formatter.date(from: interviewDate!)!)
                print("fallsbetween \(fallsBetween)")
                if(fallsBetween){
                    //print("true")
                    filteredInterviews.append(inter)
                }
            }
        }
        print("before performing the count is \(filteredInterviews.count)")
        performSegue(withIdentifier: "forthSegue", sender: self.filteredInterviews)

    }
    /*
    
    @IBAction func Filterle() {
        filteredInterviews.removeAll()
        let formatter : DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "tr_TR")
        //var interviewDate : Date = Date()
        
        //disabled and the datePicker used directly instead of it
        /*let startDateNewFormat : String = formatter.string(from: startDate.date)
        let lastDateNewFormat : String = formatter.string(from: lastDate.date)
        
        let startdate : Date = formatter.date(from: startDateNewFormat)!
        let enddate : Date = formatter.date(from: lastDateNewFormat)!*/
        
        ///////////testing
        //print(startDate.date)
        //print(lastDate.date)
        
        
        for inter in interviews{
                let interviewDate = inter.Tarih?.substring(to: inter.Tarih!.index((inter.Tarih?.startIndex)! , offsetBy: 10))
                if (interviewDate != nil){
                    let fallsBetween = (startDate.date...lastDate.date).contains(formatter.date(from: interviewDate!)!)
                    print("fallsbetween \(fallsBetween)")
                    if(fallsBetween){
                        //print("true")
                        filteredInterviews.append(inter)
                    }
                }
        }
        print("before performing the count is \(filteredInterviews.count)")
        performSegue(withIdentifier: "forthSegue", sender: self.filteredInterviews)

    }*/

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dataTransferer = segue.destination as! FilteredTableViewController
        dataTransferer.interviews = sender as! [Interview]
    }

    
//////////////
//////////////add a new storyboard with a table and make segue for it
//////////////to view the filtered interviews
//////////////


    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
