//
//  ShopViewController.m
//  TestShop
//
//  Created by Vincent Lee on 2/25/15.
//  Copyright (c) 2015 Vincent Lee - Analytics Pros. All rights reserved.
//

#import "ShopViewController.h"
#import "CheckoutViewController.h"

@interface ShopViewController ()

@property (strong, nonatomic) CheckoutViewController *checkoutVC;

@end

@implementation ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.checkoutVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CheckoutVC"];
}

-(IBAction)buyRedPressed:(id)sender {
    self.checkoutVC.numberOfRed++;
    [self pushToVC:self.checkoutVC];
}

-(IBAction)buyBluePressed:(id)sender {
    self.checkoutVC.numberOfBlue++;
    [self pushToVC:self.checkoutVC];
}

-(void)pushToVC:(UIViewController *)VC {
    [self.navigationController pushViewController:VC animated:true];
}

@end
