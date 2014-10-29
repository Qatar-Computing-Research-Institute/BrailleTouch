//
//  Action.m
//  BrailleTouch
//
//  Created by Yasser Idwan on 10/27/14.
//  Copyright (c) 2014 Yasser Idwan. All rights reserved.
//

#import "Action.h"

@implementation Action

@synthesize firstTouchLocation = _firstTouchLocation;
//@synthesize firstTouchEndLocation = _firstTouchEndLocation;
@synthesize secondTouchLocation = _secondTouchLocation;
//@synthesize secondTouchEndLocation = _secondTouchEndLocation;
@synthesize thirdTouchLocation = _thirdTouchLocation;
//@synthesize thirdTouchEndLocation = _thirdTouchEndLocation;
@synthesize actionTime = _actionTime;
//@synthesize endTime = _endTime;
@synthesize action = _action;

-(NSString*)getStringRepresentation
{
    NSString * actionString = @"";
    switch (_action) {
        case OneFingerTap:
            actionString = @"OneFingerTap";
            break;
            
        case TwoFingerTap:
            actionString = @"TwoFingerTap";
            break;
            
        case ThreeFingerTap:
            actionString = @"ThreeFingerTap";
            break;
            
        case UpSwipe:
            actionString = @"UpSwipe";
            break;
            
        case DownSwipe:
            actionString = @"DownSwipe";
            break;
            
        case LeftSwipe:
            actionString = @"LeftSwipe";
            break;
            
        case RightSwipe:
            actionString = @"RightSwipe";
            break;
            
        default:
            break;
    }
    
    NSMutableString * result = [NSMutableString stringWithFormat:@"{action:%@ , ", actionString];
    [result appendFormat:@"firstTouchLocation: [%f , %f] , ", _firstTouchLocation.x , _firstTouchLocation.y];
    
    if ( _action == TwoFingerTap || _action == ThreeFingerTap )
    {
        [result appendFormat:@"secondTouchStartLocation: [%f , %f] , ", _secondTouchLocation.x , _secondTouchLocation.y];
    }
    
    if ( _action == ThreeFingerTap )
    {
        [result appendFormat:@"thirdTouchStartLocation: [%f , %f] , ", _thirdTouchLocation.x , _thirdTouchLocation.y];
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    
    [result appendFormat:@"startTime: \"%@\" , ", [formatter stringFromDate:_actionTime]];
    [result appendFormat:@"timestamp: \"%lf\"}", [_actionTime timeIntervalSinceReferenceDate]];
    
    return result;
}

@end
