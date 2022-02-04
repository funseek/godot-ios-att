//
//  godot_ios_att.m
//  godot-ios-att
//
//  Created by YamazakiAkio on 2022/02/05.
//
#import <Foundation/Foundation.h>
#import "att.h"
#import "core/engine.h"

Att *plugin;

void godot_att_init() {
    NSLog(@"init Att plugin");

    plugin = memnew(Att);
    Engine::get_singleton()->add_singleton(Engine::Singleton("Att", plugin));
}

void godot_att_deinit() {
    NSLog(@"deinit Att plugin");
    
    if (plugin) {
       memdelete(plugin);
   }
}
