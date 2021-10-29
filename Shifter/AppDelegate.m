//
//  AppDelegate.m
//  Shifter
//
//  Created by jingshuiqiao on 2020/3/22.
//  Copyright © 2020 jingshuiqiao. All rights reserved.
//

#import "AppDelegate.h"
#import <Carbon/Carbon.h>
#import <Foundation/Foundation.h>

@interface AppDelegate ()
@property (weak) IBOutlet NSMenu *statusMenu;
@property(nonatomic,strong)NSStatusItem *statusItem;
@property(nonatomic,strong)NSTask *task;

@end

@implementation AppDelegate




- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSLog(@"applicationDidFinishLaunching,%d",self.statusMenu != nil);
    [NSApp activateIgnoringOtherApps:true];
    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    self.statusItem.button.title = @"Liyongfu";
    [self.statusItem.button setImage:[NSImage imageNamed:@"statusIcon"]];
    self.statusItem.menu = self.statusMenu;
    
    [AppDelegate addGlobalHotKey:kVK_ANSI_1];
    [AppDelegate addGlobalHotKey:kVK_ANSI_2];
    [AppDelegate addGlobalHotKey:kVK_ANSI_3];
    [AppDelegate addGlobalHotKey:kVK_ANSI_4];
    [AppDelegate addGlobalHotKey:kVK_ANSI_5];
    [AppDelegate addGlobalHotKey:kVK_ANSI_6];
    [AppDelegate addGlobalHotKey:kVK_ANSI_7];
    [AppDelegate addGlobalHotKey:kVK_ANSI_8];
    [AppDelegate addGlobalHotKey:kVK_ANSI_9];
    [AppDelegate addGlobalHotKey:kVK_ANSI_0];//图片查看
    [AppDelegate addGlobalHotKey:kVK_ANSI_A];
    [AppDelegate addGlobalHotKey:kVK_ANSI_S];
    [AppDelegate addGlobalHotKey:kVK_ANSI_F];
    [AppDelegate addGlobalHotKey:kVK_ANSI_D];
    [AppDelegate addGlobalHotKey:kVK_ANSI_Q];
    [AppDelegate addGlobalHotKey:kVK_ANSI_W];
    [AppDelegate addGlobalHotKey:kVK_ANSI_P];
    [AppDelegate addGlobalHotKey:kVK_ANSI_N];
    [AppDelegate addGlobalHotKey:kVK_ANSI_E];
}

+(void)addGlobalHotKey:(UInt32)keyCode{
    EventHotKeyRef       gMyHotKeyRef;
    EventHotKeyID        gMyHotKeyID;
    EventTypeSpec        eventType;
    eventType.eventClass = kEventClassKeyboard;
    eventType.eventKind = kEventHotKeyPressed;
    InstallApplicationEventHandler(&hotKeyHandler,1,&eventType,NULL,NULL);
    gMyHotKeyID.signature = 'abcd';
    gMyHotKeyID.id = keyCode;
//    RegisterEventHotKey(keyCode, 0, gMyHotKeyID,GetApplicationEventTarget(), 0, &gMyHotKeyRef);
    RegisterEventHotKey(keyCode, optionKey, gMyHotKeyID,GetApplicationEventTarget(), 0, &gMyHotKeyRef);
    
    NSLog(@"addGlobalHotKey %d",keyCode);
    
    
}

