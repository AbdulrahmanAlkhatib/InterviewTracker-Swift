//
//  EklemeViewController.swift
//  InterviewHandler
//
//  Created by Abdulrahman Alkhatib on 18/08/2017.
//  Copyright © 2017 Abdulrahman Alkhatib. All rights reserved.
//

import UIKit

class EklemeViewController: UIViewController {

    let date = Date()
    let calendar = Calendar.current
    
    var json : [String : Any?] = [:]
    var jsonData : Data = Data()
    
    @IBOutlet weak var aciklama: UITextField!
    
    @IBOutlet weak var tanim: UITextField!
    
    @IBOutlet weak var ilce: UITextField!
    
    @IBOutlet weak var il: UITextField!
    
    @IBOutlet weak var ulke: UITextField!
    
    @IBOutlet weak var konu: UITextField!
    
    @IBOutlet weak var tip: UITextField!
    
    @IBOutlet weak var gsm: UITextField!
    
    @IBOutlet weak var gorusmeTarihi: UIDatePicker!
    
    var additionDate : Date = Date()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addNewInterview() {
        
        json = [
            "KullNos": "Ertan Bozkır",
            "id": 404,
            "Sirket_Kod": "1",
            "Tarih": "\(gorusmeTarihi.date)",
            "Saat": "1899-12-30T16:58:19",
            "Tipi": "\(tip.text!)",
            "Fkod": "77ERTAN",
            "Tanim": "\(tanim.text!)",
            "AltBayiCariAdi": "",
            "Yetkili1": "",
            "Yetkili1Unvan": "",
            "Yetkili2": "",
            "Yetkili2Unvan": "",
            "Yetkili3": "",
            "Yetkili3Unvan": "",
            "Yetkili4": "",
            "Yetkili4Unvan": "",
            "Adres1": "",
            "Adres2": "",
            "Adres3": "",
            "il": "\(il.text!)",
            "ilce": "\(ilce.text!)",
            "Ulke": "\(ulke.text!)",
            "Tel1": "",
            "Tel2": "",
            "Faks": "",
            "Gsm": "",
            "Email": "",
            "Konu": "\(konu.text!)",
            "Aciklama": "\(aciklama.text!)",
            "KayitTarihi": "\(Interview.getSystemDate())",
            //\(self.calendar.component(.year, from: date))-\(self.calendar.component(.month, from: date))-\(self.calendar.component(.day, from: date))T\(self.calendar.component(.hour, from: date)):\(self.calendar.component(.minute, from: date)):\(self.calendar.component(.second, from: date))" ,
            "KullaniciNo": "ERP",
            "DegKayitTarihi": nil,
            "DegKullaniciNo": "",
            "SaticiKod": "",
            "HatirlatmaTarihi": nil,
            "MailGitti": false,
            "MailAciklama": "",
            "Durumu": "",
            "IlkPlanTarihi": nil,
            "GerceklesmeIptalTarihi": nil,
            "IptalAciklamasi": "",
            "ErtelemeAciklamasi": ""
        ]
        
        do{
            jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
        }catch{}
        
        let url : URL = URL(string : "http://192.168.1.202:81/api/Gorusme/gorusmeKaydet")!
        let request = NSMutableURLRequest(url : url)
        //var request = URLRequest(url : url)
        request.httpMethod = "Post"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            guard let data = data, error == nil else {
                print("No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
                print("done")

            }else{
                print("response json equals nil")
            }
        }
        
        task.resume()
        
        
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
