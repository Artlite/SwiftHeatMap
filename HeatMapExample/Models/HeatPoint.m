//
//  HeatPoint.m
//  HeatMapExample
//
//  Created by Dmitry Lernatovich on 7/28/15.
//  Copyright (c) 2015 Sly Bits. All rights reserved.
//

#import "HeatPoint.h"

@implementation HeatPoint

-(instancetype)initWithLat: (double) lat andLng: (double) lng; {
    self = [super init];
    if (self) {
        self.lat = lat;
        self.lng = lng;
    }
    return self;
}

-(NSArray *) toArray {
    NSMutableArray * array = [NSMutableArray new];
    [array addObject:[NSString stringWithFormat:@"%f", self.lng]];
    [array addObject:[NSString stringWithFormat:@"%f", self.lat]];
    return array;
}

@end
