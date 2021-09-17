#import "KasaxPlugin.h"
#if __has_include(<kasax/kasax-Swift.h>)
#import <kasax/kasax-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "kasax-Swift.h"
#endif

@implementation KasaxPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftKasaxPlugin registerWithRegistrar:registrar];
}
@end
