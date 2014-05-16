/**
 * Copyright (c) 2014 SMC Treviso s.r.l. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 *
 * Appcelerator Titanium is Copyright (c) 2009-2014 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */

#import "ItSmcFixTimob14697Module.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation ItSmcFixTimob14697Module

#pragma mark Internal

-(id)moduleGUID
{
    return @"923e912f-bf50-4584-a728-fb8253a53e0a";
}

-(NSString*)moduleId
{
    return @"it.smc.fix.timob14697";
}

#pragma mark Lifecycle

-(void)startup
{
    [super startup];

    NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
    [super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
    [super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
    [super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
    if (count == 1 && [type isEqualToString:@"my_event"])
    {
        // the first (of potentially many) listener is being added
        // for event named 'my_event'
    }
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
    if (count == 0 && [type isEqualToString:@"my_event"])
    {
        // the last listener called for event named 'my_event' has
        // been removed, we can optionally clean up any resources
        // since no body is listening at this point for that event
    }
}

@end
