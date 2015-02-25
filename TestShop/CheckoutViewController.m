//
//  CheckoutViewController.m
//  TestShop
//
//  Created by Vincent Lee on 2/25/15.
//  Copyright (c) 2015 Vincent Lee - Analytics Pros. All rights reserved.
//

#import "CheckoutViewController.h"
#import "ThankYouViewController.h"
#import "GAI.h"
#import "GAIDictionaryBuilder.h"
#import "GAITracker.h"

@interface CheckoutViewController ()

@property (weak, nonatomic) IBOutlet UILabel *redLabel;
@property (weak, nonatomic) IBOutlet UILabel *blueLabel;


@end

@implementation CheckoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.redLabel.text = [NSString stringWithFormat:@"You have bought %ld red flowers", self.numberOfRed];
    self.blueLabel.text = [NSString stringWithFormat:@"You have bought %ld blue flowers", self.numberOfBlue];
    

}

-(void)viewDidAppear:(BOOL)animated {
    self.screenName = @"Checkout Screen";
    [super viewDidAppear:animated];
}

-(IBAction)confirmCheckoutPressed:(id)sender {
    id tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"Button"
                                                          action:@"Pressed"
                                                           label:@"Checkout Complete"
                                                           value:@2] build]];
    
    [tracker send:[[GAIDictionaryBuilder createItemWithTransactionId:@"555"
                                                                name:@"Red"
                                                                 sku:@"1"
                                                            category:@"Colors"
                                                               price:@5
                                                            quantity:[NSNumber numberWithInteger:_numberOfRed]
                                                        currencyCode:@"USD"] build]];
    
    [tracker send:[[GAIDictionaryBuilder createItemWithTransactionId:@"444"
                                                                name:@"Blue"
                                                                 sku:@"2"
                                                            category:@"Color"
                                                               price:@10
                                                            quantity:[NSNumber numberWithInteger:_numberOfBlue]
                                                        currencyCode:@"USD"] build]];
    
    [tracker send:[[GAIDictionaryBuilder createTransactionWithId:@"12345"
                                                     affiliation:@"Analytic Color Pros"
                                                         revenue:[NSNumber numberWithInteger:(_numberOfBlue * 10 + _numberOfRed * 5)]
                                                             tax:@1.2
                                                        shipping:@6
                                                    currencyCode:@"USD"] build]];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    ThankYouViewController *thankYouVC = [storyboard instantiateViewControllerWithIdentifier:@"ThankYouVC"];
    [self.navigationController pushViewController:thankYouVC animated:true];
}

@end
