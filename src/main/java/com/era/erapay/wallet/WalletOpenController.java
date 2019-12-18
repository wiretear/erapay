package com.era.erapay.wallet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.era.erapay.common.ActivityHistoryApiCall;
import com.era.erapay.common.IpFinder;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import com.era.erapay.bank.AddBankAccountForm;

@Controller
public class WalletOpenController {
	private final Logger logger = LoggerFactory.getLogger(WalletOpenController.class);
	IpFinder ipFinder =new IpFinder();
	ActivityHistoryApiCall activityHistoryApiCall=new ActivityHistoryApiCall();
	DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh.mm.ss  aa");
	Date today = Calendar.getInstance().getTime();
	String dateAndTime = df.format(today);
    WalletOpenBO oWalletOpenBO =new WalletOpenBO();
    @RequestMapping(value= "/walletopen")
	public String Sign(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
    	HttpSession session = request.getSession(true);
		String appServerIp = (String) session.getAttribute("AppServerIp");
		String iP=ipFinder.getIp(request);
		String sessionId= (String) session.getAttribute("SESSIONID");
		String mailId= (String) session.getAttribute("photoemailid");
		CloseableHttpClient closeableHttpClientHistory = HttpClients.createDefault();
		String signInApiUrl="erapay/walletopen";
		String serverIp =(String) session.getAttribute("TESTURL");
		String loadFundServerUrl= serverIp+"/ERAPAY/addLoadFund.do";
		String userActivityServerUrl= serverIp+"/ERAPAY/userActivityHistory.do";
		HttpPost httpPostHistory = new HttpPost(userActivityServerUrl);
		session.setAttribute("KYCMessage", "");
		List<NameValuePair> paramsHistory = new ArrayList<NameValuePair>();
		paramsHistory.add(new BasicNameValuePair("api_pass", "history"));
		paramsHistory.add(new BasicNameValuePair("userid", mailId));
		paramsHistory.add(new BasicNameValuePair("sessionid", sessionId));
		paramsHistory.add(new BasicNameValuePair("actionname", signInApiUrl));
		paramsHistory.add(new BasicNameValuePair("actionintime", "11111"));
		paramsHistory.add(new BasicNameValuePair("actionouttime",dateAndTime));
		paramsHistory.add(new BasicNameValuePair("timeinterval", "usersignin"));
		paramsHistory.add(new BasicNameValuePair("terminalid", "usersignin"));
		paramsHistory.add(new BasicNameValuePair("oprstamp", mailId));
		paramsHistory.add(new BasicNameValuePair("ip_remote",iP));
		activityHistoryApiCall.getHistory(closeableHttpClientHistory, httpPostHistory, paramsHistory);
	     session.setAttribute("WalletOpenErrorMessage"," ");
		 logger.debug("Login()");
		 return "walletopennew";
	}
   
