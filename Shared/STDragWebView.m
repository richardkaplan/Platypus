/*
    Copyright (c) 2003-2021, Sveinbjorn Thordarson <sveinbjorn@sveinbjorn.org>
    All rights reserved.

    Redistribution and use in source and binary forms, with or without modification,
    are permitted provided that the following conditions are met:

    1. Redistributions of source code must retain the above copyright notice, this
    list of conditions and the following disclaimer.

    2. Redistributions in binary form must reproduce the above copyright notice, this
    list of conditions and the following disclaimer in the documentation and/or other
    materials provided with the distribution.

    3. Neither the name of the copyright holder nor the names of its contributors may
    be used to endorse or promote products derived from this software without specific
    prior written permission.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
    ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
    WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
    IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
    INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
    NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
    PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
    WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
    ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
    POSSIBILITY OF SUCH DAMAGE.
*/

#import "STDragWebView.h"

@implementation STDragWebView

#pragma mark Accepting Drags

- (NSDragOperation)draggingEntered:(id <NSDraggingInfo> )sender {
    if (self.dragDelegate && [self.dragDelegate respondsToSelector:@selector(draggingEntered:)]) {
        return [self.dragDelegate draggingEntered:sender];
    }
    return NSDragOperationNone;
}

- (void)draggingExited:(id <NSDraggingInfo> )sender {
    if (self.dragDelegate && [self.dragDelegate respondsToSelector:@selector(draggingExited:)]) {
        [self.dragDelegate draggingExited:sender];
    }
}

- (NSDragOperation)draggingUpdated:(id <NSDraggingInfo> )sender {
    if (self.dragDelegate && [self.dragDelegate respondsToSelector:@selector(draggingUpdated:)]) {
        return [self.dragDelegate draggingUpdated:sender];
    }
    return NSDragOperationNone;
}

- (BOOL)prepareForDragOperation:(id <NSDraggingInfo>)sender {
    if (self.dragDelegate && [self.dragDelegate respondsToSelector:@selector(prepareForDragOperation:)]) {
        return [self.dragDelegate prepareForDragOperation:sender];
    }
    return NO;
}

- (BOOL)performDragOperation:(id <NSDraggingInfo> )sender {
    if (self.dragDelegate && [self.dragDelegate respondsToSelector:@selector(performDragOperation:)]) {
        return [self.dragDelegate performDragOperation:sender];
    }
    return NO;
}

- (void)concludeDragOperation:(id <NSDraggingInfo> )sender {
    if (self.dragDelegate && [self.dragDelegate respondsToSelector:@selector(concludeDragOperation:)]) {
        [self.dragDelegate concludeDragOperation:sender];
    }
}

@end
