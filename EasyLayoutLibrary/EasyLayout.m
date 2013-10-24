//
//  EasyLayout.h
//
//  Created by Ben Ford on 1/22/13.
//  Copyright (c) 2013 Ben Ford
//

#import "EasyLayout.h"
#import "NSString+Ext.h"

@implementation UIView(EasyLayoutMethods)

- (void)setExtOrigin:(CGPoint)extOrigin {
    self.frame = CGRectMake(extOrigin.x, extOrigin.y, self.frame.size.width, self.frame.size.height);
}

- (CGPoint)extOrigin {
    return self.frame.origin;
}

- (void)setExtSize:(CGSize)extSize {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, extSize.width, extSize.height);
}

- (CGSize)extSize {
    return self.bounds.size;
}

- (CGPoint)extTerminus {
    return CGPointMake(self.extOrigin.x+self.extSize.width, self.extOrigin.y+self.extSize.height);
}

- (CGPoint)extMedial
{
    return CGPointMake(self.extOrigin.x+floorf(self.extSize.width/2.0f), self.extOrigin.y+floorf(self.extSize.height/2.0f));
}

- (CGSize)extHalfSize
{
    return CGSizeMake(floorf(self.extSize.width/2.0f), floorf(self.extSize.height/2.0f));
}

- (QuickFrame *)extQuickFrame
{
    return [[QuickFrame alloc] initWithView:self];
}

- (void)extRemoveAllSubviews
{
    for (UIView *view in [self subviews])
        [view removeFromSuperview];
}


- (NSString *)extBoundsString
{
    return NSStringFromCGRect(self.frame);
}

- (NSString *)extFrameString
{
    return NSStringFromCGRect(self.bounds);
}

@end

@implementation EasyLayout
+ (void)bottomCenterView:(UIView *)targetView inParentView:(UIView *)parentView offset:(CGSize)offset
{
    targetView.extOrigin = CGPointMake(parentView.extHalfSize.width-targetView.extHalfSize.width+offset.width,
                                       parentView.extSize.height-targetView.extSize.height+offset.height);
}

+ (void)topCenterView:(UIView *)targetView inParentView:(UIView *)parentView offset:(CGSize)offset
{
    targetView.extOrigin = CGPointMake(parentView.extHalfSize.width-targetView.extHalfSize.width+offset.width,
                                       0.0f+offset.height);
}

+ (void)centerView:(UIView *)targetView inParentView:(UIView *)parentView offset:(CGSize)offset {
    targetView.extOrigin = CGPointMake(parentView.extHalfSize.width-targetView.extHalfSize.width+offset.width,
                                       parentView.extHalfSize.height-targetView.extHalfSize.height+offset.height);
}

+ (void)rightCenterView:(UIView *)targetView inParentView:(UIView *)parentView offset:(CGSize)offset {
    targetView.extOrigin = CGPointMake(parentView.bounds.size.width-targetView.bounds.size.width+offset.width,
                                       parentView.extHalfSize.height-targetView.extHalfSize.height+offset.height);
}

+ (void)bottomRightView:(UIView *)targetView inParentView:(UIView *)parentView offset:(CGSize)offset
{
    targetView.extOrigin = CGPointMake(parentView.bounds.size.width-targetView.bounds.size.width+offset.width,
                                       parentView.extSize.height-targetView.extSize.height+offset.height);
}

+ (void)bottomLeftView:(UIView *)targetView inParentView:(UIView *)parentView offset:(CGSize)offset
{
    targetView.extOrigin = CGPointMake(floorf(offset.width),
                                       floorf(parentView.extSize.height-targetView.extSize.height+offset.height));
}

+ (void)topRightView:(UIView *)targetView inParentView:(UIView *)parentView offset:(CGSize)offset
{
    targetView.extOrigin = CGPointMake(parentView.bounds.size.width-targetView.bounds.size.width+offset.width,
                                       0.0f+offset.height);
}

+ (void)leftCenterView:(UIView *)targetView inParentView:(UIView *)parentView offset:(CGSize)offset
{
    targetView.extOrigin = CGPointMake(0.0f+offset.width,
                                       parentView.extHalfSize.height-targetView.extHalfSize.height+offset.height);
}

+ (void)positionView:(UIView *)targetView toRightAndVerticalCenterOfView:(UIView *)siblingView offset:(CGSize)offset
{
    targetView.extOrigin = CGPointMake(siblingView.frame.origin.x+siblingView.frame.size.width+offset.width,
                                       siblingView.frame.origin.y+siblingView.extHalfSize.height-targetView.extHalfSize.height+offset.height);
    
}

