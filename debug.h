#pragma once

// Fucking clang produces nasty warnings which makes this useless for me

#if 0
#define DO_PRAGMA(x) _Pragma (#x)
#define TODO(x) DO_PRAGMA(message ("TODO - " #x))
#else
#define TODO(x)
#endif