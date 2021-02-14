# CSStickyHeaderFlowLayout

Parallax, Sticky Headers, Growing image heading, done right in one UICollectionViewLayout.

## Usage

**1. Setting up the Sticky Section Header**

Configure your collection view to use `CSStickyHeaderFlowLayout`. 

Now all your **section headers** will get the sticky effect like table view. You can disable it with one line of code.

```objective-c
@property (nonatomic) BOOL disableStickyHeaders;
```

**2. Setting up the Collection View Header**

We'll be using _supplementary views_ for our parallax header. Here's an example on how use a nib file for that purpose:

![](http://f.cl.ly/items/0x1L0U2x1U0g2q2E1i3Z/header-grow.jpeg)

Register that nib file to your collection view controller in code:

```objective-c
#import "CSStickyHeaderFlowLayout.h"

- (void)viewDidLoad {

    [super viewDidLoad];

    // Locate your layout
    CSStickyHeaderFlowLayout *layout = (id)self.collectionViewLayout;
    if ([layout isKindOfClass:[CSStickyHeaderFlowLayout class]]) {
        layout.parallaxHeaderReferenceSize = CGSizeMake(320, 200);
    }

    // Locate the nib and register it to your collection view
    UINib *headerNib = [UINib nibWithNibName:@"CSGrowHeader" bundle:nil];
    [self.collectionView registerNib:headerNib
          forSupplementaryViewOfKind:CSStickyHeaderParallaxHeader
                 withReuseIdentifier:@"header"];

}
```

Implement `-[UICollectionViewDataSource collectionView:viewForSupplementaryElementOfKind:atIndexPath:]`

```objective-c
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {

    // Check the kind if it's CSStickyHeaderParallaxHeader
    if ([kind isEqualToString:CSStickyHeaderParallaxHeader]) {

        UICollectionReusableView *cell = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                            withReuseIdentifier:@"header"
                                                                                   forIndexPath:indexPath];

        return cell;

    } else if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        // Your code to configure your section header...
    } else {
        // other custom supplementary views
    }
    return nil;
}
```

That's it. You'll be able to get the header you wanted using the best practice.

Configuring other effects are really just the way how you setup the header cell, by combining different settings in the minimal exposed properties in [CSStickyHeaderFlowLayout.h][]

```objective-c
@property (nonatomic) CGSize parallaxHeaderReferenceSize;
@property (nonatomic) CGSize parallaxHeaderMinimumReferenceSize;
@property (nonatomic) BOOL disableStickyHeaders;
```



## Requirements

- Xcode 12
- iOS 11

## Original Author

James Tang, j@jamztang.com

## License

CSStickyHeaderFlowLayout is available under the MIT license. See the LICENSE file for more info.


## Changelog

- 0.3.0: Add Swift Package Manager Support

- 0.2.12: Add Swift 5 Demo

- 0.2.11: Add support for carthage.

- 0.2.10: Fixed issue because attributes were not copied and datasource might have been niled

- 0.2.9: Remove Supplementry Header Layout Attribute to prevent crash when returning nil and while is CGSizeZero

- 0.2.8: Fixed a visual issue when animating contentInsets #85 and crash when dragging cells #69

- 0.2.7: Fixed scroll indicator covered by cell

- 0.2.6: Fixing that section header being covered by cell after perform batch update

- 0.2.5: Fixing a crash when quickly popping back to a view controller using the parallax header

- 0.2.4: Possibly fix for a crash when parallaxHeaderReferenceSize is changed

- 0.2.3: Enabled iPhone 6 screen sizes, reverted a patch and fixed a visual bug and content tapping bug.

- 0.2.2: Fix 1px header and zIndex problem, thanks
[@m1entus](https://github.com/m1entus) and [@Xyand](https://github.com/Xyand)

- 0.2.1: Fix crash on reloadData in collection view when header is offscreen, thanks [@jessesquires](https://github.com/jessesquires)

- 0.2: Added custom UICollectionViewLayoutAttributes to support more advanced example (Spotify App)

- 0.1.1: Minor fixes for default number of sections, thanks [@miwillhite](https://github.com/miwillhite)

- 0.1: Initial Release
