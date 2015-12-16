#include "PopUnity.h"


__export Unity::sint PopCompute_GetPluginEventId()
{
	return Unity::GetPluginEventId();
}

int Unity::GetPluginEventId()
{
	return mEventId;
}


