//
//  IOEnumerator.c
//  FWLR Tool
//
//  Created by Sem Voigtländer on 18/01/2018.
//  Copyright © 2018 Jailed Inc. All rights reserved.
//  Contains parts of S1guza's code

#import "IOEnumerator.h"
#import "IOKit/IOKitLib.h"
#import <Foundation/Foundation.h>
@interface IOEnumerator()
@end

@implementation IOEnumerator

#define NUMSERVICES 112
char *names[NUMSERVICES] =
{
    "AGXShared",
    "ASP",
    "AppleARMIIC",
    "AppleAVE",
    "AppleAuthCP",
    "AppleBCMWLAN",
    "AppleBaseband",
    "AppleBiometricServices",
    "AppleCredentialManager",
    "AppleD5500",
    "AppleEffaceableStorage",
    "AppleEmbeddedPCIE",
    "AppleH2CamIn",
    "AppleH3CamIn",
    "AppleH4CamIn",
    "AppleH6CamIn",
    "AppleHDQGasGaugeControl",
    "AppleIPAppender",
    "AppleJPEGDriver",
    "AppleKeyStore",
    "AppleMobileApNonce",
    "AppleMobileFileIntegrity",
    "AppleMultitouchSPI",
    "AppleNANDFTL",
    "AppleNVMeSMART",
    "AppleOscarCMA",
    "AppleOscar",
    "ApplePMGRTemp",
    "AppleSEP",
    "AppleSPUHIDDevice",
    "AppleSPUHIDDriver",
    "AppleSPUProfileDriver",
    "AppleSPU",
    "AppleSRSDriver",
    "AppleSSE",
    "AppleSmartIO",
    "AppleStockholmControl",
    "AppleT700XTempSensor",
    "AppleTempSensor",
    "AppleUSBHostDevice",
    "AppleUSBHostInterface",
    "AppleUSBHost",
    "AppleVXD375",
    "AppleVXD390",
    "AppleVXD393",
    "AppleVXE380",
    "CCDataPipe",
    "CCLogPipe",
    "CCPipe",
    "CoreCapture",
    "EffacingMediaFilter",
    "EncryptedMediaFilter",
    "H3H264VideoEncoderDriver",
    "IOAESAccelerator",
    "IOAVAudioInterface",
    "IOAVCECControlInterface",
    "IOAVController",
    "IOAVDevice",
    "IOAVInterface",
    "IOAVService",
    "IOAVVideoInterface",
    "IOAccelMemoryInfo",
    "IOAccelRestart",
    "IOAccelShared",
    "IOAccessoryEAInterface",
    "IOAccessoryIDBus",
    "IOAccessoryManager",
    "IOAccessoryPort",
    "IOAudio2Device",
    "IOAudio2Transformer",
    "IOAudioCodecs",
    "IOCEC",
    "IOEthernetController",
    "IOFlashController",
    "IODPAudioInterface",
    "IODPController",
    "IODPDevice",
    "IODPDisplayInterface",
    "IODPService",
    "IOHDIXController",
    "IOHIDEventService",
    "IOHIDLib",
    "IOHIDResourceDevice",
    "IOMikeyBusBulkPipe",
    "IOMikeyBusDevice",
    "IOMikeyBusFunctionGroup",
    "IOMobileFramebuffer",
    "IOMobileGraphicsFamily",
    "IONetworkStack",
    "IONetworkStackUserClient",
    "IONetwork",
    "IOPlatformExpertDevice",
    "IOPKEAccelerator",
    "IOPRNGAccelerator",
    "IOReport",
    "IOSHA1Accelerator",
    "IOStreamAudio",
    "IOStream",
    "IOSurfaceRoot",
    "IOUSBDeviceInterface",
    "IOUserEthernetResource",
    "KDIDiskImageNub",
    "LwVM",
    "ProvInfoIOKit",
    "RTBuddyLoader",
    "RTBuddy",
    "RootDomain",
    "com_apple_audio_IOBorealisOwl",
    "com_apple_driver_FairPlayIOKit",
    "com_apple_driver_KeyDeliveryIOKit",
    "mDNSOffload",
    "wlDNSOffload",
};

+(NSArray*)enumerate {
    NSArray* IOServices = [NSArray array];
    io_master_t master;
    if(IOMasterPort(mach_host_self(), &master) != KERN_SUCCESS) {
        printf("Can't get master port.\n");
        return IOServices;
    }
    for(uint32_t i = 0; i < NUMSERVICES; ++i) {
        io_service_t service = IOServiceGetMatchingService(master, IOServiceMatching(names[i]));
        if(MACH_PORT_VALID(service)) {
            io_connect_t conn = MACH_PORT_NULL;
            IOServiceOpen(service, mach_task_self(), 0, &conn);
            if(MACH_PORT_VALID(conn)) {
                IOServices = [IOServices arrayByAddingObject:[NSString stringWithUTF8String:names[i]]];
            }
        }
    }
    return IOServices;
}
@end
