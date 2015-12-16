using UnityEngine;
using System.Collections;					// required for Coroutines
using System.Runtime.InteropServices;		// required for DllImport
using System;								// requred for IntPtr
using System.Text;





public class PopCompute
{
#if UNITY_STANDALONE_OSX || UNITY_EDITOR_OSX
	private const string PluginName = "PopComputeOsx";
#elif UNITY_ANDROID
	private const string PluginName = "PopCompute";
#elif UNITY_IOS
	//private const string PluginName = "PopComputeIos";
	private const string PluginName = "__Internal";
#elif UNITY_STANDALONE_WIN || UNITY_EDITOR_WIN
	private const string PluginName = "PopCompute";
#endif

	private static int				mPluginEventId = 0;
	
	[DllImport (PluginName)]
	private static extern int		PopCompute_GetPluginEventId();
	
	[DllImport (PluginName)]
	private static extern bool		FlushDebug([MarshalAs(UnmanagedType.FunctionPtr)]System.IntPtr FunctionPtr);



	public PopCompute()
	{
		//	gr: have to do this here, rather than variable init or we don't get exception errors
		mPluginEventId = PopMovie_GetPluginEventId ();
	}

	public void Update()
	{
		GL.IssuePluginEvent (mPluginEventId);
	}
	
	public string GetVersion()
	{
		return "GIT_REVISION";
	}

}

