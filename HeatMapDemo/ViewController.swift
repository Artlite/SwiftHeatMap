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
    
    let pointArray:[HeatPoint]! = [
        HeatPoint(lat: 46.961936, andLng: 32.073569),
        HeatPoint(lat: 46.957660, andLng: 32.099490),
        HeatPoint(lat: 46.969756, andLng: 32.089877),
    ];
    
    let anotherHeatPoint:[HeatPoint]! = [
        HeatPoint(lat: 49.708178, andLng: 25.442376),
        HeatPoint(lat: 50.399451, andLng: 25.420403),
        HeatPoint(lat: 50.928697, andLng: 26.233392),
    ];
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.heatMap.delegate = self;
        self.heatMap.reloadDataWithArray(pointArray);
        NSTimer.scheduledTimerWithTimeInterval(10, target: self, selector: Selector("updateHeatMap"), userInfo: nil, repeats: false);
    }
    
    func mapView(mapView: MKMapView!, viewForOverlay overlay: MKOverlay!) -> MKOverlayView! {
        return HeatMKMapView.getHeatMapOverlay(overlay);
    }
    
    func updateHeatMap(){
        self.heatMap.reloadDataWithArray(self.anotherHeatPoint);
    }
}

