#include <bindings.cmacros.h>
#include <clap/ext/audio-ports.h>
#include <clap/ext/gui.h>
#include <clap/plugin-invalidation.h>

BC_GLOBALARRAY(CLAP_WINDOW_API_WIN32, char)
BC_GLOBALARRAY(CLAP_WINDOW_API_COCOA, char)
BC_GLOBALARRAY(CLAP_WINDOW_API_X11, char)
BC_GLOBALARRAY(CLAP_WINDOW_API_WAYLAND, char)
BC_GLOBALARRAY(CLAP_PLUGIN_INVALIDATION_FACTORY_ID, char)
BC_GLOBALARRAY(CLAP_EXT_AUDIO_PORTS , char)
BC_GLOBALARRAY(CLAP_PORT_MONO , char)
BC_GLOBALARRAY(CLAP_PORT_STEREO , char)
