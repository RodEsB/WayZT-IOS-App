//  ContentView.swift
//  Map
//
//  Created by iOS Lab on 27/02/24.
//

import SwiftUI
import MapKit

struct RecycleMap: View {
    //Declare coordinates of point of interests
    @State private var position : MapCameraPosition = .region(.userRegion)
    @State private var results = [MKMapItem]()
    @State private var POISelection : MKMapItem?
    @State private var details = false
    @State private var getDirections = false
    @State private var route : MKRoute?
    @State private var routeView = false
    @State private var Destination : MKMapItem?
    @State private var USC = "University of Souther California"
    
    var body: some View {
        
        Map(position: $position , selection: $POISelection){
            UserAnnotation()
            // Convert coordinates to annotations
            ForEach(results, id: \.self) { mapItem in
                Marker("Puntos de reciclaje", systemImage : "waterbottle" ,coordinate: mapItem.placemark.coordinate)
                    .tint(.green)
                
            }
            
            if let route{
                MapPolyline(route.polyline)
                    .stroke(.blue, lineWidth: 8)
            }
            
        }
       
        .mapControls{
            MapUserLocationButton()
            MapPitchToggle()
        }
        .onAppear {
            CLLocationManager().requestWhenInUseAuthorization()
            convertCoordinates()
            //Task {await Search()}
        }
        
        .onChange(of: POISelection, {oldValue , newValue in
            details = newValue != nil
        })
        .onChange(of: getDirections, {oldValue , newValue in
            if newValue{
                fetchRoute()
            }
        })
        .onChange(of: POISelection, {oldValue , newValue in
            details = newValue != nil})
        .sheet(isPresented: $details, content: {POIdetails(mapSelection: $POISelection, showDetail: $details, getDirections: $getDirections)
                .presentationDetents([.height(340)])
                .presentationBackgroundInteraction(.enabled(upThrough: .height(340)))
                .presentationCornerRadius(20)
        })

    }
    
    
    func convertCoordinates() {
        
        results = coordinatesRecyclable.map { coordinate in
            
            let placemark = MKPlacemark(coordinate: coordinate)
            let mapItem = MKMapItem(placemark: placemark)
            
            return mapItem
            
        }
        
    }
    
    
    func fetchRoute(){
        
        if let POISelection{
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: .init(coordinate: .userLocation))
            request.destination = POISelection
            
            Task{
                let result = try? await MKDirections(request: request).calculate()
                route = result?.routes.first
                Destination = POISelection
                
                withAnimation(.snappy){
                    routeView = true
                    details = false
                    
                    if let rect = route?.polyline.boundingMapRect, routeView{
                        position = .rect(rect)
                    }
                }
            }
        }
    }
}
struct OrganicMap: View {
    //Declare coordinates of point of interests
    @State private var position : MapCameraPosition = .region(.userRegion)
    @State private var results = [MKMapItem]()
    @State private var POISelection : MKMapItem?
    @State private var details = false
    @State private var getDirections = false
    @State private var route : MKRoute?
    @State private var routeView = false
    @State private var Destination : MKMapItem?
    
    var body: some View {
        
        Map(position: $position , selection: $POISelection){
            UserAnnotation()
            // Convert coordinates to annotations
            ForEach(results, id: \.self) { mapItem in
                Marker("Puntos de reciclaje", systemImage : "carrot" ,coordinate: mapItem.placemark.coordinate)
                    .tint(.orange)
                    
            }
            
            if let route{
                MapPolyline(route.polyline)
                    .stroke(.blue, lineWidth: 8)
            }
            
        }
        .mapControls{
            MapUserLocationButton()
            MapPitchToggle()
        }
        .onAppear {
            CLLocationManager().requestWhenInUseAuthorization()
            convertCoordinates()
        }
        
        .onChange(of: POISelection, {oldValue , newValue in
            details = newValue != nil
        })
        .onChange(of: getDirections, {oldValue , newValue in
            if newValue{
                fetchRoute()
            }
        })
        .onChange(of: POISelection, {oldValue , newValue in
            details = newValue != nil})
        .sheet(isPresented: $details, content: {POIdetails(mapSelection: $POISelection, showDetail: $details, getDirections: $getDirections)
                .presentationDetents([.height(340)])
                .presentationBackgroundInteraction(.enabled(upThrough: .height(340)))
                .presentationCornerRadius(20)
        })

    }
    
    
    func convertCoordinates() {
        
        results = coordinatesOrganic.map { coordinate in
            
            let placemark = MKPlacemark(coordinate: coordinate)
            let mapItem = MKMapItem(placemark: placemark)
            
            return mapItem
            
        }
        
    }
    
    func fetchRoute(){
        
        if let POISelection{
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: .init(coordinate: .userLocation))
            request.destination = POISelection
            
            Task{
                let result = try? await MKDirections(request: request).calculate()
                route = result?.routes.first
                Destination = POISelection
                
                withAnimation(.snappy){
                    routeView = true
                    details = false
                    
                    if let rect = route?.polyline.boundingMapRect, routeView{
                        position = .rect(rect)
                    }
                }
            }
        }
    }
}


struct GlassMap: View {
    //Declare coordinates of point of interests
    @State private var position : MapCameraPosition = .region(.userRegion)
    @State private var results = [MKMapItem]()
    @State private var POISelection : MKMapItem?
    @State private var details = false
    @State private var getDirections = false
    @State private var route : MKRoute?
    @State private var routeView = false
    @State private var Destination : MKMapItem?
    
