//
//  DynamicSandwichViewController.m
//  SandwichFlow
//
//  Created by Andrii Kovalchuk on 04/11/15.
//  Copyright © 2015 Colin Eberhardt. All rights reserved.
//

#import "DynamicSandwichViewController.h"
#import "AppDelegate.h"
#import "SandwichViewController.h"

@interface DynamicSandwichViewController ()

@end

@implementation DynamicSandwichViewController

NSMutableArray *_views; //information about view

- (NSArray *)sandwiches {
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    return appDelegate.sandwiches;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Background-LowerLayer.png"]];
    [self.view addSubview:backgroundImageView];

    UIImageView *header = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Sarnie.png"]];

    header.center = CGPointMake(220, 190);
    [self.view addSubview:header];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)addRecipeAtOffset:(CGFloat)offset
                  forSandwich:(NSDictionary *)sandwich {

    CGRect frameForView = CGRectOffset(self.view.bounds,
            0.0, self.view.bounds.size.height - offset);

    UIStoryboard *myStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SandwichViewController *viewController = [myStoryboard instantiateViewControllerWithIdentifier:@"SandwichVC"];


    UIView *view = viewController.view;
    view.frame = frameForView;
    viewController.sandwich = sandwich;

    [self addChildViewController:viewController];
    [self.view addSubview:viewController.view];
    [viewController didMoveToParentViewController:self];

    return view;
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
