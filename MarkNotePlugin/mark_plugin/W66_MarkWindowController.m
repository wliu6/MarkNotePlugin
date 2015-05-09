//
//  W66_MarkWindowController.m
//  MarkNotePlugin
//
//  Created by 66 on 15/5/8.
//  Copyright (c) 2015年 w66. All rights reserved.
//

#import "W66_MarkWindowController.h"
#import "W66_ShouldResponseReturnkeyTextView.h"
@interface W66_MarkWindowController () <W66_ShouldResponseReturnkeyTextViewDelegagte>
@property (weak) IBOutlet W66_ShouldResponseReturnkeyTextView *markContentTextView;

@end

@implementation W66_MarkWindowController

- (instancetype)initWithWindowNibName:(NSString *)windowNibName
{
    self = [super initWithWindowNibName:windowNibName];
    if (self) {
        if (self.markContentTextView) {
            self.markContentTextView.returnDelegate = self;
        }
    }
    return self;
}
- (void)windowDidLoad {
    [super windowDidLoad];

    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}
- (void)returnXcodeWindow
{
    
}
@end
