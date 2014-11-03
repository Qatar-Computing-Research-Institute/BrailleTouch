//
//  ViewController.m
//  BrailleTouch
//
//  Created by Yasser Idwan on 10/27/14.
//  Copyright (c) 2014 Yasser Idwan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize actionsStore = _actionsStore;
@synthesize userId = _userId;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _actionsStore = [[NSMutableArray alloc] initWithCapacity:10];
    NSObject * userIdObj = [[NSUserDefaults standardUserDefaults] objectForKey:@"userId"];
    if ( userIdObj )
        _userId = [(NSNumber*)userIdObj integerValue];
    else
        _userId = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touch began");
    NSArray * allTouches = [touches allObjects];
    UITouch * touch = [allTouches objectAtIndex:0];
    _firstTouchStartPosition = [touch locationInView:self.view];
    _firstTouchStartTime = [NSDate date];
    
    self.view.layer.backgroundColor = [UIColor grayColor].CGColor;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touch ended");
//    UITouch * touch = [touches anyObject];
    if ( !_currentlyAnimating )
        self.view.layer.backgroundColor = [UIColor whiteColor].CGColor;
}

-(IBAction)oneFingerTapRecognizerHandler:(id)sender
{
    NSLog(@"one Finger touch");
    
    UITapGestureRecognizer * gr = (UITapGestureRecognizer*)sender;
    Action * action;
    
    switch (gr.state) {
        case UIGestureRecognizerStateBegan:
            
            break;
            
        case UIGestureRecognizerStateEnded:
            action = [[Action alloc] init];
            action.action = OneFingerTap;
            action.firstTouchLocation = [gr locationInView:self.view];
            action.actionTime = [NSDate date];
            
            [_actionsStore addObject:action];
            break;
        default:
            break;
    }
}

-(IBAction)twoFingerTapRecognizerHandler:(id)sender
{
    NSLog(@"two Finger touch");
    
    UITapGestureRecognizer * gr = (UITapGestureRecognizer*)sender;
    Action * action;
    
    switch (gr.state) {
        case UIGestureRecognizerStateBegan:
            
            break;
            
        case UIGestureRecognizerStateEnded:
            action = [[Action alloc] init];
            action.action = TwoFingerTap;
            action.firstTouchLocation = [gr locationOfTouch:0 inView:self.view];
            action.secondTouchLocation = [gr locationOfTouch:1 inView:self.view];
            action.actionTime = [NSDate date];
            
            [_actionsStore addObject:action];
            break;
        default:
            break;
    }
}

-(IBAction)threeFingerRecognizerHandler:(id)sender
{
    NSLog(@"three Finger touch");
    
    UITapGestureRecognizer * gr = (UITapGestureRecognizer*)sender;
    Action * action;
    
    switch (gr.state) {
        case UIGestureRecognizerStateBegan:
            
            break;
            
        case UIGestureRecognizerStateEnded:
            action = [[Action alloc] init];
            action.action = ThreeFingerTap;
            action.firstTouchLocation = [gr locationOfTouch:0 inView:self.view];
            action.secondTouchLocation = [gr locationOfTouch:1 inView:self.view];
            action.thirdTouchLocation = [gr locationOfTouch:2 inView:self.view];
            action.actionTime = [NSDate date];
            
            [_actionsStore addObject:action];
            break;
        default:
            break;
    }
}

-(IBAction)leftSwipeRecognizerHandler:(id)sender
{
    NSLog(@"left swipe");
    
    UISwipeGestureRecognizer * gr = (UISwipeGestureRecognizer*)sender;
    Action * action;
    
    switch (gr.state) {
        case UIGestureRecognizerStateBegan:
            break;
            
        case UIGestureRecognizerStateEnded:
            action = [[Action alloc] init];
            action.action = LeftSwipe;
            action.firstTouchLocation = _firstTouchStartPosition;
            action.actionTime = _firstTouchStartTime;
            
            [_actionsStore addObject:action];
            break;
            
        default:
            break;
    }
}

