//
//  UIDEMapsViewController.h
//  UIDE
//
//  Created by Pablo Ochoa on 1/17/13.
//  Copyright (c) 2013 UIDE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapBox/MapBox.h>

@interface UIDEMapsViewController : UIViewController<RMMapViewDelegate>

@property (weak, nonatomic) IBOutlet RMMapView *mapView;

@end