+ (void)positionView:(UIView *)targetView toLeftOfView:(UIView *)siblingView offset:(CGSize)offset
{
    targetView.extOrigin = CGPointMake(siblingView.frame.origin.x-targetView.frame.size.width+offset.width,
                                       siblingView.frame.origin.y+offset.height);
    
}

+ (void)positionView:(UIView *)targetView toRightOfView:(UIView *)siblingView offset:(CGSize)offset
{
    targetView.extOrigin = CGPointMake(siblingView.frame.origin.x+siblingView.frame.size.width+offset.width,
                                       siblingView.frame.origin.y+offset.height);
    
}

+ (void)positionView:(UIView *)targetView atView:(UIView *)siblingView offset:(CGSize)offset
{
    targetView.extOrigin = siblingView.extOrigin;
}

+ (void)positionView:(UIView *)targetView belowView:(UIView *)siblingView offset:(CGSize)offset {
    targetView.extOrigin = CGPointMake(floorf(siblingView.frame.origin.x+offset.width),
                                       floorf(siblingView.frame.origin.y+siblingView.frame.size.height+offset.height));
}

+ (void)positionView:(UIView *)targetView belowViews:(NSArray *)siblingViews offset:(CGSize)offset
{
    UIView *lowestSibling = [EasyLayout lowestViewFromArray:siblingViews ignoreZeroHeight:YES];
    
    // ignore zero heights only if something was found
    if (lowestSibling == nil)
        lowestSibling = [EasyLayout lowestViewFromArray:siblingViews ignoreZeroHeight:NO];
    
    [EasyLayout positionView:targetView belowView:lowestSibling offset:offset];
}

+ (void)positionView:(UIView *)targetView belowView:(UIView *)siblingView horizontallyCenterWithView:(UIView *)centerWithView offset:(CGSize)offset {
    targetView.extOrigin = CGPointMake(centerWithView.extMedial.x-targetView.extHalfSize.width+offset.width,
                                       siblingView.extTerminus.y+offset.height);
}

+ (void)positionView:(UIView *)targetView belowView:(UIView *)siblingView horizontallyCenterInParent:(UIView *)centerInParent offset:(CGSize)offset {
    targetView.extOrigin = CGPointMake(centerInParent.extHalfSize.width-targetView.extHalfSize.width+offset.width,
                                       siblingView.extTerminus.y+offset.height);
}


+ (void)positionView:(UIView *)targetView aboveView:(UIView *)siblingView offset:(CGSize)offset
{
    targetView.extOrigin = CGPointMake(siblingView.extOrigin.x+offset.width,
                                       siblingView.extOrigin.y-targetView.extSize.height+offset.height);
}

+ (void)positionView:(UIView *)targetView aboveView:(UIView *)siblingView horizontallyCenterInParent:(UIView *)centerInParent offset:(CGSize)offset
{
    targetView.extOrigin = CGPointMake(centerInParent.extHalfSize.width-targetView.extHalfSize.width+offset.width,
                                       siblingView.extOrigin.y-targetView.extSize.height+offset.height);
}

+ (void)positionView:(UIView *)targetView aboveView:(UIView *)siblingView horizontallyCenterWithView:(UIView *)centerInView offset:(CGSize)offset
{
    targetView.extOrigin = CGPointMake(centerInView.extMedial.x-targetView.extHalfSize.width+offset.width,
                                       siblingView.extOrigin.y-targetView.extSize.height+offset.height);
}

+ (void)modifyHeight:(UIView *)targetView toBottomOfView:(UIView *)siblingView offset:(CGFloat)offset
{
    CGFloat heightDifference = siblingView.extTerminus.y-targetView.extTerminus.y;
    targetView.extSize = CGSizeMake(targetView.extSize.width, targetView.extSize.height+heightDifference+offset);
}

+ (void)modifyHeight:(UIView *)targetView toBottomOfParent:(UIView *)parentView offset:(CGFloat)offset
{
    CGFloat heightDifference = parentView.extSize.height - targetView.extTerminus.y;
    targetView.extSize = CGSizeMake(targetView.extSize.width, targetView.extSize.height+heightDifference+offset);
}

+ (void)modifyHeight:(UIView *)targetView toTopOfView:(UIView *)siblingView offset:(CGFloat)offset
{
    CGFloat heightDifference = siblingView.extOrigin.y-targetView.extTerminus.y;
    targetView.extSize = CGSizeMake(targetView.extSize.width, targetView.extSize.height+heightDifference+offset);
}

+ (void)modifyWidth:(UIView *)targetView toRightOfParent:(UIView *)parentView offset:(CGFloat)offset
{
    CGFloat heightDifference = parentView.extSize.width - targetView.extTerminus.x;
    targetView.extSize = CGSizeMake(targetView.extSize.width+heightDifference+offset, targetView.extSize.height);
}

