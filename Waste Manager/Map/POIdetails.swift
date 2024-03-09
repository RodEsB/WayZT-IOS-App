//
//  POIdetails.swift
//  Map
//
//  Created by iOS Lab on 28/02/24.
//

import Foundation
import SwiftUI
import MapKit

struct POIdetails: View {
    @Binding var mapSelection: MKMapItem?
    @Binding var showDetail: Bool
    @State var lookAroundScene: MKLookAroundScene?
    @Binding var getDirections : Bool
    
    var body: some View {
        VStack {
            HStack{
                VStack(alignment: .leading){
                    Text(mapSelection?.placemark.name ?? "")
                        .font(.title)
                        .fontWeight(.bold)
                    Text(mapSelection?.placemark.title ?? "")
                        .font(.caption2)
                        .foregroundStyle(.green)
                        .lineLimit(2)
                        .padding(.trailing)
                    
                }
                Spacer()
                
                Button{
                    showDetail.toggle()
                    mapSelection = nil
                }label : {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.gray, Color(.green))
                }
            }
            if let scene = lookAroundScene{
                LookAroundPreview(initialScene: scene)
                    .frame(height : 200)
                    .cornerRadius(15)
                    .padding()
            }else{
                ContentUnavailableView("Vista previa no disponible" , systemImage: "eye.slash")
            }
            HStack(spacing: 24){
                Button{
                    if let mapSelection{
                        mapSelection.openInMaps()
                    }
                }label: {
                    Text("Abrir en mapas")
                        .font(.headline)
                        .foregroundStyle(.blue)
                        .cornerRadius(25)
                }
                
                Button{
                    getDirections = true
                }label: {
                    Text("Obtener Direcciones")
                        .font(.headline)
                        .foregroundStyle(.blue)
                        .cornerRadius(25)
                }
            }
            .padding(.horizontal)
        }
        .onAppear{
            print("si se llamo")
            fetchLookAround()
        }
        .onChange(of: mapSelection){ oldValue , newValue in
            print("si se llamo")
            fetchLookAround()
        }
        .padding()
    }
}

extension POIdetails{
    func fetchLookAround(){
        if let mapSelection {
            lookAroundScene = nil
            Task{
                let request = MKLookAroundSceneRequest(mapItem: mapSelection)
                lookAroundScene = try? await request.scene
            }
        }
    }
}

#Preview {
    POIdetails(mapSelection: .constant(nil), showDetail: .constant(false), getDirections: .constant(false))
}
