//
//  att.h
//  godot-ios-att
//
//  Created by YamazakiAkio on 2022/02/05.
//

#ifndef att_h
#define att_h

#include "core/object.h"

class Att : public Object {
    GDCLASS(Att, Object);
    
    static void _bind_methods();
    
public:
    
    void requestTracking();
    
    Att();
    ~Att();
};

#endif /* att_h */