+ (void)modifyWidth:(UIView *)targetView matchView:(UIView *)matchView offset:(CGFloat)offset
{
    targetView.extSize = CGSizeMake(matchView.extSize.width+offset, matchView.extSize.height+offset);
}

+ (void)positionView:(UIView *)targetView centerOfView:(UIView *)siblingView offset:(CGSize)offset
{
    targetView.extOrigin = CGPointMake(siblingView.extMedial.x-targetView.extHalfSize.width+offset.width,
                                       siblingView.extMedial.y-targetView.extHalfSize.height+offset.height);
}

+ (void)positionView:(UIView *)targetView verticalCenterOfView:(UIView *)siblingView offset:(CGSize)offset
{
    targetView.extOrigin = CGPointMake(targetView.extOrigin.x+offset.width,
                                       siblingView.frame.origin.y+siblingView.extHalfSize.height-targetView.extHalfSize.height+offset.height);
}

+ (void)positionView:(UIView *)targetView inbetweenHorizontallyFirstView:(UIView *)firstView secondView:(UIView *)secondView offset:(CGSize)offset
{
    CGFloat midXPosition;
    if (secondView.extTerminus.x > firstView.extTerminus.x)
        midXPosition = secondView.extTerminus.x - firstView.extTerminus.x;
    else
        midXPosition = firstView.extTerminus.x - secondView.extTerminus.x;
    
    targetView.extOrigin = CGPointMake(midXPosition, targetView.extOrigin.y);
}

+ (void)positionView:(UIView *)targetView inbetweenVerticallyFirstView:(UIView *)firstView secondView:(UIView *)secondView offset:(CGSize)offset
{
    CGFloat midYPosition;
    if (firstView.extTerminus.x > secondView.extTerminus.x)
        midYPosition = secondView.extTerminus.y - firstView.extTerminus.y;
    else
        midYPosition = firstView.extTerminus.y - secondView.extTerminus.y;
    
    targetView.extOrigin = CGPointMake(targetView.extOrigin.y, midYPosition);
}

+ (void)sizeButton:(UIButton *)button matchHeightOfView:(UIView *)view
{
    CGFloat heightDifference = floorf(button.imageView.image.size.height - view.extSize.height);
    button.extQuickFrame.size.height = view.extSize.height;
    [button setImageEdgeInsets:UIEdgeInsetsMake(heightDifference, 0.0f, 0.0f, 0.0f)];
}

+ (void)sizeView:(UIView *)targetView toParent:(UIView *)parentView edgeInsets:(UIEdgeInsets)edgeInsets
{
    CGRect zeroOriginFrame = CGRectMake(0.0f, 0.0f, parentView.extSize.width, parentView.extSize.height);
    targetView.frame = UIEdgeInsetsInsetRect(zeroOriginFrame, edgeInsets);
}

+ (void)sizeView:(UIView *)targetView toParent:(UIView *)parentView insetSize:(CGSize)insetSize
{
    CGRect zeroOriginFrame = CGRectMake(0.0f, 0.0f, parentView.extSize.width, parentView.extSize.height);
    targetView.frame = CGRectInset(zeroOriginFrame, insetSize.width, insetSize.height);
}

@end

@implementation EasyLayout(Inspection)

+ (UIView *)lowestViewFromArray:(NSArray *)arrayOfViews ignoreZeroHeight:(BOOL)ignoreZeroHeight
{
    UIView *lowestView;
    for (UIView *view in arrayOfViews) {
        
        if (ignoreZeroHeight && view.extSize.height == 0.0f)
            continue;
        
        if (lowestView == nil || view.extTerminus.y > lowestView.extTerminus.y)
            lowestView = view;
        
    }
    return lowestView;
}

@end

@implementation EasyLayout(Label)

+ (void)sizeLabel:(UILabel *)label mode:(ELLineMode)lineMode maxWidth:(CGFloat)maxWidth
{
    switch (lineMode) {
        case ELLineModeSingle:
            label.lineBreakMode = NSLineBreakByTruncatingTail;
            label.numberOfLines = 1;
            break;
        case ELLineModeMulti:
            label.lineBreakMode = NSLineBreakByWordWrapping;
            // zero indicates unlimited lines allowed
            label.numberOfLines = 0;
            break;
    }
    
    if (label.attributedText != nil)
        label.extSize = [EasyLayout sizeAttributedText:label.attributedText mode:lineMode maxWidth:maxWidth];
    else
        label.extSize = [EasyLayout sizeText:label.text font:label.font mode:lineMode maxWidth:maxWidth];
}

