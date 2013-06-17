package com.digitalfun.pingback.functions;

import android.content.Context;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREInvalidObjectException;
import com.adobe.fre.FREObject;
import com.adobe.fre.FRETypeMismatchException;
import com.adobe.fre.FREWrongThreadException;
import com.facebook.Settings;
public class PublishInstallFunction implements com.adobe.fre.FREFunction{
	public static final String TAG = "PingBackContext";

@Override
	public FREObject call(FREContext context, FREObject[] args) {
		Log.d(TAG, "i got called");
		
		Context appContext = context.getActivity().getApplicationContext();
		try {
			Settings.publishInstallAsync(appContext, args[0].getAsString());
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (FRETypeMismatchException e) {
			e.printStackTrace();
		} catch (FREInvalidObjectException e) {
			e.printStackTrace();
		} catch (FREWrongThreadException e) {
			e.printStackTrace();
		}
		Log.d(TAG, "call made");
		return null;
	}

}