+(void)test:(int)keyCode{
    if(keyCode == kVK_ANSI_1){
//        NSTask *softTask = [[NSTask alloc]init];
//        [softTask setLaunchPath:@"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"];
//        [softTask launch];
        
        NSString *appPath = @"/System/Library/CoreServices/Finder.app";
        [[NSWorkspace sharedWorkspace]openFile:appPath];
    }else if(keyCode == kVK_ANSI_2){
        NSString *appPath = @"/Applications/Safari.app";
        [[NSWorkspace sharedWorkspace]openFile:appPath];
    }else if(keyCode == kVK_ANSI_3){
        NSString *appPath = @"/Applications/Google Chrome.app";
        [[NSWorkspace sharedWorkspace]openFile:appPath];
    }else if(keyCode == kVK_ANSI_4){
        NSString *appPath = @"/Applications/Visual Studio Code.app";
        [[NSWorkspace sharedWorkspace]openFile:appPath];
    }else if(keyCode == kVK_ANSI_5){
        NSString *appPath = @"/Applications/Xcode.app";
        [[NSWorkspace sharedWorkspace]openFile:appPath];
    }else if(keyCode == kVK_ANSI_6){
        NSString *appPath = @"/Applications/wechatwebdevtools.app";///Applications/Xcode.app/Contents/Developer/Applications/Simulator.app
        [[NSWorkspace sharedWorkspace]openFile:appPath];
    }else if(keyCode == kVK_ANSI_7 || keyCode == kVK_ANSI_D){
//        NSString *appPath = @"/Users/jinshuiqiao/Library/Android/sdk/emulator/qemu/darwin-x86_64/qemu-system-x86_64";
//         NSString *appPath2 = @"/Applications/Google Chrome.app";
//        NSLog(@"打开模拟器 %@",appPath);
//        [[NSWorkspace sharedWorkspace]openURL:[NSURL fileURLWithPath:appPath]];
//        NSTask *softTask = [[NSTask alloc] init];
//           [softTask setLaunchPath:appPath2];
//           [softTask launch];
//        NSArray *array = [NSRunningApplication runningApplicationsWithBundleIdentifier:bundleID];
        NSArray *array = [[NSWorkspace sharedWorkspace] runningApplications];
        for (int i=0; i<array.count; i++) {
            NSRunningApplication *runningApplication = (NSRunningApplication *)array[i];
            NSLog(@"程序-%@,%@,%@,%@",runningApplication.bundleIdentifier,runningApplication.bundleURL,runningApplication.executableURL,runningApplication.localizedName);
            if([runningApplication.localizedName hasPrefix:@"qemu-system"]){
                [runningApplication activateWithOptions:NSApplicationActivateIgnoringOtherApps];
                break;
            }
        }
        
//        [[NSRunningApplication runningApplicationWithProcessIdentifier:24251] activateWithOptions:NSApplicationActivateIgnoringOtherApps];
    
        
    }else if(keyCode == kVK_ANSI_8){
        NSString *appPath = @"/System/Applications/Utilities/Activity Monitor.app";
        [[NSWorkspace sharedWorkspace]openFile:appPath];
    }else if(keyCode == kVK_ANSI_9){
        NSLog(@"打开wecode");
//        NSString *appPath = @"/Users/jinshuiqiao/Applications/WeCodeIDE.app";
//        [[NSWorkspace sharedWorkspace]openFile:appPath];
        NSArray *array = [[NSWorkspace sharedWorkspace] runningApplications];
        for (int i=0; i<array.count; i++) {
            NSRunningApplication *runningApplication = (NSRunningApplication *)array[i];
            NSLog(@"程序-%@,%@,%@,%@",runningApplication.bundleIdentifier,runningApplication.bundleURL,runningApplication.executableURL,runningApplication.localizedName);
            if([runningApplication.localizedName isEqualToString:@"WeCode-IDE"]){
                [runningApplication activateWithOptions:NSApplicationActivateIgnoringOtherApps];
                break;
            }
        }
    }else if(keyCode == kVK_ANSI_0){
        NSString *appPath = @"/System/Applications/Preview.app";
        [[NSWorkspace sharedWorkspace]openFile:appPath];
    }else if(keyCode == kVK_ANSI_A){
        NSString *appPath = @"/Applications/Android Studio.app";
        [[NSWorkspace sharedWorkspace]openFile:appPath];
    }else if(keyCode == kVK_ANSI_Q){
        NSString *appPath = @"/Applications/QQ.app";
        [[NSWorkspace sharedWorkspace]openFile:appPath];
    }else if(keyCode == kVK_ANSI_W){
        NSString *appPath = @"/Applications/WeChat.app";
        [[NSWorkspace sharedWorkspace]openFile:appPath];
    }else if(keyCode == kVK_ANSI_P){
        NSString *appPath = @"/Applications/Postman.app";
        [[NSWorkspace sharedWorkspace]openFile:appPath];
    }else if(keyCode == kVK_ANSI_S){
        NSString *appPath = @"/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app";
        [[NSWorkspace sharedWorkspace]openFile:appPath];
    }else if(keyCode == kVK_ANSI_F){
        NSString *appPath = @"/Applications/IntelliJ IDEA.app";
        [[NSWorkspace sharedWorkspace]openFile:appPath];
    }else if(keyCode == kVK_ANSI_N){
        NSString *appPath = @"/System/Applications/Notes.app";
        [[NSWorkspace sharedWorkspace]openFile:appPath];
    }else if(keyCode == kVK_ANSI_E){
        NSString *appPath = @"/Applications/Numbers.app";
        [[NSWorkspace sharedWorkspace]openFile:appPath];
    }
    
}


OSStatus hotKeyHandler(EventHandlerCallRef nextHandler, EventRef anEvent, void *userData) {

    EventHotKeyID hotKeyRef;

    GetEventParameter(anEvent, kEventParamDirectObject, typeEventHotKeyID, NULL, sizeof(hotKeyRef), NULL, &hotKeyRef);

    unsigned int hotKeyId = hotKeyRef.id;
    NSLog(@"hotKeyHandler---%d",hotKeyId);
    [AppDelegate test:hotKeyId];
    return noErr;
}



- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)quiteClicked:(id)sender {
    [[NSApplication sharedApplication] terminate:self];
}

@end
