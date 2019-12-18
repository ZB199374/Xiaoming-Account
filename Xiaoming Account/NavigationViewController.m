//
//  NavigationViewController.m
//  Xiaoming Notes
//
//  Created by ycx on 2019/10/28.
//  Copyright © 2019 ZB. All rights reserved.
//

#import "NavigationViewController.h"
#import "XMHeader.h"

@interface NavigationViewController ()

@end

@implementation NavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"HOME";
    self.navigationBar.barTintColor = UIColorFromRGB(0x282828);
//    [self.navigationBar setBackgroundImage:[UIImage new] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
 //   [self.navigationBar setShadowImage:[UIImage new]];

    //    [naviVC.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0x000000),NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue-Bold" size:24.0]}];
    //    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
//        NSDictionary * dict = [NSDictionary dictionaryWithObject:[UIColor blackColor] forKey:NSForegroundColorAttributeName];
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:UIColorFromRGB(0xFFFFFF),NSFontAttributeName:[UIFont fontWithName:@"Futura-Medium" size:18.0]};
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
