//
//  godot_ios_att.m
//  godot-ios-att
//
//  Created by YamazakiAkio on 2022/02/05.
//
#import <Foundation/Foundation.h>
#import "att.h"
#import "core/engine.h"

Att *att_plugin;

void godot_att_init() {
    NSLog(@"init Att plugin");

    att_plugin = memnew(Att);
    Engine::get_singleton()->add_singleton(Engine::Singleton("Att", att_plugin));
}

void godot_att_deinit() {
    NSLog(@"deinit Att plugin");
    
    if (att_plugin) {
       memdelete(att_plugin);
   }
}
