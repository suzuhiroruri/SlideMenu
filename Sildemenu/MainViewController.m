//
//  MainViewController.m
//  Sildemenu
//
//  Created by 鈴木 宏昌 on 2013/08/04.
//  Copyright (c) 2013年 鈴木 宏昌. All rights reserved.
//

#import "MainViewController.h"
#import "ECSlidingViewController.h"
#import "MenuViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize menuBtn;

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
    
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor= [UIColor blackColor].CGColor;
    
    //もしunderLeftViewControllerがMenuViewControllerでないならば、
    //storyboardのunderLeftViewControllerをMenuViewControllerにして開始する
    if(![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]){
        self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    /*
    else if(![self.slidingViewController.underRightViewController isKindOfClass:[MenuViewController class]]){
        self.slidingViewController.underRightViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
     */
    
    //スワイプのジェスチャーを感知する
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    
    
    //左上のメニューボタンのインスタンス作成
    self.menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //メニューボタンの座標
    menuBtn.frame = CGRectMake(8, 10, 34, 24);
    
    //メニューボタンの画像の設定
    [menuBtn setBackgroundImage:[UIImage imageNamed:@"menuButton.png" ]forState:UIControlStateNormal];
    
    //タッチし、ボタン内で話したらrevealMenuへ飛ぶ(revealMenuメソッドへデリゲート)
    [menuBtn addTarget:self action:@selector(revealMenu:) forControlEvents:UIControlEventTouchUpInside];
    
    //menuBtnを画面へ表示
    [self.view addSubview:self.menuBtn];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//menuBtnが押された場合の処理
-(IBAction)revealMenu:(id)sender{
    //ECRightメニューを出す
    [self.slidingViewController anchorTopViewTo:ECRight];
}

@end
