package com.digitalfun.pingback;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;



public class Pingback implements FREExtension{

	@Override
	public FREContext createContext(String contextType) {
		return new PingBackContext();
	}

	@Override
	public void dispose() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void initialize() {		
		
	}
	

}
