//
//  ShowCrumbViewController.swift
//  BreadCrumbs
//
//  Created by Forrest Zhao on 11/13/16.
//  Copyright © 2016 ForrestApps. All rights reserved.
//

import UIKit
import MapKit
import FirebaseDatabase

class ShowCrumbViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let ref = FIRDatabase.database().reference(withPath: "locations")
    var trailKey: String = ""
    var locations: [Location] = []
    var mapItemList: [MKMapItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        queryForLocations {
            self.convertLocationsToMapItem()
            self.addAnnotationsToMap()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func queryForLocations(completion: @escaping () -> Void) {
        let query = ref.queryOrdered(byChild: "trailKey").queryEqual(toValue: trailKey)
        query.observe(.value, with: { snapshot in
            var newLocations: [Location] = []
            for item in snapshot.children {
                let location = Location(snapshot: item as! FIRDataSnapshot)
                newLocations.append(location)
            }
            self.locations = newLocations
            completion()
        })
    }
    
    func convertLocationsToMapItem() {
        for location in locations {
            let placemark = MKPlacemark(coordinate: CLLocationCoordinate2DMake(location.latitude, location.longitude))
            mapItemList.append(MKMapItem(placemark: placemark))
        }
    }
    
    func addAnnotationsToMap() {
        var annotations: [MKAnnotation] = []
        for item in mapItemList {
            let annotation = MKPointAnnotation()
            annotation.coordinate = item.placemark.coordinate
            annotations.append(annotation)
        }
        let region = MKCoordinateRegion(center: annotations[0].coordinate, span: MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04))
        mapView.setRegion(region, animated: true)
        mapView.addAnnotations(annotations)
    }

}