    var body: some View {
        
        Map(position: $position , selection: $POISelection){
            UserAnnotation()
            // Convert coordinates to annotations
            ForEach(results, id: \.self) { mapItem in
                Marker("Puntos de reciclaje", systemImage : "wineglass" ,coordinate: mapItem.placemark.coordinate)
                    .tint(.blue)
                    
            }
            
            if let route{
                MapPolyline(route.polyline)
                    .stroke(.blue, lineWidth: 8)
            }
            
        }
        .mapControls{
            MapUserLocationButton()
            MapPitchToggle()
        }
        .onAppear {
            CLLocationManager().requestWhenInUseAuthorization()
            convertCoordinates()
        }
        
        .onChange(of: POISelection, {oldValue , newValue in
            details = newValue != nil
        })
        .onChange(of: getDirections, {oldValue , newValue in
            if newValue{
                fetchRoute()
            }
        })
        .onChange(of: POISelection, {oldValue , newValue in
            details = newValue != nil})
        .sheet(isPresented: $details, content: {POIdetails(mapSelection: $POISelection, showDetail: $details, getDirections: $getDirections)
                .presentationDetents([.height(340)])
                .presentationBackgroundInteraction(.enabled(upThrough: .height(340)))
                .presentationCornerRadius(20)
        })

    }
    
    
    func convertCoordinates() {
        
        results = coordinatesGlass.map { coordinate in
            
            let placemark = MKPlacemark(coordinate: coordinate)
            let mapItem = MKMapItem(placemark: placemark)
            
            return mapItem
            
        }
        
    }
    
    
    func fetchRoute(){
        
        if let POISelection{
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: .init(coordinate: .userLocation))
            request.destination = POISelection
            
            Task{
                let result = try? await MKDirections(request: request).calculate()
                route = result?.routes.first
                Destination = POISelection
                
                withAnimation(.snappy){
                    routeView = true
                    details = false
                    
                    if let rect = route?.polyline.boundingMapRect, routeView{
                        position = .rect(rect)
                    }
                }
            }
        }
    }
}

struct ElectronicsMap: View {
    //Declare coordinates of point of interests
    @State private var position : MapCameraPosition = .region(.userRegion)
    @State private var results = [MKMapItem]()
    @State private var POISelection : MKMapItem?
    @State private var details = false
    @State private var getDirections = false
    @State private var route : MKRoute?
    @State private var routeView = false
    @State private var Destination : MKMapItem?
    
    var body: some View {
        
        Map(position: $position , selection: $POISelection){
            UserAnnotation()
            // Convert coordinates to annotations
            ForEach(results, id: \.self) { mapItem in
                let placemark = mapItem.placemark
                Marker("Puntos de reciclaje", systemImage : "macbook.and.iphone" ,coordinate: placemark.coordinate)
                    .tint(.yellow)
                    
            }
            
            if let route{
                MapPolyline(route.polyline)
                    .stroke(.blue, lineWidth: 8)
            }
            
        }
        .mapControls{
            MapUserLocationButton()
            MapPitchToggle()
            MapCompass()
        }
        .onAppear {
            CLLocationManager().requestWhenInUseAuthorization()
            convertCoordinates()
            
        }
        
        .onChange(of: POISelection, {oldValue , newValue in
            details = newValue != nil
        })
        .onChange(of: getDirections, {oldValue , newValue in
            if newValue{
                fetchRoute()
            }
        })
        .onChange(of: POISelection, {oldValue , newValue in
            details = newValue != nil})
        .sheet(isPresented: $details, content: {POIdetails(mapSelection: $POISelection, showDetail: $details, getDirections: $getDirections)
                .presentationDetents([.height(340)])
                .presentationBackgroundInteraction(.enabled(upThrough: .height(340)))
                .presentationCornerRadius(20)
        })

    }
    
    
    func convertCoordinates() {
        
        results = coordinatesElectronics.map { coordinate in
            
            let placemark = MKPlacemark(coordinate: coordinate)
            let mapItem = MKMapItem(placemark: placemark)
            
            return mapItem
            
        }
        
    }
    
    
    func fetchRoute(){
        
        if let POISelection{
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: .init(coordinate: .userLocation))
            request.destination = POISelection
            
            Task{
                let result = try? await MKDirections(request: request).calculate()
                route = result?.routes.first
                Destination = POISelection
                
                withAnimation(.snappy){
                    routeView = true
                    details = false
                    
                    if let rect = route?.polyline.boundingMapRect, routeView{
                        position = .rect(rect)
                    }
                }
            }
        }
    }
}



extension CLLocationCoordinate2D {
    static var userLocation : CLLocationCoordinate2D{
        return .init(latitude: 19.05408, longitude: -98.28362)
    }
}

extension MKCoordinateRegion{
    static var userRegion: MKCoordinateRegion{
        return .init(center: .userLocation,
                        latitudinalMeters: 15000,
                        longitudinalMeters: 15000)
    }
    //15000
}

extension RecycleMap{
    func Search() async{
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = USC
        request.region = .userRegion
        
        let results = try? await MKLocalSearch(request: request).start()
        self.results = results?.mapItems ?? []
    }
}

