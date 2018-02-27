/********* iXpand.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import <iXpandSDK/iXpandSystemAPI.h>

@interface iXpand : CDVPlugin {
    // Member variables go here.
}

- (void)coolMethod:(CDVInvokedUrlCommand*)command;
- (void)writeFile:(CDVInvokedUrlCommand*)command;

@end

@implementation iXpand

- (void)coolMethod:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];
    
    if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


- (void)writeFile:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* path = [command.arguments objectAtIndex:0];    
    
    
    if (![[iXpandSystemController sharedController] initDrive:accessory])
        
    {
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self.consoleString appendString:@"Drive Initialisation failed"];
            [self updateConsole];
            return;
        });
    }
    
    else {
        If( [[iXpandSystemContbrroller sharedController] openSession]) {
           If([[iXpandFileSystemController sharedController] changeDirectoryAbsolutePath:@"\\"])
           
           {
               
               Int handle = [[iXpandFileSystemController sharedController] openFileAbsolutePath:path openMode:mode];
               
               if (handle != -1)
                   
               {
                   
                   uint32_t dataLength = 0;
                   
                   uint32_t uintDataSize = 0;
                   
                   uint32_t uintDataTranLen = 0;
                   
                   uintDataSize = (uint32_t)[self returnFileSize:test0];
                   
                   @synchronized(self)
                   
                   {
                       
                       while((dataLength != -1) && (uintDataSize != 0))
                           
                       {
                           
                           @autoreleasepool  {
                               
                               uintDataTranLen = ((uintDataSize > MAX_DATABUFFER)?  MAX_DATABUFFER : uintDataSize);
                               
                               [[fileHandle readDataOfLength:uintDataTranLen] getBytes:byDataBuf];
                               
                               NSData *aData = [NSData dataWithBytes:byDataBuf length:sizeof(byDataBuf)];
                               
                               dataLength = [[iXpandFileSystemController sharedController] writeFile:handle  writeBuf:aData writeSize:uintDataTranLen];
                               
                               uintDataSize -= dataLength;
                               
                           }
                           
                       }
                       
                       [[iXpandFileSystemController sharedController] closeFile:handle];
                       
                       [fileHandle closeFile];
                       
                   }
                   pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:path];
               }
               else{
               	pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
               }        

           }
           else {
           	pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
           }
        }
    }
    

    
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
