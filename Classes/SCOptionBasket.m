//
//  SCOptionBasket.m
//  TouchCustoms
//
//  Created by Aleks Nesterow on 10/26/10.
//	aleks@screencustoms.com
//	
//  Copyright © 2010 Screencustoms, LLC.
//	All rights reserved.
//

#import "SCOptionBasket.h"

#import "SCMemoryManagement.h"

@implementation SCOptionBasket (MustOverride)

- (NSArray *)items
{
	return nil;
}

- (NSArray *)itemNames
{
	return nil;
}

@end

@implementation SCOptionBasket (Protected)

- (void)postProcessCreatedIndexes
{
}

@end

#define kSelectedIndexesKey	@"selected-indexes"

@implementation SCOptionBasket

@synthesize selectType = _selectType;
@synthesize selectedIndexes = _selectedIndexes;

#pragma mark init / dealloc

- (id)init 
{
	if (self = [super init])
	{
		_selectedIndexes = [[NSMutableIndexSet alloc] init];
		[self postProcessCreatedIndexes];
	}
	
	return self;
}

- (id)initWithSelectType:(SCOptionSelectType)selectType
{
	if (self = [self init])
	{
		_selectType = selectType;
	}
	
	return self;
}

- (id)initWithCoder:(NSCoder *)decoder
{
	if (self = [super init])
	{
		id indexSet = [decoder decodeObjectForKey:kSelectedIndexesKey];
		
		if (indexSet)
		{
			_selectedIndexes = [[NSMutableIndexSet alloc] initWithIndexSet:indexSet];
		}
		else
		{
			_selectedIndexes = [[NSMutableIndexSet alloc] init];
			[self postProcessCreatedIndexes];
		}
	}
	
	return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
	[encoder encodeObject:_selectedIndexes forKey:kSelectedIndexesKey];
}

- (void)dealloc
{
	SC_RELEASE_SAFELY(_selectedIndexes);
	
	[super dealloc];
}

#pragma mark Item operations

- (void)selectAllItems
{
	[_selectedIndexes addIndexesInRange:NSMakeRange(0, [self items].count)];
}

- (void)selectNoItems
{
	[_selectedIndexes removeAllIndexes];
}

- (void)toggleItem:(NSUInteger)itemIndex
{	
	if ([_selectedIndexes containsIndex:itemIndex])
	{
		[_selectedIndexes removeIndex:itemIndex];
	}
	else
	{
		[_selectedIndexes addIndex:itemIndex];
	}
}

@end