# App Tracking Transparency plugin for Godot
This is a plugin for Godot that calls App Tracking Transparency on [iOS](https://developer.apple.com/documentation/apptrackingtransparency).

## Instructions
Clone this repository and it's submodules:
```
git clone --recurse-submodules git@github.com:funseek/godot-ios-att.git
```

To generate Godot headers you need to run compilation command inside godot submodule directory.   
Example:
```
./scripts/generate_headers.sh
```

Building a .a library
```
./scripts/release_static_library.sh 3.4
```

Copy a.library to Godot plugin directory
```
cp bin/release/att/att.*.a $GODOT_HOME/ios/plugins/att/bin/
cp att.gdip $GODOT_HOME/ios/plugins/
```

Calling plugin in Godot
```godot
extends Node


signal request_completed(status)
var _att = null

# Authorisation statuses:

# 0 = notDetermined
# 1 = restricted
# 2 = denied
# 3 = authorized

func _ready() -> void:
	if Engine.has_singleton('Att'):
		_att = Engine.get_singleton('Att')
		_att.connect('requestCompleted', self, '_on_request_completed')
	else:
		push_warning('App Tracking Transparency plugin not found')

func request() -> void:
	if _att != null:
		_att.requestTracking()

func _on_request_completed(status: int) -> void:
	print_debug("request_completed", status)
	emit_signal('request_completed', status)
```

## License
MIT
