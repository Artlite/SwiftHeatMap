//
//  HeatMKMapView.h
//  HeatMapExample
//
//  Created by Dmitry Lernatovich on 7/28/15.
//  Copyright (c) 2015 Sly Bits. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>
#import "HeatMap.h"
#import "HeatMapView.h"
#import "HeatPoint.h"

@interface HeatMKMapView : MKMapView <MKMapViewDelegate>

@property (nonatomic, strong) NSMutableArray * heatPoints;

-(void) reloadData;
-(void)reloadDataWithArray: (NSArray *) array;
+(MKOverlayView *) getHeatMapOverlay: (id <MKOverlay>)overlay;

@end
