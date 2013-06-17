//
//  airpingback_v5.m
//  airpingback_v5
//
//  Created by FLX on 09/05/13.
//  Copyright (c) 2013 FLX. All rights reserved.
//

#import "FlashRuntimeExtensions.h"
#import <FacebookSDK/FacebookSDK.h>

static FREObject PingBack_publishInstall(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    NSLog(@"Entering checkin()");
    
    /*
     if (argc != 1)
     {
     NSLog(@"Invalid amount of args");
     return NULL;
     }
     */
    
    uint32_t length;
    const uint8_t *checkinText;
    if (FREGetObjectAsUTF8(argv[0], &length, &checkinText) != FRE_OK)
    {
        NSLog(@"FREGetObjectAsUTF8 failed");
        return NULL;
    }
    
    //[[HeyzapSDK sharedSDK] checkinWithMessage: [NSString stringWithUTF8String:(char*)checkinText]];
    [FBSettings publishInstall:[NSString stringWithUTF8String:(char*)checkinText]];
    
    return NULL;
}



// The context initializer is called when the runtime creates the extension context instance.
static void ContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet)
{
    NSLog(@"Entering ContextInitializer()");
    
	*numFunctionsToTest = 1;
	FRENamedFunction* func = (FRENamedFunction*)malloc(sizeof(FRENamedFunction) * *numFunctionsToTest);
    
	func[0].name = (const uint8_t*)"publishInstall";
	func[0].functionData = NULL;
	func[0].function = &PingBack_publishInstall;
    
	*functionsToSet = func;
    
    NSLog(@"Exiting ContextInitializer()");
}

// The context finalizer is called when the extension's ActionScript code
// calls the ExtensionContext instance's dispose() method.
// If the AIR runtime garbage collector disposes of the ExtensionContext instance, the runtime also calls
// ContextFinalizer().
static void ContextFinalizer(FREContext ctx) {
	
    NSLog(@"Entering ContextFinalizer()");
}

// The extension initializer is called the first time the ActionScript side of the extension
// calls ExtensionContext.createExtensionContext() for any context.
void PingBackExtInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet)
{
    NSLog(@"Entering ExtInitializer()");
    
	*extDataToSet = NULL;
	*ctxInitializerToSet = &ContextInitializer;
	*ctxFinalizerToSet = &ContextFinalizer;
    
    NSLog(@"Exiting ExtInitializer()");
}

// The extension finalizer is called when the runtime unloads the extension. However, it is not always called.
void PingBackExtFinalizer(void* extData)
{
    NSLog(@"Entering ExtFinalizer()");
}
