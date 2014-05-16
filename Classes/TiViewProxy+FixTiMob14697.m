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

#import <libkern/OSAtomic.h>
#import "TiViewProxy+FixTiMob14697.h"

#define IGNORE_IF_NOT_OPENED if (!windowOpened||[self viewAttached]==NO) return;

@implementation TiViewProxy (FixTiMob14697)

-(void)layoutChildrenIfNeeded
{
    IGNORE_IF_NOT_OPENED

    // if not attached, ignore layout
    if ([self viewAttached])
    {
        // if not visible, ignore layout
        if (!self.parentVisible || view.hidden)
        {
            OSAtomicTestAndClearBarrier(TiRefreshViewEnqueued, &dirtyflags);
            return;
        }

        [self refreshView:nil];

        BOOL wasSet=OSAtomicTestAndClearBarrier(NEEDS_LAYOUT_CHILDREN, &dirtyflags);
        if (wasSet && [self viewAttached])
        {
            [self layoutChildren:NO];
        }
    }
}

@end
