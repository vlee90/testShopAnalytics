//
//  ThankYouViewController.m
//  TestShop
//
//  Created by Vincent Lee on 2/25/15.
//  Copyright (c) 2015 Vincent Lee - Analytics Pros. All rights reserved.
//

#import "ThankYouViewController.h"
#import "TAGManager.h"
#import "TAGDataLayer.h"

@interface ThankYouViewController ()

@end

@implementation ThankYouViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    TAGDataLayer *dataLayer = [TAGManager instance].dataLayer;
    [dataLayer push:@{@"event" : @"screen opened",
                      @"screenName" : @"ThankYou Screen"}];
}

@end
