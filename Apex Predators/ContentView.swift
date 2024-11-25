//
//  ContentView.swift
//  Apex Predators
//
//  Created by Amila Wijayarathna on 2024-11-15.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    let predators = Predators()
    @State var searchText =  ""
    @State var alphabetical =  false
    
    var filterdDinos : [ApexPredator]{
        predators.sort(by: alphabetical)
        return predators.search(for: searchText)
    }
    
    var body: some View {
        NavigationStack{
            List(filterdDinos){ predator in
                
                NavigationLink{
                    PredatorDetailView(predator: predator, position: .camera(MapCamera(centerCoordinate: predator.location, distance: 3000)))
                }label: {
                    
                    HStack{
                        
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100,height: 100)
                            .shadow(color:.white,radius: 1)
                        
                        VStack(alignment:.leading){
                            Text(predator.name)
                                .fontWeight(.bold)
                            
                            Text(predator.type.rawValue.capitalized)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.horizontal,13)
                                .padding(.vertical,5)
                                .background(predator.type.background)
                                .clipShape(.capsule)
                            
                        }
                        
                    }
                    
                    
                }
               
            } .navigationTitle("Apex Predators")
                .searchable(text: $searchText)
                .autocorrectionDisabled()
                .animation(.default, value: searchText)
                .toolbar{
                    
                    ToolbarItem(placement: .topBarLeading) {
                        Button{
                            withAnimation {
                                alphabetical.toggle()
                            }
                            
                        }label: {
                            Image(systemName: alphabetical ? "film" : "textformat")
                                .symbolEffect(.bounce, value: alphabetical)
                        }
                    }
                }
        }
        
        .preferredColorScheme(.dark)
    }
    
    
}

#Preview {
    ContentView()
}
