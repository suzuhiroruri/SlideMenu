//
//  MenuViewController.m
//  Sildemenu
//
//  Created by 鈴木 宏昌 on 2013/08/04.
//  Copyright (c) 2013年 鈴木 宏昌. All rights reserved.
//


#import "MenuViewController.h"
#import "ECSlidingViewController.h"


@interface MenuViewController ()

@property (strong,nonatomic)NSArray *menu;
@property (strong,nonatomic)NSArray *section1;
@property (strong,nonatomic)NSArray *section2;

@end

@implementation MenuViewController
@synthesize menu,section1,section2;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.section1 = [NSArray arrayWithObjects:@"Me",@"Friends",@"Everything", nil];
    self.section2 = [NSArray arrayWithObjects:@"Notifications", @"Everything Else", nil];
    
    
    //項目として表示するためのメニューを配列に格納する
    self.menu = [NSArray arrayWithObjects:self.section1,self.section2, nil];
    
    
    //幅200ピクセルでメニューを表示する(アンカーポイント)
    [self.slidingViewController setAnchorRightRevealAmount:200.0f];
    self.slidingViewController.underLeftWidthLayout = ECFullWidth;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return [self.menu count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    //各セクションの数から取得(sectionのナンバーが0==1,1==2であることに注意)
    if (section == 0){
        
        return [self.section1 count];
        
    } else if(section == 1){
        
        return [self.section2 count];
    }
}




//sectionの題名を決める
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0){
        
        return @"My Profile";
        
    }else if(section==1){
        
        return @"Other Stuff";
        
    }
}



//TableViewで表示させるメニューの項目
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    //セルがなければセルを作成
    if(cell==nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    
    if (indexPath.section==0){
        cell.textLabel.text = [NSString stringWithFormat:@"%@",[self.section1 objectAtIndex:indexPath.row]];
    }else if(indexPath.section==1){
        cell.textLabel.text = [NSString stringWithFormat:@"%@",[self.section2 objectAtIndex:indexPath.row]];
    }

    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

//セルのデリゲートメソッド(Viewの移動)
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    UIViewController *newTopViewController;
    
    
    if (indexPath.section==0){
        NSString *identifier = [NSString stringWithFormat:@"%@",[self.section1 objectAtIndex:indexPath.row]];
        newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
    }else if(indexPath.section==1){
        NSString *identifier = [NSString stringWithFormat:@"%@",[self.section2 objectAtIndex:indexPath.row]];
        newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
    }

        
    
    //スライドしたときのアニメーションの設定
    [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^{
        CGRect frame = self.slidingViewController.topViewController.view.frame;
        self.slidingViewController.topViewController = newTopViewController;
        self.slidingViewController.topViewController.view.frame = frame;
        [self.slidingViewController resetTopView];
    }];
}

@end
