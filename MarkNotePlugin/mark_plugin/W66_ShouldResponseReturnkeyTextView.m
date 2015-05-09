//
//  W66_ShouldResponseReturnkeyTextView.m
//  MarkNotePlugin
//
//  Created by 66 on 15/5/9.
//  Copyright (c) 2015年 w66. All rights reserved.
//

#import "W66_ShouldResponseReturnkeyTextView.h"

@implementation W66_ShouldResponseReturnkeyTextView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}
- (void)insertNewline:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(returnXcodeWindow)]) {
        [self.returnDelegate returnXcodeWindow];
    }
}
@end
