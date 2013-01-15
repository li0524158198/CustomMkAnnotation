//
//  BIDMapViewController.m
//  PROJ20130115
//
//  Created by liweihua on 13-1-15.
//  Copyright (c) 2013年 liweihua. All rights reserved.
//


#import "BIDMapViewController.h"
#define span 40000

@interface BIDMapViewController ()
{
    NSMutableArray *_annotationList;
}

-(void)setAnnotionsWithList:(NSArray *)list;
@end

@implementation BIDMapViewController


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
    NSLog(@"%@",list);
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

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
 if ([annotation isKindOfClass:[BasicMapAnnotation class]]) {
        
        MKAnnotationView *annotationView =[self.mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomAnnotation"];
        if (!annotationView) {
            annotationView = [[[MKAnnotationView alloc] initWithAnnotation:annotation
                                                           reuseIdentifier:@"CustomAnnotation"] autorelease];
            annotationView.canShowCallout = NO;
            annotationView.image = [UIImage imageNamed:@"pin.png"];
        }
		
		return annotationView;
    }
	return nil;
}

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
