//
//  MapViewRepresentable.swift
//  TurdGo
//
//  Created by Kelly Bian on 6/12/23.
//

import SwiftUI
import MapKit


struct MapViewRepresentable: UIViewRepresentable {
    
    // all this stuff is just in the MapKit protocol so swift can actually use the map
    
    // object that is the map
    let mapView = MKMapView()
    
    // object that is location manager
    let locationManager = LocationManager()
    @EnvironmentObject var locationViewModel : LocationSearchModel
    
    // show map
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView
    }
    
    // update map exp: when user selects a location
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
        if let coordinate = locationViewModel.selectedLocationCoordinate {
//            print("Selected location in map view is: \(coordinate)")
            context.coordinator.addSelectAnnotation(withCoordinate: coordinate)
        }
        
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
    
}

extension MapViewRepresentable {

    class MapCoordinator : NSObject, MKMapViewDelegate {

        let parent: MapViewRepresentable

        init(parent: MapViewRepresentable) {
            self.parent = parent
            super.init()
        } // end of init
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            
            parent.mapView.setRegion(region, animated : true)
        }
        
        // helpers
        
        func addSelectAnnotation(withCoordinate coordinate: CLLocationCoordinate2D) {
            let anno = MKPointAnnotation()
            anno.coordinate = coordinate
            parent.mapView.addAnnotation(anno)
            parent.mapView.selectAnnotation(anno, animated: true)
            
            parent.mapView.showAnnotations(parent.mapView.annotations, animated: true)
        }
        
    }
}
