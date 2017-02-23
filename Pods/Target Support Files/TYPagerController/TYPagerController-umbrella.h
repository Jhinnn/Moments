#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "TYPagerController.h"
#import "TYTabButtonPagerController.h"
#import "TYTabPagerController.h"
#import "TYTabTitleCellProtocol.h"
#import "TYTabTitleViewCell.h"

FOUNDATION_EXPORT double TYPagerControllerVersionNumber;
FOUNDATION_EXPORT const unsigned char TYPagerControllerVersionString[];

