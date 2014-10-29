//
//  ViewController.h
//  BrailleTouch
//
//  Created by Yasser Idwan on 10/27/14.
//  Copyright (c) 2014 Yasser Idwan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Action.h"

@interface ViewController : UIViewController
{
    NSMutableArray * _actionsStore;
    NSInteger _userId;
    CGPoint _firstTouchStartPosition;
    NSDate * _firstTouchStartTime;
    
    int _rotationsCount;
    BOOL _currentlyAnimating;
}

@property (nonatomic, readonly) NSMutableArray * actionsStore;
@property (nonatomic , readonly) NSInteger userId;

-(IBAction)oneFingerTapRecognizerHandler:(id)sender;
-(IBAction)twoFingerTapRecognizerHandler:(id)sender;
-(IBAction)threeFingerRecognizerHandler:(id)sender;

-(IBAction)leftSwipeRecognizerHandler:(id)sender;
-(IBAction)rightSwipeRecognizerHandler:(id)sender;
-(IBAction)upSwipeRecognizerHandler:(id)sender;
-(IBAction)downSwipeRecognizerHandler:(id)sender;

-(IBAction)rotateGestureHandler:(id)sender;
-(void)resetDataStore;

@end

