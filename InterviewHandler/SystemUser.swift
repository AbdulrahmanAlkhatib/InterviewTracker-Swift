//
//  SystemUser.swift
//  InterviewHandler
//
//  Created by Abdulrahman Alkhatib on 07/08/2017.
//  Copyright © 2017 Abdulrahman Alkhatib. All rights reserved.
//

import Foundation

class SystemUser{
    var id : Int?
    var name : String?
    var password : String?


    static func getDataFromApi(givenUrl : String, json : [String : Any], completion : @escaping ([Interview]) -> ()){
        
        var interviews : [Interview] = []

        
        var jsonData : Data = Data()
        
        
        do{
            jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
        }catch{
            print("sth gone wrong!")
        }
        
        
        let url = URL(string : givenUrl)
        var urlRequest = URLRequest( url: url!)
        urlRequest.httpMethod = "POST"
        //urlRequest.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        urlRequest.httpBody = jsonData
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
            if let data = data{
                do{
                    if let jsonDic = try JSONSerialization.jsonObject(with: data, options: []) as? [[String : Any]]{
                        for interviewDic in jsonDic{
                            if let interview = Interview.getMyData(dir: interviewDic){
                                interviews.append(interview)
                            }
                        }
                    
                    }else{
                        print("sth went wrong")
                    }
                }catch{
                    
                }
            }
            completion(interviews)
        }
        task.resume()
    }
}
