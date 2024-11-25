//
//  PredatorDetailView.swift
//  Apex Predators
//
//  Created by Amila Wijayarathna on 2024-11-23.
//

import SwiftUI
import MapKit

struct PredatorDetailView: View {
    
    let predator : ApexPredator
    @State var position : MapCameraPosition

    
    var body: some View {
        GeometryReader{ geo in
            
            ScrollView{
                ZStack(alignment: .bottomTrailing) {
                    
                    
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                        .overlay{
                            LinearGradient(stops: [
                                Gradient.Stop(color: .clear, location: 0.8),
                                Gradient.Stop(color: .black, location: 1.0)
                            ], startPoint: .top, endPoint: .bottom)
                        }
                    
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/1.5,height: geo.size.height/3)
                        .scaleEffect(x:-1)
                        .offset(y:20)
                        .shadow(color: .black, radius: 7)
                        
                }
              
                
                VStack(alignment:.leading){
                    Text(predator.name)
                        .font(.largeTitle)
                    
                    NavigationLink{
                        
                        PredatorMapView(position:  .camera(MapCamera(centerCoordinate: predator.location, distance: 1000, heading: 50, pitch: 80)))
                        
                    }label: {
                        
                        Map(position: $position){
                            Annotation(predator.name, coordinate: predator.location) {
                                Image(systemName: "mappin.and.ellipse")
                                    .font(.largeTitle)
                                    .imageScale(.large)
                                    .symbolEffect(.pulse)
                            }
                        }
                        .frame(height: 125)
                        .toolbarBackground(.automatic)

                        .overlay(alignment: .trailing) {
                             Image(systemName: "greaterthan")
                                .imageScale(.large)
                                .font(.title3)
                                .padding(.trailing,15)
                        }
                        .overlay(alignment: .topLeading) {
                            Text("Currenrt Location")
                                .padding([.leading,.bottom],5)
                                .background(.black.opacity(0.33))
                                .clipShape(.rect(bottomTrailingRadius: 15))
                        }
                        .clipShape(.rect(cornerRadius: 15))
                    }
                    
                    Text("Appears in :")
                        .font(.title3)
                        .padding(.top)
                    
                    ForEach(predator.movies , id: \.self){ movie in
                        
                        Text("·" + movie)
                            .font(.subheadline)
                    }
                    
                    Text("Movie Moments")
                        .font(.title2)
                        .padding(.top,02)
                    
                    ForEach(predator.movieScenes){ movieScene in
                        
                        Text(movieScene.movie)
                            .font(.title2)
                            .padding(.vertical,1)
                        
                        Text(movieScene.sceneDescription)
                            .padding(.bottom,15)
                    }
                    
                    Text("Read more:")
                        .font(.caption)
                    
                    Link( predator.link,destination: URL(string: predator.link)!)
                        .foregroundColor(.blue)
                        .font(.caption)
                         
    
                }
                .padding()
                .padding(.bottom)
                .frame(width: geo.size.width,alignment: .leading)
                
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    PredatorDetailView(predator: Predators().apexPredators[2], position: .camera(MapCamera(centerCoordinate: Predators().apexPredators[2].location, distance: 30000)))
        .preferredColorScheme(.dark)
}
