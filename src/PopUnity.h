#pragma once

#include <SoyUnity.h>

//	some global params
namespace Unity
{
	static Unity::sint	mEventId = 0x66645678;
	
	extern int			GetPluginEventId();
};


__export Unity::sint	PopCompute_GetPluginEventId();

