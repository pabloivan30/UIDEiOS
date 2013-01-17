//
//  ViewController.m
//  UIDE
//
//  Created by Pablo Ochoa on 1/17/13.
//  Copyright (c) 2013 UIDE. All rights reserved.
//

#import "MainMenuViewController.h"
#import "MainMenuButtonCell.h"

NSString *MainMenuButtonIdentifier = @"MainMenuButtonIdentifier";
CGSize MainMenuButtonCellSize = { .height = 96, .width = 87 };

@interface MainMenuViewController ()
{
    NSDictionary *_allowedOptionsDictionary;
}
@property(nonatomic, strong) IBOutlet PSTCollectionView *optionsView;

@end

@implementation MainMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    PSTCollectionViewFlowLayout *layout = [[PSTCollectionViewFlowLayout alloc] init];
    _optionsView.collectionViewLayout = layout;
    _optionsView.delegate = self;
    _optionsView.dataSource = self;
    _optionsView.backgroundColor = [UIColor blackColor];
    [_optionsView registerClass:[MainMenuButtonCell class] forCellWithReuseIdentifier:MainMenuButtonIdentifier];
    
    _allowedOptionsDictionary = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"Segue1",@"Segue2",@"Segue3",@"Segue4",@"Segue5",@"Segue6",nil] forKeys:[NSArray arrayWithObjects:@"Button1",@"Button2",@"Button3",@"Button4",@"Button5",@"Button6",nil]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Collection View Data Source

- (PSTCollectionViewCell *)collectionView:(PSTCollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MainMenuButtonCell *button = [collectionView dequeueReusableCellWithReuseIdentifier:MainMenuButtonIdentifier forIndexPath:indexPath];
    button.title.text = [NSString stringWithFormat:@"{%ld,%ld}", (long)indexPath.row, (long)indexPath.section];
    
    // load the image for this cell
    //NSString *imageToLoad = [NSString stringWithFormat:@"%d.JPG", indexPath.row];
    //cell.image.image = [UIImage imageNamed:imageToLoad];
    button.backgroundColor = [UIColor whiteColor];
    return button;
}


- (NSInteger)collectionView:(PSUICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return _allowedOptionsDictionary.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(PSTCollectionView *)collectionView{
    return 1;
}

#pragma mark -
#pragma mark Collection View Delegate

- (void)collectionView:(PSUICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@ - %@", NSStringFromSelector(_cmd), indexPath);
}

- (void)collectionView:(PSUICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@ - %@", NSStringFromSelector(_cmd), indexPath);
}

#pragma mark – UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(PSTCollectionView *)collectionView layout:(PSTCollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return MainMenuButtonCellSize;
}

- (UIEdgeInsets) collectionView:(PSTCollectionView *)collectionView layout:(PSTCollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(50, 20, 50, 20);
}

@end
