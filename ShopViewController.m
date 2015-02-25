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

@end

@implementation ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(IBAction)buyRedPressed:(id)sender {
    [self pushToCheckoutVC];
}

-(IBAction)buyBluePressed:(id)sender {
    [self pushToCheckoutVC];
}

-(void)pushToCheckoutVC {
    CheckoutViewController *checkoutVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CheckoutVC"];
    [self.navigationController pushViewController:checkoutVC animated:true];
}

@end
