//
//  UIDEMapsViewController.m
//  UIDE
//
//  Created by Pablo Ochoa on 1/17/13.
//  Copyright (c) 2013 UIDE. All rights reserved.
//

#import "UIDEMapsViewController.h"
#import "ZUUIRevealController.h"

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
