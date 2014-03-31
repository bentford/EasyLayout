//
//  QuickFrame.h
//  
//
//  Created by Ben Ford on 2/13/13.
//  Copyright (c) 2013 Ben Ford
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

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
