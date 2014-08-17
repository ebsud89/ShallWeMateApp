//
//  SWMNetwork.m
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/17/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import "SWMNetwork.h"

#define kServerAddrUpload  @"http://localhost:8080/SWMserver/conntest.jsp"
//#define kServerAddr  @"http://localhost:3000/names/index"
#define kServerAddr  @"http://localhost:8080/SWMserver/conntest.jsp"
#define kServerAddrRedirect  @"http://localhost:8080/SWMserver/conntest.jsp"
#define kServerAddrRestricted  @"http://localhost:8080/SWMserver/conntest.jsp"

@implementation SWMNetwork

- (void) uploadAsyncHTTPPost
{
    NSURL *url = [NSURL URLWithString:kServerAddrUpload];

    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSString *data = @"msg=This_is_Test";
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[data dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLResponse *resp = nil;
    NSError *error = nil;
    
    // clear data
    //    self.recvData = [NSMutableData data];
    
    // connect server
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [conn start];
    
}

// Download Data from server using NSString method
- (void) downloadUsingString
{
    NSURL *url = [NSURL URLWithString:kServerAddr];
    NSString *text = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:NULL];
}

// Download Data synchronously using NSURLConnection.
- (void) downloadUsingSync
{
    NSURL *url = [NSURL URLWithString:kServerAddr];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLResponse *resp = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&resp error:&error];
    
    NSString *text = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

// Download Data synchronously using NSURLConnection.
// This method cause Timeout
- (void) downloadUsingSyncWithTimeout
{
    //    // server is going to respone in 3 seconds.
    //    NSURL *url = [NSURL URLWithString:ServerAddrWithTimeout(3)];
    NSURL *url = [NSURL URLWithString:kServerAddr];
    
    // this app just waits for 1 second
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestReloadIgnoringCacheData
                                         timeoutInterval:1.0f];
    NSURLResponse *resp = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&resp error:&error];
    
    if ( error )
    {
        
        // error domain : NSURLErrorDomain
        // error code   : NSURLErrorTimedOut
        NSLog(@"%@", error);
        
    } else {
        
        NSString *text = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
}

// download data asynchronously from server
//
// NSURLConnection delegate functions is called like below
//  -[ViewController connection:willSendRequest:redirectResponse:]
//  -[ViewController connection:didReceiveResponse:]
//  -[ViewController connection:didReceiveData:]
//  -[ViewController connectionDidFinishLoading:]
//
- (void) downloadUsingASync
{
    NSURL *url = [NSURL URLWithString:kServerAddr];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLResponse *resp = nil;
    NSError *error = nil;
    
    // clear data
    //    self.recvData = [NSMutableData data];
    
    // connect server
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [conn start];
}


// this function cause timeout error
//
//
// NSURLConnection delegate functions is called like below
//  1.  -[ViewController connection:willSendRequest:redirectResponse:]
//  2.  -[ViewController connection:didFailWithError:]
- (void) downloadUsingASyncWithTimeout
{
//    NSURL *url = [NSURL URLWithString:ServerAddrWithTimeout(3)];
        NSURL *url = [NSURL URLWithString:kServerAddr];
    
    // this app just waits for 1 second
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestReloadIgnoringCacheData
                                         timeoutInterval:1.0f];
    NSURLResponse *resp = nil;
    NSError *error = nil;
    
    // clear data
//    self.recvData = [NSMutableData data];
    
    // connect server
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [conn start];
}


// when you connect |kServerAddrRedirect|, server redirect to |kServerAddr|
// this function is to show iOS how to handle redirect process.
//
// 1. device connect |kServerAddrRedirect|
// -[ViewController connection:willSendRequest:redirectResponse:]
// 2. address is redirected to |kServerAddr|
// -[ViewController connection:willSendRequest:redirectResponse:]
// 3. get Response
// -[ViewController connection:didReceiveResponse:]
// 4. get Data
// -[ViewController connection:didReceiveData:]
// 5. finish
// -[ViewController connectionDidFinishLoading:]

- (void) redirectAndDownloadUsingASync
{
    NSURL *url = [NSURL URLWithString:kServerAddrRedirect];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLResponse *resp = nil;
    NSError *error = nil;
    
    // clear data
//    self.recvData = [NSMutableData data];
    
    // connect server
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [conn start];
}

