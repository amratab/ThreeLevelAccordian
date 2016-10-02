# ThreeLevelAccordian

[![CI Status](http://img.shields.io/travis/Amrata Baghel/ThreeLevelAccordian.svg?style=flat)](https://travis-ci.org/Amrata Baghel/ThreeLevelAccordian)
[![Version](https://img.shields.io/cocoapods/v/ThreeLevelAccordian.svg?style=flat)](http://cocoapods.org/pods/ThreeLevelAccordian)
[![License](https://img.shields.io/cocoapods/l/ThreeLevelAccordian.svg?style=flat)](http://cocoapods.org/pods/ThreeLevelAccordian)
[![Platform](https://img.shields.io/cocoapods/p/ThreeLevelAccordian.svg?style=flat)](http://cocoapods.org/pods/ThreeLevelAccordian)

ThreeLevelAccordian is a three level accordian for IOS. It owes its base code to [SwiftyAccordionCells](https://github.com/justinmfischer/SwiftyAccordionCells). Most of the design is customisable. It goes till three levels. You can customise the font, color, background color of items, add image to them etc. The innermost items can be multiline too. 

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
ios 8.0+

## Installation

ThreeLevelAccordian is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ThreeLevelAccordian"
```

##Basic Usage


## Customisations
There are three types of cells for three levels of Arcadian:
	1) TLAHeaderItem: This is the highest level cell.
	2) TLACell: This is the second level cell.
	3) TLASubItem: This is the innermost cell.

	You can either specify single customisation values for all cells through the parameters given below:
	1) CellBackgroundColor
	2) CellColor: Text color
	3) CellHeight
	4) CellFont
	If you want to apply these values, make sure you mark UseSingleValues to true
 
	You can also provide cell type specific customisations. The names are self explanatory.
	For TLAHeaderItem
	1) HeaderTextFont
	2) HeaderTextColor
	3) HeaderCellBackgroundColor
	4) HeaderCellHeight

	For TLACell
	1) ItemTextFont
	2) ItemTextColor
	3) ItemCellBackgroundColor
	4) ItemCellHeight

	For TLASubItem
	1) SubItemTextFont
	2) SubItemTextColor
	3) SubItemCellBackgroundColor
	4) SubItemCellHeighti
	5) IsMultiline: Mark this as true if you are expecting your text to be too big for a single line.

	Also, if you want default styling that comes with tables, you can pass options as nil.	

	There is expand and collapse icons shown on default for appropriate rows (that is, if the row can be expanded or needs to be collapsed). You can turn it off or set your own icons for expand or collapse. Parameters for the same are:
	1) UseAccessoryIcons: mark false if you do not want to show expand/collapse icons
	2) ExpandIcon
	3) CollapseIcon

## Author

Amrata Baghel, amrata.baghel@gmail.com

## License

ThreeLevelAccordian is available under the MIT license. See the LICENSE file for more info.
