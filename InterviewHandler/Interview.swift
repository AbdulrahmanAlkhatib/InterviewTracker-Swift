//
//  Interview.swift
//  InterviewHandler
//
//  Created by Abdulrahman Alkhatib on 07/08/2017.
//  Copyright © 2017 Abdulrahman Alkhatib. All rights reserved.
//

import Foundation

class Interview{
    var KullNos : String?
    var id : Int?
    var Sirket_Kod : String?
    var Tarih : String?
    var Tanim : String?
    var Adres1 : String?
    var Adres2 : String?
    var Adres3 : String?
     var il : String?
    var ilce : String?
    var ulke : String?
    var Tel1 : String?
    var Tel2 : String?
    var faks : String?
    var Gsm : String?
    var email : String?
    var konu : String?
    var aciklama : String?
    var KayitTarihi : Date?
    var MailGitti : Bool?
    var MailAciklama : String?
    var Tipi : String?
    var KullaniciNo : String?
    
    
    init() {
        KullNos = ""; id = 0 ; Sirket_Kod = ""; Tarih = ""; Tanim = "" ; Adres1 = "" ; Adres2 = ""; Adres3 = ""; il = ""; ilce = ""; ulke = ""; Tel1 = ""; Tel2 = ""; Gsm = ""; email = ""; konu = ""; aciklama = ""; KayitTarihi = Date();  MailGitti = false; MailAciklama = "";  Tipi = ""; KullaniciNo = "";
    }
 
    
    /*"Tipi": "TANIŞMA",
     "Fkod": "120 01 037 A07",
     "AltBayiCariAdi": "",
     "Yetkili1": "",
     "Yetkili1Unvan": "",
     "Yetkili2": "",
     "Yetkili2Unvan": "",
     "Yetkili3": "",
     "Yetkili3Unvan": "",
     "Yetkili4": "",
     "Yetkili4Unvan": "",*/

    /*"KullaniciNo": "ERP",
    "DegKayitTarihi": null,
    "DegKullaniciNo": "",
    "SaticiKod": "",
    "HatirlatmaTarihi": null,
    "Durumu": "",
    "IlkPlanTarihi": null,
    "GerceklesmeIptalTarihi": null,
    "IptalAciklamasi": "",
    "ErtelemeAciklamasi": ""*/


    static func getMyData(dir : Dictionary<String, Any>) -> Interview? {
        let interview = Interview()
        interview.aciklama = (dir["Aciklama"] as? String)!
        interview.Adres1 = (dir["Adres1"] as? String)!
        interview.Adres2 = (dir["Adres2"] as? String)!
        interview.Adres3 = (dir["Adres3"] as? String)!
        interview.email = (dir["Email"] as? String)!
        interview.faks = (dir["Faks"] as? String)!
        interview.Gsm = (dir["Gsm"] as? String)!
        interview.id = (dir["id"] as? Int)!
        interview.il = (dir["il"] as? String)!
        interview.ilce = (dir["ilce"] as? String)!
        interview.ulke = (dir["Ulke"] as? String)!
        interview.KullNos = (dir["KullNos"] as? String)!
        interview.konu = (dir["Konu"] as? String)!
        interview.Sirket_Kod = (dir["Sirket_Kod"] as? String)!
        interview.Tanim = (dir["Tanim"] as? String)!
        interview.Tarih = (dir["Tarih"] as? String)!
        interview.Tipi = (dir["Tipi"] as? String)!
        interview.KullaniciNo = (dir["KullaniciNo"] as? String)!
        
        return interview;
    }

    static func getSystemDate() -> String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        return formatter.string(from: date)
    }




}




