#import "NetworkError.h"

@implementation NetworkError

+ (void)displayError {
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"JDSports", @"")
                                                      message:NSLocalizedString(@"NetworkError", @"")
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    
    [message show];
}

@end