+ (CGSize)sizeAttributedText:(NSAttributedString *)attributedText mode:(ELLineMode)lineMode maxWidth:(CGFloat)maxWidth
{
    switch (lineMode) {
        case ELLineModeSingle:
            return [EasyLayout sizeAttributedText:attributedText maxWidth:maxWidth];
            break;
        case ELLineModeMulti:
            return [EasyLayout sizeAttributedText:attributedText maxSize:CGSizeMake(maxWidth, CGFLOAT_MAX)];
            break;
    }
}

+ (CGSize)sizeText:(NSString *)text font:(UIFont *)font mode:(ELLineMode)lineMode maxWidth:(CGFloat)maxWidth
{
    switch (lineMode) {
        case ELLineModeSingle:
            return [EasyLayout sizeText:text font:font maxWidth:maxWidth];
            break;
        case ELLineModeMulti:
            return [EasyLayout sizeText:text font:font maxSize:CGSizeMake(maxWidth, CGFLOAT_MAX)];
            break;
    }
}

#pragma mark - Private Methods

+ (CGSize)sizeAttributedText:(NSAttributedString *)attributedText maxSize:(CGSize)maxSize
{
    return [self sizeAttributedText:attributedText linebreakMode:NSLineBreakByWordWrapping
                  constrainedToSize:maxSize];
}

+ (CGSize)sizeAttributedText:(NSAttributedString *)attributedText maxWidth:(CGFloat)maxWidth
{
    return [self sizeAttributedText:attributedText linebreakMode:NSLineBreakByTruncatingTail
                  constrainedToSize:CGSizeMake(maxWidth, CGFLOAT_MAX)];
}

+ (CGSize)sizeText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
{
    return [self sizeText:text font:font linebreakMode:NSLineBreakByWordWrapping
        constrainedToSize:maxSize];
}

+ (CGSize)sizeText:(NSString *)text font:(UIFont *)font maxWidth:(CGFloat)maxWidth
{
    return [self sizeText:text font:font linebreakMode:NSLineBreakByTruncatingTail
        constrainedToSize:CGSizeMake(maxWidth, CGFLOAT_MAX)];
}

+ (CGSize)sizeAttributedText:(NSAttributedString *)attributedText linebreakMode:(NSLineBreakMode)linebreakMode
           constrainedToSize:(CGSize)constrainedToSize
{
    CGSize textSize;
    switch (linebreakMode) {
        case NSLineBreakByWordWrapping:
        case NSLineBreakByCharWrapping:
            textSize = [attributedText boundingRectWithSize:constrainedToSize
                                                    options:NSStringDrawingUsesLineFragmentOrigin
                                                    context:nil].size;
            break;
            
        case NSLineBreakByClipping:
        case NSLineBreakByTruncatingHead:
        case NSLineBreakByTruncatingMiddle:
        case NSLineBreakByTruncatingTail:
            textSize = [attributedText boundingRectWithSize:CGSizeMake(constrainedToSize.width, CGFLOAT_MAX)
                                                    options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin
                                                    context:nil].size;
            break;
    }
    
    return CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
}

+ (CGSize)sizeText:(NSString *)text font:(UIFont *)font linebreakMode:(NSLineBreakMode)linebreakMode constrainedToSize:(CGSize)constrainedToSize
{
    CGSize textSize;
    switch (linebreakMode) {
        case NSLineBreakByWordWrapping:
        case NSLineBreakByCharWrapping:
            textSize = [text boundingRectWithSize:constrainedToSize
                                          options:NSStringDrawingUsesLineFragmentOrigin
                                       attributes:@{NSFontAttributeName:font,NSKernAttributeName:@(-1.0f)}
                                          context:nil].size;
            break;
            
        case NSLineBreakByClipping:
        case NSLineBreakByTruncatingHead:
        case NSLineBreakByTruncatingMiddle:
        case NSLineBreakByTruncatingTail:
            textSize = [text boundingRectWithSize:CGSizeMake(constrainedToSize.width, CGFLOAT_MAX)
                                          options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin
                                       attributes:@{NSFontAttributeName:font}
                                          context:nil].size;
            break;
    }
    
    return CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
}

#pragma mark -
@end

@implementation EasyLayout(TextField)
+ (void)sizeTextFieldHeight:(UITextField *)textField offset:(CGFloat)offset
{
    static NSString *placeHolder = @"M";
    CGSize calculatedSize = [EasyLayout sizeText:placeHolder font:textField.font mode:ELLineModeSingle maxWidth:CGFLOAT_MAX];
    textField.extQuickFrame.size.height = calculatedSize.height+offset;
}
@end

