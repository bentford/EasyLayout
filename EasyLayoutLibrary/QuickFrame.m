//
//  QuickFrame.h
//  
//
//  Created by Ben Ford on 2/13/13.
//  Copyright (c) 2013 Ben Ford
//

#import "QuickFrame.h"

@implementation QuickBase
- (id)initWithView:(UIView *)view
{
    if ((self = [super init])) {
        _view = view;
    }
    return self;
}
@end

@implementation QuickOrigin
- (void)setX:(CGFloat)x
{
    self.view.frame = CGRectMake(x, self.view.frame.origin.y, self.view.frame.size.width,self.view.frame.size.height);
}

- (void)setY:(CGFloat)y
{
    self.view.frame = CGRectMake(self.view.frame.origin.x, y, self.view.frame.size.width,self.view.frame.size.height);
}
@end

@implementation QuickSize
- (void)setWidth:(CGFloat)width
{
    self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, width, self.view.frame.size.height);
}

- (void)setHeight:(CGFloat)height
{
    self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, height);
}
@end

@implementation QuickFrame
- (id)initWithView:(UIView *)view
{
    if ((self = [super initWithView:view])) {
        _origin = [[QuickOrigin alloc] initWithView:view];
        _size = [[QuickSize alloc] initWithView:view];
    }
    return self;
}
@end
