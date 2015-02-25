//
//  ShopViewController.m
//  TestShop
//
//  Created by Vincent Lee on 2/25/15.
//  Copyright (c) 2015 Vincent Lee - Analytics Pros. All rights reserved.
//

#import "ShopViewController.h"
#import "CheckoutViewController.h"
#import "GAIDictionaryBuilder.h"
#import "GAITracker.h"
#import "GAI.h"

@interface ShopViewController ()

@property (strong, nonatomic) CheckoutViewController *checkoutVC;
@property (weak, nonatomic) IBOutlet UILabel *redLabel;
@property (weak, nonatomic) IBOutlet UILabel *blueLabel;

@end

@implementation ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.checkoutVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CheckoutVC"];
}

-(void)viewDidAppear:(BOOL)animated {
    self.screenName = @"Shop Screen";
    [super viewDidAppear:animated];
    
}

-(IBAction)buyRedPressed:(id)sender {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"Button"
                                                         action:@"Pressed"
                                                          label:@"Add Red"
                                                           value:@5] build]];
    
    
    
    self.checkoutVC.numberOfRed++;
    _redLabel.text = [NSString stringWithFormat:@"%ld", (long)self.checkoutVC.numberOfRed];
    
}

-(IBAction)buyBluePressed:(id)sender {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"Button"
                                                          action:@"Pressed"
                                                           label:@"Add Blue"
                                                           value:@10] build]];
    self.checkoutVC.numberOfBlue++;
     _blueLabel.text = [NSString stringWithFormat:@"%ld", (long)self.checkoutVC.numberOfBlue];
}
- (IBAction)confirmButtonPressed:(id)sender {
    [self pushToVC:self.checkoutVC];
}

-(void)pushToVC:(UIViewController *)VC {
    [self.navigationController pushViewController:VC animated:true];
}

@end
