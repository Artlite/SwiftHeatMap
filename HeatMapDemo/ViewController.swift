//
//  ViewController.swift
//  HeatMapDemo
//
//  Created by Dmitry Lernatovich on 7/28/15.
//  Copyright (c) 2015 Dmitry Lernatovich. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var heatMap: HeatMKMapView!;
    

    override func viewDidLoad() {
        super.viewDidLoad();
        var pointArray:[HeatPoint]! = [HeatPoint]();
        pointArray.append(HeatPoint(lat: 46.961936, andLng: 32.073569));
        pointArray.append(HeatPoint(lat: 46.957660, andLng: 32.099490));
        pointArray.append(HeatPoint(lat: 46.969756, andLng: 32.089877));
        
        self.heatMap.delegate = self;
        self.heatMap.reloadDataWithArray(pointArray);
    }
    
    func mapView(mapView: MKMapView!, viewForOverlay overlay: MKOverlay!) -> MKOverlayView! {
        return HeatMKMapView.getHeatMapOverlay(overlay);
    }
}