-(IBAction)rightSwipeRecognizerHandler:(id)sender
{
    NSLog(@"right swipe");
    
    UISwipeGestureRecognizer * gr = (UISwipeGestureRecognizer*)sender;
    Action * action;
    
    switch (gr.state) {
        case UIGestureRecognizerStateBegan:
            break;
            
        case UIGestureRecognizerStateEnded:
            action = [[Action alloc] init];
            action.action = RightSwipe;
            action.firstTouchLocation = _firstTouchStartPosition;
            action.actionTime = _firstTouchStartTime;
            
            [_actionsStore addObject:action];
            break;
            
        default:
            break;
    }
}

-(IBAction)upSwipeRecognizerHandler:(id)sender
{
    NSLog(@"up swipe");
    
    UISwipeGestureRecognizer * gr = (UISwipeGestureRecognizer*)sender;
    Action * action;
    
    switch (gr.state) {
        case UIGestureRecognizerStateBegan:
            break;
            
        case UIGestureRecognizerStateEnded:
            action = [[Action alloc] init];
            action.action = UpSwipe;
            action.firstTouchLocation = _firstTouchStartPosition;
            action.actionTime = _firstTouchStartTime;
            
            [_actionsStore addObject:action];
            break;
            
        default:
            break;
    }
}

-(IBAction)downSwipeRecognizerHandler:(id)sender
{
    NSLog(@"down swipe");
    
    UISwipeGestureRecognizer * gr = (UISwipeGestureRecognizer*)sender;
    Action * action;
    
    switch (gr.state) {
        case UIGestureRecognizerStateBegan:
            break;
            
        case UIGestureRecognizerStateEnded:
            action = [[Action alloc] init];
            action.action = DownSwipe;
            action.firstTouchLocation = _firstTouchStartPosition;
            action.actionTime = _firstTouchStartTime;
            
            [_actionsStore addObject:action];
            break;
            
        default:
            break;
    }
}

-(IBAction)rotateGestureHandler:(id)sender
{
    UIRotationGestureRecognizer * gr = (UIRotationGestureRecognizer*)sender;
    
    if ( gr.state == UIGestureRecognizerStateBegan)
    {
        if ( gr.rotation < 0 )
        {
            [self resetDataStore];
            _rotationsCount = 0;
        }
        else
        {
            _rotationsCount++;
            
            if ( _rotationsCount == 2 )
            {
                _currentlyAnimating = YES;
                [UIView animateWithDuration:1.0 animations:^{
                    self.view.layer.backgroundColor = [UIColor redColor].CGColor;
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:1.0 animations:^{
                        self.view.layer.backgroundColor = [UIColor whiteColor].CGColor;
                        _currentlyAnimating = NO;
                    } completion:nil];
                }];
                
                [_actionsStore removeAllObjects];
                _rotationsCount = 0;
            }
        }
    }
    
}

-(void)resetDataStore
{
    if ( _actionsStore.count > 0 )
    {
        [self saveDataStore];
        
        [_actionsStore removeAllObjects];
        _userId++;
    }
}

-(void)saveDataStore
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"user-%ld.txt",(long)_userId]];
    
    NSMutableString * stringToStore = [[NSMutableString alloc] initWithString:@"{actions:["];
    
    for ( int i = 0 ; i < _actionsStore.count ; i++ )
    {
        Action * item = [_actionsStore objectAtIndex:i];
        NSString * itemString = [item getStringRepresentation];
        [stringToStore appendFormat:@"\n%@,", itemString];
    }
    
    stringToStore = [[stringToStore substringToIndex: stringToStore.length -1] mutableCopy];
    [stringToStore appendFormat:@"\n]}"];
    
    NSError *error;
    BOOL success = [stringToStore writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    UIColor *showColor;
    if ( success )
        showColor = [UIColor greenColor];
    else
        showColor = [UIColor whiteColor];
    
    _currentlyAnimating = YES;
    [UIView animateWithDuration:1.0 animations:^{
        self.view.layer.backgroundColor = showColor.CGColor;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            self.view.layer.backgroundColor = [UIColor whiteColor].CGColor;
            _currentlyAnimating = NO;
        } completion:nil];
    }];
}

@end
