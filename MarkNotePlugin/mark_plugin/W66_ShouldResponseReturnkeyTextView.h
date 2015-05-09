//
//  W66_ShouldResponseReturnkeyTextView.h
//  MarkNotePlugin
//
//  Created by 66 on 15/5/9.
//  Copyright (c) 2015年 w66. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol W66_ShouldResponseReturnkeyTextViewDelegagte <NSObject>

@required
- (void)returnXcodeWindow;

@end
@interface W66_ShouldResponseReturnkeyTextView : NSTextField
@property(nonatomic,assign) id<W66_ShouldResponseReturnkeyTextViewDelegagte> returnDelegate;
@end
