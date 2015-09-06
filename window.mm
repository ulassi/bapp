

#import <Cocoa/Cocoa.h>
#include <OpenGL/gl.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
    NSOpenGLContext *openGLContext;
}

@property (assign) NSWindow *window;
@property (assign) NSOpenGLContext *openGLContext;

- (void)draw;

@end
@implementation AppDelegate

@synthesize window;
@synthesize openGLContext;

static NSOpenGLPixelFormatAttribute glAttributes[] = {
    NSOpenGLPFADoubleBuffer,
    0
};

- (void)draw 
{
    NSLog(@"Drawing...");

    [self.openGLContext makeCurrentContext];

    glClearColor(1, 0, 1, 1);
    glClear(GL_COLOR_BUFFER_BIT);

    [self.openGLContext flushBuffer];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSRect frame = NSMakeRect(0, 0, 200, 200);

    self.window = [[[NSWindow alloc]
        initWithContentRect:frame
        styleMask:NSBorderlessWindowMask
        backing:NSBackingStoreBuffered //NSOpenGLPFADoubleBuffer
        defer:NO] autorelease];
    [self.window makeKeyAndOrderFront:nil];

    NSOpenGLPixelFormat *pixelFormat
        = [[NSOpenGLPixelFormat alloc] initWithAttributes:glAttributes];
    self.openGLContext = [[NSOpenGLContext alloc]
        initWithFormat:pixelFormat shareContext:nil];
    [self.openGLContext setView:[self.window contentView]];

    [NSTimer
        scheduledTimerWithTimeInterval:.1
        target:self
        selector:@selector(draw)
        userInfo:nil
        repeats:YES];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)_app {
    return YES;
}

@end

// BEGIN C++ code

#include <debug.h>

extern int mainthread(int argc, char** argv);

int main(int argc, char** argv) 
{
    
    NSApplication *application = [NSApplication sharedApplication];
    //NSArray *tl;
    //[[NSBundle mainBundle] loadNibNamed:@"MainMenu" owner:application topLevelObjects:&tl];
    
    mainthread(argc, argv);
    
    AppDelegate *applicationDelegate = [[AppDelegate alloc] init];      // Instantiate App  delegate
    [application setDelegate:applicationDelegate];                      // Assign delegate to the NSApplication
    [application run];                                                  // Call the Apps Run method

    return 0;       // App Never gets here.
    //AppDelegate *appDelegate = [[AppDelegate alloc] init];
    
    //return NSApplicationMain(argc, (const char **) argv);
}