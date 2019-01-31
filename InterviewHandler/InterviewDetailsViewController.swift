//
//  InterviewDetailsViewController.swift
//  InterviewHandler
//
//  Created by Abdulrahman Alkhatib on 11/08/2017.
//  Copyright © 2017 Abdulrahman Alkhatib. All rights reserved.
//

import UIKit

class InterviewDetailsViewController: UIViewController {

    var interview = Interview()
    
    @IBOutlet weak var aciklamaLabel: UILabel!
    
    @IBOutlet weak var tanimLabel: UILabel!
    
    @IBOutlet weak var ilceIlUlkeLabel: UILabel!
    
    @IBOutlet weak var konuLabel: UILabel!
    
    @IBOutlet weak var tipiLabel: UILabel!
    
    @IBOutlet weak var tarihLabel: UILabel!
    
    @IBOutlet weak var gsmLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aciklamaLabel.text = interview.aciklama
        tanimLabel.text = interview.Tanim
        ilceIlUlkeLabel.text = "\(interview.ilce!), \(interview.il!), \(interview.ulke!)."
        konuLabel.text = interview.konu
        tipiLabel.text = interview.Tipi
        tarihLabel.text = interview.Tarih?.substring(to: (interview.Tarih?.index(interview.Tarih!.startIndex, offsetBy: 10))!)
        gsmLabel.text = interview.Gsm
        
        
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
