//
//  HeatMKMapView.m
//  HeatMapExample
//
//  Created by Dmitry Lernatovich on 7/28/15.
//  Copyright (c) 2015 Sly Bits. All rights reserved.
//

#import "HeatMKMapView.h"

@implementation HeatMKMapView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self onCreateHeatMap];
    }
    return self;
}

-(void)reloadData {
    [self onCreateHeatMap];
}

-(void)reloadDataWithArray: (NSArray *) array {
    self.heatPoints = array.mutableCopy;
    [self onCreateHeatMap];
}


-(void) onCreateHeatMap {
    if((self.heatPoints == nil) || (self.heatPoints.count <= 0)){
        return;
    }
    HeatMap *hm = [[HeatMap alloc] initWithData:[self heatMapData:self.heatPoints]];
    [self addOverlay:hm];
    [self setVisibleMapRect:[hm boundingMapRect] animated:YES];
}

- (NSDictionary *)heatMapData: (NSArray *) points
{
    NSMutableArray *csvContent = [NSMutableArray new];
    for (int i=0; i<points.count; i++) {
        HeatPoint * heatPoint = points[i];
        [csvContent addObject:[heatPoint toArray]];
    }
    NSMutableDictionary *toRet = [[NSMutableDictionary alloc] initWithCapacity:[csvContent count]];
    for (NSArray *line in csvContent) {
        MKMapPoint point = MKMapPointForCoordinate(CLLocationCoordinate2DMake([[line objectAtIndex:1] doubleValue], [[line objectAtIndex:0] doubleValue]));
        NSValue *pointValue = [NSValue value:&point withObjCType:@encode(MKMapPoint)];
        [toRet setObject:[NSNumber numberWithInt:1] forKey:pointValue];
    }
    
    return toRet;
}


+(MKOverlayView *) getHeatMapOverlay: (id <MKOverlay>)overlay {
    return [[HeatMapView alloc] initWithOverlay:overlay];
}

@end
