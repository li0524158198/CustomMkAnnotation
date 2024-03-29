//
//  BIDMapViewController.m
//  PROJ20130115
//
//  Created by liweihua on 13-1-15.
//  Copyright (c) 2013年 liweihua. All rights reserved.
//


#import "BIDMapViewController.h"
#import "JingDianMapCell.h"
#define span 40000

@interface BIDMapViewController ()
{
    NSMutableArray *_annotationList;
    
    CalloutMapAnnotation *_calloutAnnotation;
    CalloutMapAnnotation  *_previousdAnnotation;
    

}

-(void)setAnnotionsWithList:(NSArray *)list;
@end

@implementation BIDMapViewController

@synthesize mapView = _mapView;
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _annotationList = [[NSMutableArray alloc]init];
    
}

-(void)setAnnotionsWithList:(NSArray *)list
{
//    NSLog(@"%@",list);
    for(NSDictionary *dic in list)
    {
        CLLocationDegrees latitude = [[dic objectForKey:@"latitude"] doubleValue];
        CLLocationDegrees longitude = [[dic objectForKey:@"longitude"] doubleValue];
        CLLocationCoordinate2D location = CLLocationCoordinate2DMake(latitude, longitude);
        
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location, span, span);
        
        MKCoordinateRegion adjustedRegion = [_mapView regionThatFits:region];
        [_mapView setRegion:adjustedRegion animated:YES];
        
        BasicMapAnnotation  * annotion = [[[BasicMapAnnotation alloc] initWithLatitude:latitude andLongitude:longitude] autorelease];
        
        [_mapView addAnnotation:annotion];
        
    }
}

//
//- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
//	if ([view.annotation isKindOfClass:[BasicMapAnnotation class]]) {
//        if (_calloutAnnotation.coordinate.latitude == view.annotation.coordinate.latitude&&
//            _calloutAnnotation.coordinate.longitude == view.annotation.coordinate.longitude) {
//            return;
//        }
//        if (_calloutAnnotation) {
//            [mapView removeAnnotation:_calloutAnnotation];
//            _calloutAnnotation = nil;
//        }
//        _calloutAnnotation = [[[CalloutMapAnnotation alloc]
//                               initWithLatitude:view.annotation.coordinate.latitude
//                               andLongitude:view.annotation.coordinate.longitude] autorelease];
//        [mapView addAnnotation:_calloutAnnotation];
//        
//        [mapView setCenterCoordinate:_calloutAnnotation.coordinate animated:YES];
//	}
//    else{
//        if([delegate respondsToSelector:@selector(customMKMapViewDidSelectedWithInfo:)]){
//            [delegate customMKMapViewDidSelectedWithInfo:@"点击至之后你要在这干点啥"];
//        }
//    }
//}
//
//- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
//    if (_calloutAnnotation&& ![view isKindOfClass:[CallOutAnnotationView class]]) {
//        if (_calloutAnnotation.coordinate.latitude == view.annotation.coordinate.latitude&&
//            _calloutAnnotation.coordinate.longitude == view.annotation.coordinate.longitude) {
//            [mapView removeAnnotation:_calloutAnnotation];
//            _calloutAnnotation = nil;
//        }
//    }
//}
//
//- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
//	if ([annotation isKindOfClass:[CalloutMapAnnotation class]]) {
//        
//        CallOutAnnotationView *annotationView = (CallOutAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CalloutView"];
//        if (!annotationView) {
//            annotationView = [[[CallOutAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CalloutView"] autorelease];
//            JingDianMapCell  *cell = [[[NSBundle mainBundle] loadNibNamed:@"JingDianMapCell" owner:self options:nil] objectAtIndex:0];
//            [annotationView.contentView addSubview:cell];
//            
//        }
//        return annotationView;
//	} else if ([annotation isKindOfClass:[BasicMapAnnotation class]]) {
//        
//        MKAnnotationView *annotationView =[self.mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomAnnotation"];
//        if (!annotationView) {
//            annotationView = [[[MKAnnotationView alloc] initWithAnnotation:annotation
//                                                           reuseIdentifier:@"CustomAnnotation"] autorelease];
//            annotationView.canShowCallout = NO;
//            annotationView.image = [UIImage imageNamed:@"pin.png"];
//        }
//		
//		return annotationView;
//    }
//	return nil;
//}

- (void) resetAnnitations:(NSArray *)data
{
    [_annotationList removeAllObjects];
    [_annotationList addObjectsFromArray:data];
    [self setAnnotionsWithList:_annotationList];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_mapView release];
    [super dealloc];
}
@end
