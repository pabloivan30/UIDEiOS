//
//  UIDEMapsViewController.m
//  UIDE
//
//  Created by Pablo Ochoa on 1/17/13.
//  Copyright (c) 2013 UIDE. All rights reserved.
//

#import "UIDEMapsViewController.h"
#import "ZUUIRevealController.h"
#import <MapBox/MapBox.h>

@interface UIDEMapsViewController ()

@end

@implementation UIDEMapsViewController

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
    
    self.parentViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Reveal"
                                                                            style:UIBarButtonItemStylePlain
                                                                           target:self.parentViewController
                                                                           action:@selector(revealToggle:)];
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self.parentViewController action:@selector(revealGesture:)];
    [self.parentViewController.navigationController.navigationBar addGestureRecognizer:panRecognizer];
    
    //Get Resource for offline maps
    NSString *uideMapResource = [[NSBundle mainBundle] pathForResource:@"Historico" ofType:@"mbtiles"];
    NSURL *uideMapResourceURL = [NSURL fileURLWithPath:uideMapResource];
    RMMBTilesSource *offlineSource = [[RMMBTilesSource alloc] initWithTileSetURL:uideMapResourceURL];
    _mapView.tileSource = offlineSource;
    _mapView.zoom = 2;
    _mapView.adjustTilesForRetinaDisplay = YES; // these tiles aren't designed specifically for retina, so make them legible
    _mapView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setMapView:nil];
    [super viewDidUnload];
}

- (void)singleTapOnMap:(RMMapView *)mapView at:(CGPoint)point
{
     CLLocationCoordinate2D coordinate = [mapView pixelToCoordinate:point];
     NSLog(@"latitude: %f: longitude: %f",coordinate.latitude,coordinate.longitude);
}
@end
