//
//  LocationSearchModel.swift
//  TurdGo
//
//  Created by Kelly Bian on 6/13/23.
//

import Foundation
import MapKit

class LocationSearchModel: NSObject, ObservableObject {
    
    @Published var selectedLocationCoordinate: CLLocationCoordinate2D?
    // this is for search completion
    @Published var results = [MKLocalSearchCompletion] ()
    
    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment : String = "" {
        didSet {
//            print(queryFragment)
            searchCompleter.queryFragment = queryFragment
            
        }
    }
    
    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
        
    }
    
    func selectLocation(_ localSearch: MKLocalSearchCompletion) {
        locationSearch(forLocalSearchCompletion: localSearch) { response, error in
           
            if let error = error {
                print("Debug: location serach failed w/error: \(error.localizedDescription)")
                return
            }
            
            guard let item = response?.mapItems.first else {return}
            let coordinate = item.placemark.coordinate
            self.selectedLocationCoordinate = coordinate
            print("Debug: location coordinate: \(coordinate)")
        }
//        self.selectedLocation = location
//
//        print("location is \(self.selectedLocation)")
    }
    
    func locationSearch(forLocalSearchCompletion localSearch: MKLocalSearchCompletion, completion: @escaping MKLocalSearch.CompletionHandler) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = localSearch.title.appending(localSearch.subtitle)
        let search = MKLocalSearch(request: searchRequest)
        
        search.start(completionHandler: completion)
    }
    
}

extension LocationSearchModel: MKLocalSearchCompleterDelegate {
    
    // most recent search completion
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
    
}