    @RequestMapping(value= "/apitest")
   	public String apitest(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
   		 HttpSession session = request.getSession(true);
		 String appServerIp = (String) session.getAttribute("AppServerIp");
   	     CloseableHttpResponse closeableHttpResponse = null;
         CloseableHttpClient httpclient = HttpClients.createDefault();
		String serverIp =(String) session.getAttribute("TESTURL");
		String bankRestRegistrationrUrl= serverIp+"/ERAPAY/bankRestRegistration.do";
		String userActivityServerUrl= serverIp+"/ERAPAY/userActivityHistory.do";
           HttpPost httpPost = new HttpPost(bankRestRegistrationrUrl);
           List<NameValuePair> params = new ArrayList<>();
           params.add(new BasicNameValuePair("action","addbank"));
           params.add(new BasicNameValuePair("bankcode","001"));
           params.add(new BasicNameValuePair("banktype","Gen"));
           params.add(new BasicNameValuePair("bankname","Standard Chartarde"));
           params.add(new BasicNameValuePair("business_addr","Dhaka"));
           params.add(new BasicNameValuePair("mobileno","01718836550"));
           params.add(new BasicNameValuePair("faxno","00007"));
           params.add(new BasicNameValuePair("commrate",""));
           params.add(new BasicNameValuePair("remark","Taka Nai"));
           params.add(new BasicNameValuePair("status","Y"));
           params.add(new BasicNameValuePair("oprstamp",""));
           params.add(new BasicNameValuePair("timstamp",""));
           params.add(new BasicNameValuePair("prodnature","Y"));
           try {
           	httpPost.setEntity(new UrlEncodedFormEntity(params));
               closeableHttpResponse = httpclient.execute(httpPost);
      //     result += responseBody;
               String responseString = EntityUtils.toString(closeableHttpResponse.getEntity(),"UTF-8");
               System.out.println("Response ===== >>>>> "+responseString);

       }catch(Exception e){

       	e.printStackTrace();

       } finally {
           httpclient.close();
       }
   		 return "users/Kyc";
   	}
    @RequestMapping(value = "/executewallet")
	public String formsuccsess(Model model,
			@ModelAttribute("oAddBankAccountForm")AddBankAccountForm oAddBankAccountForm, HttpServletRequest request,
			SessionStatus status, HttpServletResponse response) throws Exception {
		    HttpSession session = request.getSession(true);
		    String appServerIp = (String) session.getAttribute("AppServerIp");
		    String responseCode="";
		    String responseStatus="";
		    String sessionID=  (String)session.getAttribute("GSSESSION");
			String userID = (String) session.getAttribute("GSMAILID");
			String cusCode = (String) session.getAttribute("CUSCODE");
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date today = Calendar.getInstance().getTime();
			String reportDate = df.format(today);
		String serverIp =(String) session.getAttribute("TESTURL");
		String walletOpenUrl= serverIp+"/ERAPAY/walletOpen.do";
		String userActivityServerUrl= serverIp+"/ERAPAY/userActivityHistory.do";
			// Print what date is today!
			System.out.println("CUSCODE: " + cusCode);
		String iP=ipFinder.getIp(request);
		String sessionId= (String) session.getAttribute("SESSIONID");
		String mailId= (String) session.getAttribute("photoemailid");
		CloseableHttpClient closeableHttpClientHistory = HttpClients.createDefault();
		String apiUrl="/erapay/executewallet";
		HttpPost httpPostHistory = new HttpPost(userActivityServerUrl);
		session.setAttribute("KYCMessage", "");
		List<NameValuePair> paramsHistory = new ArrayList<NameValuePair>();
		paramsHistory.add(new BasicNameValuePair("api_pass", "history"));
		paramsHistory.add(new BasicNameValuePair("userid", mailId));
		paramsHistory.add(new BasicNameValuePair("sessionid", sessionId));
		paramsHistory.add(new BasicNameValuePair("actionname", apiUrl));
		paramsHistory.add(new BasicNameValuePair("actionintime", "11111"));
		paramsHistory.add(new BasicNameValuePair("actionouttime",dateAndTime));
		paramsHistory.add(new BasicNameValuePair("timeinterval", "usersignin"));
		paramsHistory.add(new BasicNameValuePair("terminalid", "usersignin"));
		paramsHistory.add(new BasicNameValuePair("oprstamp", mailId));
		paramsHistory.add(new BasicNameValuePair("ip_remote",iP));
		activityHistoryApiCall.getHistory(closeableHttpClientHistory, httpPostHistory, paramsHistory);
	        CloseableHttpResponse closeableHttpResponse = null;
	        CloseableHttpClient httpclient = HttpClients.createDefault();
	            HttpPost httpPost = new HttpPost(walletOpenUrl);
	            System.out.println(oAddBankAccountForm.getBankName());
	         System.out.println(oAddBankAccountForm.getAccountNo());
	         //Map<String,Object> dateValue = new HashMap<String,Object>();
	            List<NameValuePair> params = new ArrayList<>();
	           params.add(new BasicNameValuePair("api_pass","addwallet"));
	           params.add(new BasicNameValuePair("walletid",""));
	           params.add(new BasicNameValuePair("opendate",reportDate));
	           params.add(new BasicNameValuePair("curcde","BDT"));
	           params.add(new BasicNameValuePair("curbal","0"));
	           params.add(new BasicNameValuePair("blkamt","0"));
	           params.add(new BasicNameValuePair("status","Y"));
	           params.add(new BasicNameValuePair("statusdat",""));
	           params.add(new BasicNameValuePair("terminalid","Y"));
	           params.add(new BasicNameValuePair("clsdat",""));
	           params.add(new BasicNameValuePair("oprstamp",userID));
	           params.add(new BasicNameValuePair("cuscode",cusCode));
	      //     params.add(new BasicNameValuePair("timestamp",reportDate));
	            //params.add((NameValuePair) dateValue.put("timstamp", date));
	            try {
	            	httpPost.setEntity(new UrlEncodedFormEntity(params));
	                closeableHttpResponse = httpclient.execute(httpPost);
	                String responseString = EntityUtils.toString(closeableHttpResponse.getEntity(),"UTF-8");
	                System.out.println("Response ===== >>>>> "+responseString);
	                JSONObject json = new JSONObject(responseString);
	    			responseCode = json.getString("Response_Code");
	    			responseStatus = json.getString("Response_Status");





	                //String DataResponse = responseString.replace("[", "").replace("]", "");
	       //     result += responseBody;

	         //       System.out.println("Response ===== >>>>> "+closeableHttpResponse);

	        }catch(Exception e){

	        	e.printStackTrace();

	        } finally {
	            httpclient.close();
	        }
	        	if(responseStatus.equals("0")){
	        		session.setAttribute("WalletOpenErrorMessage",responseStatus);
	        		  return "walletopennew";
            	}
	        	else
	        	{
	        		session.setAttribute("WalletOpenErrorMessage",responseStatus);
	        		 return "walletopennew";
	        	}

	        	}
    @RequestMapping(value= "/executewalletopen12")
   	public String walletopen(Model model, HttpServletRequest request,@ModelAttribute("oWalletOpenForm") WalletOpenForm oWalletOpenForm, HttpServletResponse response) throws IOException { HttpSession session = request.getSession(true);

   	String appServerIp = (String) session.getAttribute("AppServerIp");
   	DateFormat df = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
	Date today = Calendar.getInstance().getTime();
	String userID = (String) session.getAttribute("GSMAILID");
	String reportDate = df.format(today);
	CloseableHttpResponse closeableHttpResponse = null;
		String serverIp =(String) session.getAttribute("TESTURL");
		String walletOpenUrl= serverIp+"/ERAPAY/walletOpen.do";
		String userActivityServerUrl= serverIp+"/ERAPAY/userActivityHistory.do";
    CloseableHttpClient httpclient = HttpClients.createDefault();
           HttpPost httpPost = new HttpPost(walletOpenUrl);
           List<NameValuePair> params = new ArrayList<>();
           params.add(new BasicNameValuePair("api_pass","addwallet"));
           params.add(new BasicNameValuePair("walletid","001"));
           params.add(new BasicNameValuePair("opendate","Gen"));
           params.add(new BasicNameValuePair("curcde","BDT"));
           params.add(new BasicNameValuePair("cuscod",""));
           params.add(new BasicNameValuePair("curbal","0"));
           params.add(new BasicNameValuePair("blkamt","0"));
           params.add(new BasicNameValuePair("status","Y"));
           params.add(new BasicNameValuePair("statusdat",""));
           params.add(new BasicNameValuePair("terminalid","Y"));
           params.add(new BasicNameValuePair("clsdat",""));
           params.add(new BasicNameValuePair("oprstamp",userID));
           params.add(new BasicNameValuePair("timstamp",reportDate));


           try {
           	httpPost.setEntity(new UrlEncodedFormEntity(params));
               closeableHttpResponse = httpclient.execute(httpPost);
      //     result += responseBody;
               String responseString = EntityUtils.toString(closeableHttpResponse.getEntity(),"UTF-8");
               System.out.println("Response ===== >>>>> "+responseString);

       }catch(Exception e){

       	e.printStackTrace();

       } finally {
           httpclient.close();
       }
   		 return "users/walletopennew";
   	}
}
