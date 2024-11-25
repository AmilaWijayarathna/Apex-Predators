//
//  ApexPredator.swift
//  Apex Predators
//
//  Created by Amila Wijayarathna on 2024-11-16.
//

import Foundation
import SwiftUI
import MapKit

struct ApexPredator : Decodable, Identifiable{
    
    
    let id : Int
    let name : String
    let type : PredatorType
    let latitude : Double
    let longitude : Double
    let movies : [String]
    let movieScenes : [MovieScene]
    let link : String
    
    var image : String{
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    var location : CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    struct MovieScene : Decodable ,Identifiable{
        let id : Int
        let movie : String
        let sceneDescription : String
        
    }
    
    enum PredatorType : String,Decodable{
        
        case land
        case sea
        case air
        
        var background : Color{
            switch self {
            case .land:
                    .brown
            case .sea:
                    .teal
            case .air:
                    .blue
            }
            
        }
    }
}
