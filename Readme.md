# EasyLayout

### Overview

EasyLayout is my experimental framework for performing quick layout of views.  

- entirely frame based—no fancy constraints needed
- gracefully handles UILabel and NSAttributedStrings sizing
- short syntax, easy to autocomplete
- provides properties you wish you always had on UIView (e.g. view.extX = 10, view.extWidth, view.extTerminus.y)
 
It is much simpler and far less powerful than AutoLayout. But, Autolayout isn't always the right solution.  Frame based layout code is not dead.

EasyLayout requires very little code and effort to build complex layouts.  

### How it works

Simple layouts can be setup by placing your layout calls directly in `layoutSubviews`.

Here is an example:

	- (void)layoutSubviews
	{
	    [super layoutSubviews];
    
	    [EasyLayout sizeLabel:timeLabel mode:ELLineModeSingle maxWidth:self.extWidth-20.0f];
	    [EasyLayout topRightView:timeLabel inParentView:self offset:cgs(-10.0f, 10.0f)];
    
	    [EasyLayout sizeLabel:tweetLabel mode:ELLineModeMulti maxWidth:self.extWidth-20.0f];
	    [EasyLayout positionView:tweetLabel belowView:timeLabel horizontallyCenterInParent:self offset:cgs(0.0f, 20.0f)];
    
	    [EasyLayout positionView:imageView belowView:tweetLabel horizontallyCenterInParent:self offset:cgs0];
	}


### Coming Soon

I want to add a few features:

- align labels using font ascenders and descenders
- complete the set of alignment scenarios 
- provide layout demo project to show off how it works
- improve documentation
- add visual examples


### License

EasyLayout is available under the MIT license. See the LICENSE file for more info.
