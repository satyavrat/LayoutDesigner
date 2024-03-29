//
//  ControlView.h
//  MacApplicationTest
//
//  Created by Ved Surtani on 08/09/11.
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

#import <Cocoa/Cocoa.h>
@protocol ControlViewDelegate;
@interface ControlView : NSView
{
    id<ControlViewDelegate> delegate;
}

@property(nonatomic,assign)id<ControlViewDelegate> delegate;
-(void)cleanup;
@end



@protocol ControlViewDelegate <NSObject>

-(void)valueChanged:(ControlView*)view;
@optional
-(void)cleanup;
@end