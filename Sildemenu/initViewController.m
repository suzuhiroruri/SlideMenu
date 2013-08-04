//
//  initViewController.m
//  Sildemenu
//
//  Created by 鈴木 宏昌 on 2013/08/04.
//  Copyright (c) 2013年 鈴木 宏昌. All rights reserved.
//

#import "initViewController.h"
#import "MainViewController.h"

@interface initViewController ()

@end

@implementation initViewController

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
	// Do any additional setup after loading the view.
    
    self.topViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"Me"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
