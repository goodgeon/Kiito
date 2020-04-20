package global.sesoc.kiito.util;

import java.util.HashMap;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.Coolsms;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class SmsService {
	String api_key = "NCS2TQ3FF6B1RBGS";
    String api_secret = "KOEZ3PPLDABSAIDRMBK7BJA2EHBXNBQU";
    Message coolsms = new Message(api_key, api_secret);
    //Coolsms coolsms = new Coolsms(api_key, api_secret);
    
    public void sendSMS(String phoneNumber, String checkin, int congestion, String contents) {
    	String str = "받는번호 : "+phoneNumber;
    	str += "\n장소 : " + checkin;
    	str += "\n혼잡 : " + congestion;
    	str += "\n내용 : " + contents;
    	
    	HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", phoneNumber); // 수신번호
        params.put("from", "01062374806"); // 발신번호
        params.put("type", "SMS"); // Message type ( SMS, LMS, MMS, ATA )
        params.put("text", str); // 문자내용    
        //params.put("app_version", "JAVA SDK v2.2"); // application name and version
        
        try {
            JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println(obj.toString());
          } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
          }
    }

}
