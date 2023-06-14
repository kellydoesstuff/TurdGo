//
//  LocationSearchModel.swift
//  TurdGo
//
//  Created by Kelly Bian on 6/13/23.
//

import Foundation
import MapKit

class LocationSearchModel: NSObject, ObservableObject {
    
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
    
}

extension LocationSearchModel: MKLocalSearchCompleterDelegate {
    
    // most recent search completion
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
    
}
