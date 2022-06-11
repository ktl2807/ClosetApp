//
//  Clothes.swift
//  OOTD
//
//  Created by sand liao on 07/06/2022.
//

import Foundation

struct Clothes:Identifiable, Codable{
    var id = UUID()
    var title = ""
    var freqency = 3.0
    var material = ""
    var washingNotice = ""
    var top = false
    var bottom = false
    var acc = false
    var shoes = false
    
}

class ClothesStorage: ObservableObject{
    @Published var clothes = [Clothes]()
    
    init(){
        if let data = UserDefaults.standard.data(forKey: "Save"){
            if let decoded = try? JSONDecoder().decode([Clothes].self, from: data){
                clothes = decoded
                return
            }
        }
        clothes = []
    }
    
    func saveData(){
        if let encoded = try? JSONEncoder().encode(clothes){
            UserDefaults.standard.set(encoded, forKey: "Save")        }
    }
}
