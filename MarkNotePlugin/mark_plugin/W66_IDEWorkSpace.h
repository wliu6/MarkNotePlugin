//
//  W66_IDEWorkSpace.h
//  MarkNotePlugin
//
//  Created by 66 on 15/5/3.
//  Copyright (c) 2015年 w66. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

/*!
 *  @brief  private API
 */
@interface IDEEditorContext : NSObject
- (id)editor; // returns the current editor. If the editor is the code editor, the class is `IDESourceCodeEditor`
@end

@interface IDEEditorArea : NSObject
- (IDEEditorContext*)lastActiveEditorContext;// return current code editor detail context
@end

@interface IDEWorkspaceWindowController : NSObject
- (IDEEditorArea*)editorArea;// return the current code editor
@end


/*!
 *  @author 66, 15-05-03 18:05
 */
@interface W66_IDEWorkSpace : NSObject
@property (retain) NSTextView* textView;
@end
