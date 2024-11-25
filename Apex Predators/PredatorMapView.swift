//
//  PredatorMapView.swift
//  Apex Predators
//
//  Created by Amila Wijayarathna on 2024-11-25.
//

import SwiftUI
import MapKit

struct PredatorMapView: View {
    
    let predators = Predators()
    @State var position : MapCameraPosition
    @State var sattelite = false
    
    var body: some View {
        Map(position: $position){
            ForEach(predators.apexPredators){ predator in
                Annotation(predator.name, coordinate: predator.location) {
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .scaleEffect(x:-1)
                        .shadow(color: .white,radius: 3)
                }
            }
        }
       
        .mapStyle(sattelite ? .imagery(elevation: .realistic) : .standard(elevation: .realistic))
        .overlay(alignment: .bottomTrailing) {
            Button{
                sattelite.toggle()
            }label: {
                Image(systemName:  sattelite ? "globe.americas.fill" : "globe.americas")
                    .font(.largeTitle)
                    .imageScale(.large)
                    .padding(5)
                    .background(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 7))
            }
        }
        .toolbarBackground(.automatic)
    }
}

#Preview {
    PredatorMapView(position: .camera(MapCamera(centerCoordinate: Predators().apexPredators[2].location, distance: 1000, heading: 50, pitch: 80)))
}
