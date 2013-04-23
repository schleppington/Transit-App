//Author: M Shafae
//Description: Took this from the example pdf project

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface TiledPDFView : UIView
{
    CGPDFPageRef _pdfPage;
    CGFloat _myScale;
}

@property (assign) CGPDFPageRef pdfPage;
@property (assign) CGFloat myScale;


- (id)initWithFrame:(CGRect)frame scale:(CGFloat)scale;
- (void)setPage:(CGPDFPageRef)newPage;

@end