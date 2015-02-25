//
//  CheckoutViewController.m
//  TestShop
//
//  Created by Vincent Lee on 2/25/15.
//  Copyright (c) 2015 Vincent Lee - Analytics Pros. All rights reserved.
//

#import "CheckoutViewController.h"
#import "ThankYouViewController.h"

@interface CheckoutViewController ()

@end

@implementation CheckoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)confirmCheckoutPressed:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    ThankYouViewController *thankYouVC = [storyboard instantiateViewControllerWithIdentifier:@"ThankYouVC"];
    [self.navigationController pushViewController:thankYouVC animated:true];
}

@end
