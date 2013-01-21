//
//  NewsViewController.m
//  UIDE
//
//  Created by Pablo Ochoa on 1/20/13.
//  Copyright (c) 2013 UIDE. All rights reserved.
//

#import "NewsViewController.h"
#import "SVProgressHUD.h"

@interface NewsViewController ()


@property (nonatomic, strong) NSMutableArray *searchResults;
@property (nonatomic, strong) IBOutlet UITableView *newsTableView;
@property (nonatomic, strong) IBOutlet UISearchBar *newsSearchBar;

- (void) reloadData;

@end

@implementation NewsViewController

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
	
    /*_pullToRefreshView = [[PullToRefreshView alloc] initWithScrollView:_newsTableView];
    _pullToRefreshView.delegate = self;
    [_newsTableView addSubview:_pullToRefreshView];*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reloadData
{
    [SVProgressHUD dismiss];
    UIView *overlayView = [self.searchDisplayController.searchContentsController.view viewWithTag:999];
    if(overlayView) [overlayView removeFromSuperview];
    self.searchDisplayController.searchResultsTableView.hidden = NO;
    [self.searchDisplayController.searchResultsTableView reloadData];
}

#pragma mark -
#pragma mark UITable View DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [_newsTableView
                             dequeueReusableCellWithIdentifier:@"NewsCell"];
	UILabel *titleLabel = (UILabel *)[cell viewWithTag:101];
    titleLabel.text = @"Title 1";
	UILabel *resumeLabel = (UILabel *)[cell viewWithTag:102];
	resumeLabel.text = @"News Resume Number 1, this will handle up to 3 lines";
	UIImageView *newsImageView = (UIImageView *)[cell viewWithTag:100];
    return cell;
}

#pragma mark UI Table View Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75.0;
}

/*#pragma mark -
#pragma mark PullToRefresh Delegate

- (void)pullToRefreshViewShouldRefresh:(PullToRefreshView *)view;
{
    NSLog(@"Here I should refresh data");
    [_pullToRefreshView performSelector:@selector(finishedLoading) withObject:nil afterDelay:2.0f];
    //[_pullToRefreshView setState:PullToRefreshViewStateNormal];
    //[self reloadTableData];
    
}*/

#pragma mark - UISearchDisplayController Delegate Methods
- (void)searchBarSearchButtonClicked:(UISearchBar*)searchBar
{
    //[self filterContentForSearchText:[self.searchDisplayController.searchBar text]
      //                         scope:[self.searchDisplayController.searchBar selectedScopeButtonIndex]];
    //[self.searchDisplayController.searchResultsTableView reloadData];
    
    [SVProgressHUD showWithStatus:@"Loading News..." maskType:SVProgressHUDMaskTypeBlack];
    [self performSelector:@selector(reloadData) withObject:nil afterDelay:2.0];

}


- (BOOL)searchDisplayController:(UISearchDisplayController*)controller
shouldReloadTableForSearchString:(NSString*)searchString
{
    return NO;
}

- (void)searchDisplayController:(UISearchDisplayController *)controller didShowSearchResultsTableView:(UITableView *)tableView
{

        self.searchDisplayController.searchResultsTableView.hidden = YES;
        UIView *searchTableViewOverlay = [[UIView alloc] initWithFrame:tableView.frame];
        searchTableViewOverlay.alpha = 0.8;
        searchTableViewOverlay.backgroundColor = [UIColor blackColor];
        searchTableViewOverlay.tag = 999;
        [self.searchDisplayController.searchContentsController.view addSubview:searchTableViewOverlay];

}

@end
