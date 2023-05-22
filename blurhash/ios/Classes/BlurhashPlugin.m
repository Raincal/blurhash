#import "BlurhashPlugin.h"
#import <blurhash/blurhash-Swift.h>

@implementation BlurhashPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [BlurhashPlugin registerWithRegistrar:registrar];
}
@end
