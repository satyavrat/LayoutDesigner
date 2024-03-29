//
//  LMClient.m
//  LayoutModifier
//
//  Created by Ved Surtani on 24/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//




#import "Client.h"


// Private properties
@interface Client ()
@property(nonatomic,strong) Connection* connection;
@end




@implementation Client
@synthesize connection;
@synthesize delegate;
// Setup connection but don't connect yet
- (id)initWithHost:(NSString*)host andPort:(int)port {
    connection = [[Connection alloc] initWithHostAddress:host andPort:port];
    return self;
}


// Initialize and connect to a net service
- (id)initWithNetService:(NSNetService*)netService {
    connection = [[Connection alloc] initWithNetService:netService];
    return self;
}



// Start everything up, connect to server
- (BOOL)start {
    if ( connection == nil ) {
        return NO;
    }
    
    // We are the delegate
    connection.delegate = self;
    
    return [connection connect];
}


// Stop everything, disconnect from server
- (void)stop {
    if ( connection == nil ) {
        return;
    }
    
    [connection close];
    self.connection = nil;
}


-(void)broadcastPacket:(NSDictionary*)packet
{
    [connection sendNetworkPacket:packet];
}


#pragma mark -
#pragma mark ConnectionDelegate Method Implementations

- (void)connectionAttemptFailed:(Connection*)connection {
    [delegate failedToConnect:self];
    
}


- (void)connectionTerminated:(Connection*)connection {
   // [delegate roomTerminated:self reason:@"Connection to server closed"];
    [delegate connectionTerminated:self];
}


- (void)receivedNetworkPacket:(NSDictionary*)packet viaConnection:(Connection*)connection {
    [delegate client:self receivedNetworkPacket:packet];
}

@end
