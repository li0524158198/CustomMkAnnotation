//
//  BIDMapViewController.h
//  PROJ20130115
//
//  Created by liweihua on 13-1-15.
//  Copyright (c) 2013年 liweihua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import "BasicMapAnnotation.h"
#import "CallOutAnnotationVifew.h"

@protocol MapViewControllerDidSelectDelegate;

@interface BIDMapViewController : UIViewController<MKMapViewDelegate>
{
    MKMapView *_mapView;
    
    id<MapViewControllerDidSelectDelegate> delegate;
}
@property (retain, nonatomic) IBOutlet MKMapView *mapView;

@property (nonatomic,retain) id<MapViewControllerDidSelectDelegate> delegate;


- (void) resetAnnitations:(NSArray *)data;
@end

@protocol MapViewControllerDidSelectDelegate <NSObject>

@optional
- (void) customMKMapViewDidSelectedWithInfo:(id)info;

@end