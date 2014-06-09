//
//  ViewController.m
//  ScreenRotateSample
//
//  Created by Patrick on 14-6-9.
//  Copyright (c) 2014年 Patrick. All rights reserved.
//

#import "ViewController.h"
#import "LandscapeViewController.h"

// 定义了一个宏，圆周率/180.0，用来
#define deg2rad (M_PI/180.0)


@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    LandscapeViewController *landscapeViewController = [[UIStoryboard
                                                         storyboardWithName:@"LandscapeStoryboard" bundle:NULL]
                                                        
                                                        instantiateViewControllerWithIdentifier:@"LandscapeViewController"];
    
    self.mainLandscapeView = landscapeViewController.view;
    self.mainPortraitView = self.view;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

// 指定当前视图是否支持旋转
- (BOOL)shouldAutorotate
{
    return YES;
}

// 指定视图支持哪个方向的旋转
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)
toInterfaceOrientation duration:(NSTimeInterval)duration
{
    
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        self.view=self.mainLandscapeView;
        self.view.transform=CGAffineTransformMakeRotation(deg2rad*(90));
        self.view.bounds=CGRectMake(0.0, 0.0, 480.0, 300.0);
    } else if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        self.view=self.mainLandscapeView;
        self.view.transform=CGAffineTransformMakeRotation(deg2rad*(-90));
        self.view.bounds=CGRectMake(0.0, 0.0, 480.0, 300.0);
    } else {
        self.view=self.mainPortraitView;
        self.view.transform=CGAffineTransformMakeRotation(deg2rad*(0));
        self.view.bounds=CGRectMake(0.0, 0.0, 320.0, 460.0);
    }
    
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
}


@end