// |kServerAddrRestricted| is required in HTTP Basic
// when iOS access |kServerAddrRestricted|, iOS is going to ask us id/pw.
//
// process.
//
// -[ViewController connection:willSendRequest:redirectResponse:]
// -[ViewController connection:canAuthenticateAgainstProtectionSpace:]
// -[ViewController connection:didReceiveAuthenticationChallenge:]
// -[ViewController connection:didReceiveResponse:]
// -[ViewController connection:didReceiveData:]
// -[ViewController connection:willCacheResponse:]
// -[ViewController connectionDidFinishLoading:]
- (void) downloadRestrictedDataUsingASync
{
    NSURL *url = [NSURL URLWithString:kServerAddrRestricted];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLResponse *resp = nil;
    NSError *error = nil;
    
    // clear data
//    self.recvData = [NSMutableData data];
    
    // connect server
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [conn start];
}




#pragma mark - NSURLConnection Delegate


- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%s", __FUNCTION__);
    
    NSLog(@"error = %@", error);
    
    NSString *text = [error localizedDescription];
//    self.textView.text = text;
    
}

- (BOOL)connectionShouldUseCredentialStorage:(NSURLConnection *)connection
{
    NSLog(@"%s", __FUNCTION__);
    return NO;
    
}
- (void)connection:(NSURLConnection *)connection
willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    NSLog(@"%s", __FUNCTION__);
    
    if ([challenge previousFailureCount] > 0) {
        NSLog(@"failure count = %d", [challenge previousFailureCount]);
    }
    else
    {
        
        // available persistence value
        //   - NSURLCredentialPersistenceForSession / NSURLCredentialPersistencePermanent : don't ask again during on-running
        //   - NSURLCredentialPersistenceNone  :  it will be asked every try.
        NSURLCredential *credential = [NSURLCredential credentialWithUser:@"test"
                                                                 password:@"secret"
                                                              persistence:NSURLCredentialPersistenceForSession];
        
        [[challenge sender] useCredential:credential forAuthenticationChallenge:challenge];
    }
}

// Deprecated authentication delegates.
- (BOOL)connection:(NSURLConnection *)connection
canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace
{
    NSLog(@"%s", __FUNCTION__);
    return YES;
}
- (void)connection:(NSURLConnection *)connection
didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    NSLog(@"%s", __FUNCTION__);
    
    if ([challenge previousFailureCount] > 0) {
        NSLog(@"failure count = %d", [challenge previousFailureCount]);
    }
    else
    {
        
        // available persistence value
        //   - NSURLCredentialPersistenceForSession / NSURLCredentialPersistencePermanent : don't ask again during on-running
        //   - NSURLCredentialPersistenceNone  :  it will be asked every try.
        NSURLCredential *credential = [NSURLCredential credentialWithUser:@"test"
                                                                 password:@"secret"
                                                              persistence:NSURLCredentialPersistenceNone];
        
        [[challenge sender] useCredential:credential forAuthenticationChallenge:challenge];
    }
    
}
- (void)connection:(NSURLConnection *)connection
didCancelAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    NSLog(@"%s", __FUNCTION__);
    
}

// this function is called when NSConnection assess server or
// address is redirected to another address.
- (NSURLRequest *)connection:(NSURLConnection *)connection
             willSendRequest:(NSURLRequest *)request
            redirectResponse:(NSURLResponse *)response
{
    NSLog(@"%s", __FUNCTION__);
    return request;
}

- (void)connection:(NSURLConnection *)connection
didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"%s", __FUNCTION__);
    
}

- (void)connection:(NSURLConnection *)connection
    didReceiveData:(NSData *)data
{
    NSLog(@"%s", __FUNCTION__);
    
//    [self.recvData appendData:data];
    
}

- (NSInputStream *)connection:(NSURLConnection *)connection needNewBodyStream:(NSURLRequest *)request
{
    NSLog(@"%s", __FUNCTION__);
    return nil;
}

// notification how many data it sent
- (void)connection:(NSURLConnection *)connection
   didSendBodyData:(NSInteger)bytesWritten
 totalBytesWritten:(NSInteger)totalBytesWritten
totalBytesExpectedToWrite:(NSInteger)totalBytesExpectedToWrite
{
    NSLog(@"%s", __FUNCTION__);
    
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse *)cachedResponse
{
    NSLog(@"%s", __FUNCTION__);
    return cachedResponse;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"%s", __FUNCTION__);
//    NSString *text = [[[NSString alloc] initWithData:self.recvData encoding:NSUTF8StringEncoding] autorelease];
//    self.textView.text = text;
}

- (NSArray *) jsonToArray:(NSData *)inpData {
    NSError *error = nil;
    NSArray *json = [NSJSONSerialization JSONObjectWithData:inpData options:kNilOptions error:&error];
    
    if (error)
        NSLog(@"ERROR in Network Class (jsonToArray)");
    else
        NSLog(@"JSON item : %lu", [json count]);
    return json;
}
@end
