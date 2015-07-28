//
//  HeatPoint.h
//  HeatMapExample
//
//  Created by Dmitry Lernatovich on 7/28/15.
//  Copyright (c) 2015 Sly Bits. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeatPoint : NSObject

@property (nonatomic, assign) double lat;
@property (nonatomic, assign) double lng;

-(instancetype)initWithLat: (double) lat andLng: (double) lng;
-(NSArray *) toArray;

@end
