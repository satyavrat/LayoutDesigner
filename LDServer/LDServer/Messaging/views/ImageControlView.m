//
//  ImageControlView.m
//  MacApplicationTest
//
//  Created by Ved Surtani on 12/09/11.
//  Copyright 2011 Imaginea 
//  Licensed under the Apache License, Version 2.0 (the "License");
//    you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at

//  http://www.apache.org/licenses/LICENSE-2.0

//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

#import "ImageControlView.h"
#import "LDMessageParamImage.h"


static NSArray *openFiles()
{
    NSOpenPanel *panel;
    
    panel = [NSOpenPanel openPanel];
    [panel setFloatingPanel:YES];
    [panel setCanChooseDirectories:NO];
    [panel setCanChooseFiles:YES];
    NSInteger i = [panel runModalForTypes:nil];
    if(i == NSOKButton){
        return [panel filenames];
    }
    
    return nil;
}


@implementation ImageControlView
@synthesize advancedImageView;
@synthesize imageView;
@synthesize browseButton;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (IBAction)browseClicked:(id)sender {
    NSArray *files = openFiles();
    if (files != nil && [files count] >0) {
        NSString *path =  [files objectAtIndex:0];
        NSImage *image = [[NSImage alloc] initWithContentsOfFile:path];
        [imageView setImage:image];
     //   [advancedImageView setImage:image];
        [image release];
        if (delegate != nil) {
            [delegate valueChanged:self];
        }
    }    
}
@end
