//
//  DetailViewController.h
//  Hub
//
//  Created by Panneerselvam, Rajkumar on 3/18/15.
//  Copyright (c) 2015 Panneerselvam, Rajkumar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIButton *flow1Button;

- (IBAction)flow1ButtonClicked:(id)sender;

@end

