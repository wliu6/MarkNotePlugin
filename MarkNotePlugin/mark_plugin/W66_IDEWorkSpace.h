//
//  W66_IDEWorkSpace.h
//  MarkNotePlugin
//
//  Created by 66 on 15/5/3.
//  Copyright (c) 2015年 w66. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>


@interface IDEEditorContext : NSObject
- (id)editor;
@end

@interface IDEEditorArea : NSObject
- (IDEEditorContext*)lastActiveEditorContext;
@end

@interface IDEWorkspaceWindowController : NSObject
- (IDEEditorArea*)editorArea;
@end


@interface W66_IDEWorkSpace : NSObject

@property (retain) NSTextView* textView;

@end
