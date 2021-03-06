//
//  CategoryCell.m
//  BahaiWritings
//
//  Created by Arash Payan on 8/31/08.
//  Copyright 2008 Arash Payan. All rights reserved.
//

#import "CategoryCell.h"


@implementation CategoryCell

@synthesize categoryLabel;
@synthesize countLabel;
@synthesize roundedRectangle;

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier {
	if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier]) {
//	if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
		// Initialization code
		self.categoryLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10, 6, 240, 30)] autorelease];
		categoryLabel.font = [UIFont boldSystemFontOfSize:20];
		categoryLabel.highlightedTextColor = [UIColor whiteColor];
		
		CGRect countRect = CGRectMake(260, 12, 32, 20);
		self.countLabel = [[[UILabel alloc] initWithFrame:countRect] autorelease];
		countLabel.font = [UIFont boldSystemFontOfSize:14];
		countLabel.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
		countLabel.opaque = YES;
		countLabel.textColor = [UIColor whiteColor];
		countLabel.textAlignment = UITextAlignmentCenter;
		countLabel.highlightedTextColor = [UIColor colorWithRed:2.0/255.0 green:114.0/255.0 blue:237.0/255.0 alpha:1];
		self.roundedRectangle = [[[RoundedRectangleView alloc] initWithFrame:countRect] autorelease];
		
		//[self.contentView addSubview:[[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"prayerBackground.jpg"]] autorelease]];
		
		[self.contentView addSubview:categoryLabel];
		[self.contentView addSubview:roundedRectangle];
		[self.contentView addSubview:countLabel];
	}
	return self;
}

- (void)setFrame:(CGRect)frame {
	CGRect countRect = CGRectMake(CGRectGetMaxX(frame)-70, 12, 32, 20);
	countLabel.frame = countRect;
	roundedRectangle.frame = countRect;
	
	CGRect categoryRect = CGRectMake(10, 6, CGRectGetMaxX(frame)-90, 30);
	categoryLabel.frame = categoryRect;
	
	[super setFrame:frame];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

	[super setSelected:selected animated:animated];

	// Configure the view for the selected state
	categoryLabel.highlighted = selected;
	countLabel.highlighted = selected;
	[roundedRectangle setHighlighted:selected];
}
		
- (void)setCategory:(NSString*)aCategory {
	categoryLabel.text = aCategory;
}

- (void)setCount:(NSString*)aCount {
	countLabel.text = aCount;
}

- (void)dealloc {
	self.categoryLabel = nil;
	self.countLabel = nil;
	self.roundedRectangle = nil;
	[super dealloc];
}


@end
