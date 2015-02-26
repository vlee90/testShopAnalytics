//
//  CheckoutViewController.m
//  TestShop
//
//  Created by Vincent Lee on 2/25/15.
//  Copyright (c) 2015 Vincent Lee - Analytics Pros. All rights reserved.
//

#import "CheckoutViewController.h"
#import "ThankYouViewController.h"
#import "TAGDataLayer.h"
#import "TAGManager.h"

@interface CheckoutViewController ()

@property (weak, nonatomic) IBOutlet UILabel *redLabel;
@property (weak, nonatomic) IBOutlet UILabel *blueLabel;


@end

@implementation CheckoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.redLabel.text = [NSString stringWithFormat:@"You have bought %ld red flowers", self.numberOfRed];
    self.blueLabel.text = [NSString stringWithFormat:@"You have bought %ld blue flowers", self.numberOfBlue];
    TAGDataLayer *dataLayer = [TAGManager instance].dataLayer;
    [dataLayer push:@{@"event" : @"screen opened",
                      @"screenName" : @"Checkout Screen"}];
    

}

-(IBAction)confirmCheckoutPressed:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    ThankYouViewController *thankYouVC = [storyboard instantiateViewControllerWithIdentifier:@"ThankYouVC"];
    [self.navigationController pushViewController:thankYouVC animated:true];
}

@end
