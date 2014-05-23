# EasyLayout

### Overview

EasyLayout is my experimental framework for performing quick layout of views.  The goal of this framework to replace the need for AutoLayout, which is sort of awful for laying out views in code.

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

### Really?

OK, I'll be honest.  This isn't really a replacement for AutoLayout.  EasyLayout is too simple to be compared with AutoLayout.  Behind the scenes it is just setting the frame rect of views.  It only supports a few commonly used layouts.  It's not that elaborate.

But, I can't stop using it.  I can bang out complex layouts super fast and never have to debug constraint errors.



### TODO

* Provide sample project illustrating it's use.
* Improve documentation
* Add visual examples


### License

EasyLayout is available under the MIT license. See the LICENSE file for more info.
