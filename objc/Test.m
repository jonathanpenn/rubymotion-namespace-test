#import <Foundation/Foundation.h>

@interface SomeClass : NSObject
@end
@implementation SomeClass
+ (void)callMe
{
  NSLog(@"sent message to %@", NSStringFromClass(self));
}
@end

@interface TestOutput : NSObject
@end

@implementation TestOutput
+ (void)whatDoesItLookLikeFromObjectiveC
{
  NSLog(@"Accessing classes and calling them from Objective C");
  Class cls = nil;

  NSLog(@"Getting class from string SomeClass");
  cls = NSClassFromString(@"SomeClass");
  [cls callMe];

  NSLog(@"Getting class from string RBSomeClass");
  cls = NSClassFromString(@"RBSomeClass");
  [cls callMe];

  NSLog(@"Getting class from string RBSomeClass2");
  cls = NSClassFromString(@"RBSomeClass2");
  [cls callMe];
}
@end

