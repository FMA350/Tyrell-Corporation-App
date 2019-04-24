//
//  IO.swift
//  TyrellCorp
//
//  Created by Francesco Maria Moneta (BFS EUROPE) on 23/04/2019.
//  Copyright © 2019 wipro.com. All rights reserved.
//

import Foundation


struct UserData : Codable{
    let email : String
    let password : String
    let statusCode : Int
}


func loadUserData(key:String)-> UserData?{
    guard let jsonData = UserDefaults.standard.data(forKey: key) else{
        return nil
    }
    guard let userData = try? JSONDecoder().decode(UserData.self, from: jsonData) else{
        return nil
    }
    return userData
}

func saveUserData(userData : UserData){
    print(userData)
    let jsonData = try! JSONEncoder().encode(userData)
    print(jsonData)
    UserDefaults.standard.set(jsonData, forKey: userData.email)
}
