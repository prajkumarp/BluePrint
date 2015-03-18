//
//  DetailViewController.m
//  Hub
//
//  Created by Panneerselvam, Rajkumar on 3/18/15.
//  Copyright (c) 2015 Panneerselvam, Rajkumar. All rights reserved.
//

#import "DetailViewController.h"
#import <App1/App1.h>
@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)flow1ButtonClicked:(id)sender{
    NSLog(@"Push it buddy");
    Class vcClass = NSClassFromString(@"ViewController2");
    NSBundle* resourcesBundle = [NSBundle bundleForClass:vcClass];
    UIViewController *vc2 = [[vcClass alloc] init];
    [[self navigationController] pushViewController:vc2 animated:YES];
}

@end
