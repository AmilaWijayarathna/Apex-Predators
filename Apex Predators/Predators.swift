//
//  Predators.swift
//  Apex Predators
//
//  Created by Amila Wijayarathna on 2024-11-17.
//

import Foundation

class Predators{
    
    var apexPredators : [ApexPredator] = []
    var allPredators : [ApexPredator] = []
    
    init(){
        decodePredtatorData()
    }
    
    func decodePredtatorData(){
        
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json"){
            
            do{
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                apexPredators = try decoder.decode([ApexPredator].self, from: data)
                allPredators = apexPredators
            }catch{
                print("error")
            }
        }
        
    }
    
    func search(for searchTerm : String) -> [ApexPredator]{
        if searchTerm.isEmpty{
            return apexPredators
        }else{
            return apexPredators.filter { predator in
                predator.name.localizedCaseInsensitiveContains(searchTerm)
            }
        }
        
    }
    
    func sort(by alphabetical : Bool){
        
        apexPredators.sort { predator1, predator2 in
            if alphabetical{
                predator1.name < predator2.name
            }else{
                predator1.id < predator2.id
            }
        }
    }
    
    func filter(by type : PredatorType){
        
        if type == .all{
            apexPredators = allPredators
        }else{
            apexPredators = allPredators.filter{ predator in
                predator.type == type
            }
        }
    }
}
