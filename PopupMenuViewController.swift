//
//  PopupMenuViewController.swift
//  InterviewHandler
//
//  Created by Abdulrahman Alkhatib on 11/08/2017.
//  Copyright © 2017 Abdulrahman Alkhatib. All rights reserved.
//

import UIKit

class PopupMenuViewController: UIViewController {

    var interviews : [Interview] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func closePopup() {
        self.view.removeFromSuperview()
    }

    @IBAction func gorusmeEkle() {
        performSegue(withIdentifier: "SixthSegue", sender: self.interviews)
    }
    
    
    @IBAction func filterleme(_ sender: UIButton) {
        performSegue(withIdentifier: "thirdSegue", sender: interviews)
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
