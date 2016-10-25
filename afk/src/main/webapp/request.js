/**
 * 	request.js
 */

// var httpRequest = null;

function Request( callback, url, method, params ){
	this.callback = callback;
	this.url = url;
	this.method = method;
	this.params = params;
	var httpRequest = "";
	
	
	
}

Request.prototype = {
	"getXMLHttpRequest" : function (){
		if( window.ActiveXObject ) {
			// IE 경우
				try{
					return new ActiveXObject( "Msxml2.XMLHTTP");
				} catch( e ) {
					try{
						return new ActiveXObject( "Microsoft.XMLHTTP" );
					} catch( ex ) {
						return null;
					}
				}
		} else {
			// IE 아닌 경우
			try{
				return new XMLHttpRequest();
			} catch( e ) {
				return null;
			}
		}		
	},
	
	"sendRequest" : function (){
		this.httpRequest = this.getXMLHttpRequest();
		// callback
		this.httpRequest.onreadystatechange = this.callback;
		// method
		var httpMethod = this.method ? this.method : "GET";
		if( httpMethod != "POST" && httpMethod != "GET" ){
			httpMethod = "GET";		
		}
		// params
		
		var httpParams = ( this.params == null || this.params == "" ) ? "" : this.params;
		
		// url
		var httpUrl = httpMethod == "GET" ? ( this.url + "?" + httpParams ) : this.url;
		
		// send
		this.httpRequest.open( httpMethod, httpUrl, true );
		this.httpRequest.setRequestHeader( "content-type", "application/x-www-form-urlencoded; charset=utf-8" );
		this.httpRequest.send( httpMethod == "POST" ? httpParams : null );
		
	}

}
















