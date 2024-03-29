# This needs to be defined to get the right header directories for egl / etc
APP_PLATFORM 	:= android-19

# This needs to be defined to avoid compile errors like:
# Error: selected processor does not support ARM mode `ldrex r0,[r3]'
APP_ABI 		:= armeabi-v7a

# set some defines
APP_CPPFLAGS += -DTARGET_ANDROID

# parse the preprocessor settings from xcode(env var->-DXXX=Y)
EMPTY :=
SPACE := $(EMPTY) $(EMPTY)
# strip whitespace from the back, and then insert one at the start (which will be replaced)
# gr: will fail for empty define list!
DEFINITIONS = $(SPACE)$(strip $(GCC_PREPROCESSOR_DEFINITIONS))
#$(info DEFINITIONS=<$(DEFINITIONS)>)
# replace all spaces with " -D" to insert def
# gr: will fail for strings with spaces!
GCC_PREPROCESSOR_DEFINITIONS_LIST = $(subst $(SPACE), -D,$(DEFINITIONS))
APP_CPPFLAGS += $(GCC_PREPROCESSOR_DEFINITIONS_LIST)$(SPACE)
#$(info GCC_PREPROCESSOR_DEFINITIONS_LIST=<$(GCC_PREPROCESSOR_DEFINITIONS_LIST)>)

# enable c++11
# gr: incompatible with unity's build
#APP_CPPFLAGS += -std=c++11 -pthread -frtti -fexceptions -D__cplusplus11
# gr: including c++11 is okay, but SOME CODE (not sure what yet), causes "dll not found"..."
APP_CPPFLAGS += -std=c++11
APP_CPPFLAGS += -fexceptions

#for <thread> and <mutex> we don't want to use gcc 4.6'
#	http://stackoverflow.com/questions/23911019/setting-up-c11-stdthread-for-ndk-with-adt-eclipse
#APP_STL := stlport_static
APP_STL := gnustl_static

# okay with unity 5.0.2
APP_USE_CPP0X := true
NDK_TOOLCHAIN_VERSION = clang
