//
//  W66_MarkNoteManager.m
//  MarkNotePlugin
//
//  Created by 66 on 15/5/3.
//  Copyright (c) 2015年 w66. All rights reserved.
//  

#import "W66_MarkNoteManager.h"
#import "W66_IDEWorkSpace.h"

const NSString * markSubfix = @" ";

@implementation W66_MarkNoteManager

+ (void)pluginDidLoad:(NSBundle *)plugin {
  [self notePluginShared];
}

+ (instancetype)notePluginShared {
  static dispatch_once_t once;
  static id instance = nil;
  dispatch_once(&once, ^{
    instance = [[self alloc] init];
  });
  return instance;
}

- (instancetype)init {
  if (self = [super init]) {
    [[NSNotificationCenter defaultCenter]
        addObserver:self
           selector:@selector(applicationDidFinishLaunching:)
               name:NSApplicationDidFinishLaunchingNotification
             object:nil];
  }
  return self;
}

- (void)applicationDidFinishLaunching:(NSNotification *)noti {
  [self addMainMenu];
}

- (void)addMainMenu {
  NSMenuItem *editMenuItem = [[NSApp mainMenu] itemWithTitle:@"Edit"];
  if (editMenuItem) {
    [[editMenuItem submenu] addItem:[NSMenuItem separatorItem]];

    NSMenu *subMenu = [[NSMenu alloc] init];

    // main
    NSMenuItem *W66note_mainMenuItem = [[NSMenuItem alloc] init];
    W66note_mainMenuItem.title = @"W66_note";
    [W66note_mainMenuItem setSubmenu:subMenu];
    [W66note_mainMenuItem setTarget:self];
    [[editMenuItem submenu] addItem:W66note_mainMenuItem];

    // MARK note item
    NSMenuItem *markMenuItem =
        [[NSMenuItem alloc] initWithTitle:@"Mark"
                                   action:@selector(insertMark)
                            keyEquivalent:@"m"];
    [markMenuItem
        setKeyEquivalentModifierMask:NSControlKeyMask | NSShiftKeyMask];
    [markMenuItem setTarget:self];
    [[W66note_mainMenuItem submenu] addItem:markMenuItem];

    // Separator note item
    NSMenuItem *separatorMenuItem =
        [[NSMenuItem alloc] initWithTitle:@"#pragma mark - "
                                   action:@selector(insertSeparator)
                            keyEquivalent:@"-"];
    [separatorMenuItem setKeyEquivalentModifierMask:NSControlKeyMask];
    [separatorMenuItem setTarget:self];
    [[W66note_mainMenuItem submenu] addItem:separatorMenuItem];

    // method note
    NSMenuItem *methodMenuItem =
        [[NSMenuItem alloc] initWithTitle:@"#pragma mark -- "
                                   action:@selector(insertMethod)
                            keyEquivalent:@"-"];
    [methodMenuItem
        setKeyEquivalentModifierMask:NSControlKeyMask | NSShiftKeyMask];
    [methodMenuItem setTarget:self];
    [[W66note_mainMenuItem submenu] addItem:methodMenuItem];
      
    // star separateness note
    NSMenuItem *starMenuItem =
    [[NSMenuItem alloc] initWithTitle:@"starSeparateness"
                                 action:@selector(insertStarSeparateness)
                          keyEquivalent:@"*"];
    [starMenuItem
       setKeyEquivalentModifierMask:NSControlKeyMask];
    [starMenuItem setTarget:self];
    [[W66note_mainMenuItem submenu] addItem:starMenuItem];
      
    // star mark
    NSMenuItem *starMarkMenuItem =
      [[NSMenuItem alloc] initWithTitle:@"starMark"
                                 action:@selector(insertStarMark)
                          keyEquivalent:@"8"];
    [starMarkMenuItem
       setKeyEquivalentModifierMask:NSControlKeyMask];
    [starMarkMenuItem setTarget:self];
    [[W66note_mainMenuItem submenu] addItem:starMarkMenuItem];
  }
}

- (void)insertMark {
  NSString *cmt = [NSString stringWithFormat:@"//%@:", @" MARK"];
  [self insertComment:cmt markerMoveNumeber:0];
}

- (void)insertSeparator {
  NSString *cmt = @"#pragma mark - ";
  [self insertComment:cmt markerMoveNumeber:0];
}

- (void)insertMethod {
  NSString *cmt = @"#pragma mark -- ";
  [self insertComment:cmt markerMoveNumeber:0];
}

- (void)insertStarSeparateness{
    NSString *cmt = @"/******************************    ******************************/";
    [self insertComment:cmt markerMoveNumeber: cmt.length / 2 + markSubfix.length];
}

- (void)insertStarMark
{
    NSString *cmt = @"/**/";
    [self insertComment:cmt markerMoveNumeber:cmt.length / 2 + markSubfix.length];
}
- (void)insertComment:(NSString *)cmt markerMoveNumeber:(NSInteger)markerMN{
  
    NSTextView *codeEditTextView = [self codeEditorTextView];
  if (codeEditTextView) {
          [codeEditTextView insertText:cmt];
          [codeEditTextView insertText:markSubfix];
      if (markerMN) {
          NSRange currentRange = codeEditTextView.rangeForUserTextChange;
          NSRange targetRange = NSMakeRange(currentRange.location - markerMN, currentRange.length);
          [codeEditTextView setSelectedRange:targetRange];
      }
  }
}
- (NSTextView *)codeEditorTextView
{
    NSWindowController *currentWindowController =
    [[NSApp mainWindow] windowController];
    NSTextView *codeEditTextView = [[NSTextView alloc] init];
    if ([currentWindowController
         isKindOfClass:NSClassFromString(@"IDEWorkspaceWindowController")]) {
        IDEWorkspaceWindowController *workspaceController =
        (IDEWorkspaceWindowController *)currentWindowController;
        IDEEditorArea *editorArea = [workspaceController editorArea];
        IDEEditorContext *editorContext = [editorArea lastActiveEditorContext];
        W66_IDEWorkSpace *IDEWorkSpace = [editorContext editor];
        codeEditTextView = IDEWorkSpace.textView;
        return codeEditTextView;
    } else {
        return nil;
    }
    return nil;
}

@end
