//
//  att.m
//  godot-ios-att
//
//  Created by YamazakiAkio on 2022/02/05.
//
#import <Foundation/Foundation.h>
#import <AppTrackingTransparency/AppTrackingTransparency.h>

#include "core/project_settings.h"
#include "core/class_db.h"

#import "att.h"

void Att::_bind_methods() {
    ClassDB::bind_method(D_METHOD("requestTracking"), &Att::requestTracking);
    ADD_SIGNAL(MethodInfo("requestCompleted", PropertyInfo(Variant::INT, "status")));
}

void Att::requestTracking() {
    NSLog(@"call requestTracking");
    if (@available(iOS 14, *)) {
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
            emit_signal("requestCompleted", (int)status);
        }];
    } else {
        // Fallback on earlier versions
        emit_signal("requestCompleted", 3);
    };
}

Att::Att() {
    NSLog(@"initialize Att");
}

Att::~Att() {
    NSLog(@"deinitialize Att");
}
