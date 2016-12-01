//
//  HWNetworkLogger.m
//  Reborn
//
//  Created by tpeng on 2016/11/25.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWNetworkLogger.h"
#import "HWRequest.h"

@implementation HWNetworkLogger

+ (void)logRequestDebugInfoWithRequest:(HWBaseRequest *)request
{
  
  NSMutableString *logString = [NSMutableString stringWithString:@"\n\n============================================================\n|                      Request Start                       |\n============================================================\n\n"];
  
  [logString appendFormat:@"API Name:\t\t%@\n", request.requestUrl];
  [logString appendFormat:@"Method:\t\t\t%ld\n", (long)request.requestMethod];
  [logString appendFormat:@"Params:\n%@", request.requestArgument];
  
  [logString appendString:[HWNetworkLogger requestInfoWithURLRequest:request.currentRequest]];
  
  [logString appendFormat:@"\n\n============================================================\n|                        Request End                       |\n============================================================\n\n\n\n"];
  NSLog(@"%@", logString);
}

+ (void)logResponseDebugInfoWithRequest:(HWBaseRequest *)request;
{
  BOOL shouldLogError = request.error ? YES : NO;
  
  
  NSMutableString *logString = [NSMutableString stringWithString:@"\n\n==============================================================\n=                        API Response                        =\n==============================================================\n\n"];
  
  [logString appendFormat:@"Status:\t%ld\t(%@)\n\n", (long)request.responseStatusCode, [NSHTTPURLResponse localizedStringForStatusCode:request.responseStatusCode]];
  [logString appendFormat:@"Content:\n\t%@\n\n", request.responseString];
  if (shouldLogError) {
    NSError *error = request.error;
    [logString appendFormat:@"Error Domain:\t\t\t\t\t\t%@\n", error.domain];
    [logString appendFormat:@"Error Domain Code:\t\t\t\t\t%ld\n", (long)error.code];
    [logString appendFormat:@"Error Localized Description:\t\t\t%@\n", error.localizedDescription];
    [logString appendFormat:@"Error Localized Failure Reason:\t\t%@\n", error.localizedFailureReason];
    [logString appendFormat:@"Error Localized Recovery Suggestion:\t%@\n\n", error.localizedRecoverySuggestion];
  }
  
  [logString appendString:@"\n---------------  Related Request Content  --------------\n"];
  
  [logString appendString:[HWNetworkLogger requestInfoWithURLRequest:request.currentRequest]];
  
  [logString appendFormat:@"\n\n==============================================================\n=                        Response End                        =\n==============================================================\n\n\n\n"];
  
  NSLog(@"%@", logString);
}

+ (NSString *)requestInfoWithURLRequest:(NSURLRequest *)request
{
  NSMutableString *requestInfoString = [NSMutableString string];
  [requestInfoString appendFormat:@"\n\nHTTP URL:\n\t%@", request.URL];
  [requestInfoString appendFormat:@"\n\nHTTP Header:\n%@", request.allHTTPHeaderFields ? request.allHTTPHeaderFields : @"\t\t\t\t\tN/A"];
  [requestInfoString appendFormat:@"\n\nHTTP Body:\n\t%@", [[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding]];
  return requestInfoString;
}

@end
