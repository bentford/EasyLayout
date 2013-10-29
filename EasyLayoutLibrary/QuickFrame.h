//
//  QuickFrame.h
//  
//
//  Created by Ben Ford on 2/13/13.
//  Copyright (c) 2013 Ben Ford
//

#import <Foundation/Foundation.h>

@interface QuickBase : NSObject
@property (nonatomic, readonly) UIView *view;
- (id)initWithView:(UIView *)view;
@end

@interface QuickOrigin : QuickBase
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@end

@interface QuickSize : QuickBase
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@end

@interface QuickFrame : QuickBase
@property (nonatomic, readonly) QuickOrigin *origin;
@property (nonatomic, readonly) QuickSize *size;
@end
