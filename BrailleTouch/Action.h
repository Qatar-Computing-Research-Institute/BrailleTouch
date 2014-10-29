//
//  Action.h
//  BrailleTouch
//
//  Created by Yasser Idwan on 10/27/14.
//  Copyright (c) 2014 Yasser Idwan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef enum {
    OneFingerTap = 0,
    TwoFingerTap = 1,
    ThreeFingerTap = 2,
    UpSwipe = 3,
    DownSwipe = 4,
    LeftSwipe = 5,
    RightSwipe = 6
} BrailleAction;

@interface Action : NSObject
{
    BrailleAction _action;
    
    CGPoint _firstTouchLocation;
//    CGPoint _firstTouchEndLocation;
    
    CGPoint _secondTouchLocation;
//    CGPoint _secondTouchEndLocation;
    
    CGPoint _thirdTouchLocation;
//    CGPoint _thirdTouchEndLocation;
}

@property(nonatomic, assign, readwrite) BrailleAction action;
@property(nonatomic , assign , readwrite) CGPoint firstTouchLocation;
//@property(nonatomic , assign , readwrite) CGPoint firstTouchEndLocation;
@property(nonatomic , assign , readwrite) CGPoint secondTouchLocation;
//@property(nonatomic , assign , readwrite) CGPoint secondTouchEndLocation;
@property(nonatomic , assign , readwrite) CGPoint thirdTouchLocation;
//@property(nonatomic , assign , readwrite) CGPoint thirdTouchEndLocation;
@property(nonatomic , retain , readwrite) NSDate * actionTime;
//@property(nonatomic , retain , readwrite) NSDate * endTime;

-(NSString*)getStringRepresentation;

@end
