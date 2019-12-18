package com.era.erapay.login;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.era.erapay.SignUp.SignUpFormBean;
import com.era.erapay.common.ActivityHistoryApiCall;
import com.era.erapay.common.ApiUrl;
import com.era.erapay.common.CommonBean;
import com.era.erapay.common.IpFinder;
import com.era.erapay.wallet.WalletToWalletForm;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import  com.era.erapay.KYC.KycForm;
@Controller
public class LoginController {
	@Autowired
	CommonBean bean;

	IpFinder ipFinder =new IpFinder();
	ActivityHistoryApiCall activityHistoryApiCall=new ActivityHistoryApiCall();
	DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh.mm.ss  aa");
	Date today = Calendar.getInstance().getTime();
	String dateAndTime = df.format(today);
	String walletCurrencyResponseCode="";
	private final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@RequestMapping(value = "/login")
	public String Login(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		//String appServerIp = (String) session.getAttribute("AppServerIp");
		System.out.println("IP FrOm PROPERTY"+bean.getServerIp());
		String eraPayServerIp=bean.getServerIp();
		//System.out.println("Ip"+appServerIp);
		logger.debug("Login()");
		session.setAttribute("KYCHOMEFIELD", " ");
		session.setAttribute("USERINFORESPONSEADDRESS", " ");
		session.setAttribute("USERINFORESPONSEINTRODUCER", " ");
		session.setAttribute("KYCMessage", "");
		session.setAttribute("transactionList", null);
		session.setAttribute("LoginMessage", " ");
		session.setAttribute("SignUpMessage", " ");
		session.setAttribute("KYCUPDATEMESSAGE", " ");
		session.setAttribute("USERINFORESPONSE", " ");
		session.setAttribute("KYCMessage", " ");
		session.setAttribute("LoadFundMessage", "");
		session.setAttribute("KYCMessage", "");
		session.setAttribute("LOADFUNDAMOUNT","");
		session.setAttribute("LOADFUNDACCOUNT", "");
		session.setAttribute("LOADFUNDACCOUNTTITTLE", "");
		session.setAttribute("LoadFundMessage", "");
		session.setAttribute("message", "");
		session.setAttribute("GSMAILID", "");
		session.setAttribute("photoemailid","");
		session.setAttribute("USERMOBILENO","");
		session.setAttribute("CUSCODE", "");
		session.setAttribute("LoginWalletId", "");
		session.setAttribute("WALLETBALANCE","");
		session.setAttribute("LoginMessage", "");
		session.setAttribute("PINCODEMESSAGE"," ");
		session.setAttribute("wallettomerchantpaymentMsg", "");
		session.setAttribute("GSSESSION", "");
		session.setAttribute("PINCODEMESSAGE"," ");
		session.setAttribute("CHANGEPASSWORDMESSAGE", " ");
		session.setAttribute("PasswordRecovery"," ");
		session.setAttribute("SignUpMessage", "");
		session.setAttribute("Talktimemsg"," ");
		session.setAttribute("WalletOpenErrorMessage","");
		session.setAttribute("CURWALLETBALANCE"," ");
		session.setAttribute("LOADFUNDAMOUNT", "");
		session.setAttribute("WALLETAMOUNT","");
		session.setAttribute("WALLETIDCREDIT", "");
		session.setAttribute("WALLETNarration","");
		session.setAttribute("WalletMsg", "");
		session.setAttribute("LoginMessage", "");
		session.setAttribute("KYCUPDATEMESSAGE", " ");
		session.setAttribute("transactionList", null);
		session.setAttribute("LoginMessage", " ");
		session.setAttribute("SignUpMessage", " ");
		session.setAttribute("photoemailid","");
		session.setAttribute("USERMOBILENO","");
		session.setAttribute("CUSCODE", "");
		session.setAttribute("LoginWalletId", "");
		session.setAttribute("WALLETBALANCE","");
		session.setAttribute("GSUSERNAME", "");
        session.setAttribute("RequestCount", " ");
		String url="http://"+eraPayServerIp;
		System.out.println("url"+url);
		session.setAttribute("TESTURL",url);
		System.out.println("testloginlogincontroller"+url);
		return "testlogin";




	}
	@RequestMapping(value = "/home")
	public String TestHOme(HttpServletRequest request, HttpServletResponse response, Model model,
						   @ModelAttribute("oKycForm") KycForm oKycForm) throws Exception {
		ApiUrl oapiUrl=new ApiUrl();
		String loginapi=oapiUrl.getApiUri();
        KycForm oKycFormlist =new KycForm();
		//System.out.println("NEW CAll"+apiUrl1.getApiUri());
		HttpSession session = request.getSession(true);
		String appServerIp = (String) session.getAttribute("AppServerIp");
		String serverIp =(String) session.getAttribute("TESTURL");
		System.out.println("Ip"+appServerIp);
		String cusCode = (String) session.getAttribute("CUSCODE");
		session.setAttribute("KYCUPDATEMESSAGE", " ");
		String walletID = (String) session.getAttribute("LoginWalletId");
		session.setAttribute("transactionList", null);
		logger.debug("Login()");
		session.setAttribute("LoginMessage", "");
		String iP=ipFinder.getIp(request);
		String sessionID= (String) session.getAttribute("SESSIONID");
		String mailId= (String) session.getAttribute("photoemailid");
		CloseableHttpClient closeableHttpClientHistory = HttpClients.createDefault();
		String apiUrl="/erapay/testhome";
		String userActivityServerUrl= serverIp+"/ERAPAY/userActivityHistory.do";
		String serverUrl= serverIp+"/ERAPAY/userAccountCurrentBalance.do";
		HttpPost httpPostHistory = new HttpPost(userActivityServerUrl);
		session.setAttribute("KYCMessage", "");
		List<NameValuePair> paramsHistory = new ArrayList<NameValuePair>();
		paramsHistory.add(new BasicNameValuePair("api_pass", "history"));
		paramsHistory.add(new BasicNameValuePair("userid", mailId));
		paramsHistory.add(new BasicNameValuePair("sessionid", sessionID));
		paramsHistory.add(new BasicNameValuePair("actionname", apiUrl));
		paramsHistory.add(new BasicNameValuePair("actionTime",dateAndTime ));
		paramsHistory.add(new BasicNameValuePair("actionouttime",""));
		paramsHistory.add(new BasicNameValuePair("timeinterval", "usersignin"));
		paramsHistory.add(new BasicNameValuePair("terminalid", "usersignin"));
		paramsHistory.add(new BasicNameValuePair("oprstamp", oKycForm.getMailId()));
		paramsHistory.add(new BasicNameValuePair("timestamp",dateAndTime));
		paramsHistory.add(new BasicNameValuePair("ip_remote",iP));
		System.out.println("Response ===== >>>>> " + oKycForm.getMailId());
		System.out.println("Response ===== >>>>> " + oKycForm.getPassword());
		activityHistoryApiCall.getHistory(closeableHttpClientHistory, httpPostHistory, paramsHistory);
		CloseableHttpResponse closeableHttpResponse1 = null;
		String tranHistoryUrl= serverIp+"/ERAPAY/getTransactionHistory.do";
		CloseableHttpClient httpclient1 = HttpClients.createDefault();
		HttpPost httpPost1 = new HttpPost(tranHistoryUrl);
		List<NameValuePair> params1 = new ArrayList<NameValuePair>();
		params1.add(new BasicNameValuePair("api_pass", "tranhistory"));
		System.out.println("wallid" + walletID);
		params1.add(new BasicNameValuePair("walletid", walletID));
		try {
			httpPost1.setEntity(new UrlEncodedFormEntity(params1));
			closeableHttpResponse1 = httpclient1.execute(httpPost1);
			String responseString1 = EntityUtils.toString(closeableHttpResponse1.getEntity(), "UTF-8");
			System.out.println("Response ===== >>>>> " + responseString1);
            JSONArray itemArray=new JSONArray(responseString1);
            System.out.println("Array ===== >>>>> " + itemArray.length());
            ArrayList<KycForm> listOfResponse = new ArrayList<KycForm>();
            for (int i = 0; i < itemArray.length(); i++) {
                //System.out.println("valu of  i" +i );
				KycForm kycList = new KycForm();
                JSONArray nesteditemArray= itemArray.getJSONArray(i);
                System.out.println("nesteditemArray ===== >>>>> " + nesteditemArray);
				for (int j =0; j < nesteditemArray.length(); j++) {
					String date= nesteditemArray.getString(0);
					kycList.setTrandat(date);
					//System.out.println("Value" + date );
					String walletId = nesteditemArray.getString(1);
					kycList.setWalletID(walletId);
					System.out.println("Value 1" + itemArray.length() );
					Number amount = nesteditemArray.getNumber(2);
					NumberFormat formatter = new DecimalFormat("#0.00");
					String formattedwalletCurrency=formatter.format(amount);
					kycList.setTrnamt1(formattedwalletCurrency);
					String docType = nesteditemArray.getString(3);
					kycList.setDocType(docType);
					String  narration=nesteditemArray.getString(4);
					kycList.setNarration(narration);
					// String username_FromJson = nesteditemArray.getString(j);
				}
				listOfResponse.add(kycList);
            }
            oKycForm.setTransctionHistoryList(listOfResponse);
		} catch (Exception e) {
			e.printStackTrace();
		}
		CloseableHttpResponse walletCurcloseableHttpResponse = null;
		CloseableHttpClient walletCurhttpclient = HttpClients.createDefault();
        //String url= serverTestUrl+"/ERAPAY/userAccountCurrentBalance.do";
        //HttpPost httpPost = new HttpPost("http://10.11.201.169:8080/ERAPAY/signInRest.do");
        //HttpPost walletCurhttpclienthttpPost = new HttpPost(url);


		HttpPost walletCurhttpclienthttpPost = new HttpPost(serverUrl);
		List<NameValuePair> walletCurhttpclienthttpPostparams = new ArrayList<>();
		//Map<String,Object> dateValue = new HashMap<String,Object>()
		// params.add(new BasicNameValuePair("action","addbank"));
		walletCurhttpclienthttpPostparams.add(new BasicNameValuePair("api_pass", "currentbalance"));
		walletCurhttpclienthttpPostparams.add(new BasicNameValuePair("walletid", walletID));
		//params.add((NameValuePair) dateValue.put("timstamp", date));
		try {
			walletCurhttpclienthttpPost.setEntity(new UrlEncodedFormEntity(walletCurhttpclienthttpPostparams));
			walletCurcloseableHttpResponse = walletCurhttpclient.execute(walletCurhttpclienthttpPost);
			String responseString = EntityUtils.toString(walletCurcloseableHttpResponse.getEntity(), "UTF-8");
			System.out.println("Response  WALLET===== >>>>> " + responseString);
			JSONObject json = new JSONObject(responseString);
			walletCurrencyResponseCode = json.getString("Response_Code");
			String walletCurrency = json.getString("Current_Balance");
			NumberFormat formatter = new DecimalFormat("#0.00");
			//String formattedwalletCurrency=formatter.format(walletCurrency);
			System.out.println("Response ===== >>>>> " + walletCurrency);
			session.setAttribute("CURWALLETBALANCE",walletCurrency);
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			walletCurhttpclient.close();
		}


		DateFormat df = new SimpleDateFormat("dd-MM-yyyy ");
		Date today = Calendar.getInstance().getTime();
		String reportDate = df.format(today);
		CloseableHttpResponse  closeableHttpClientMenuHttpResponse = null;
		CloseableHttpClient closeableHttpClientMenu = HttpClients.createDefault();
		String userWiseMainMenuUrl= serverIp+"/ERAPAY/userWiseMainMenu.do";
		HttpPost httpPostMenu = new HttpPost(userWiseMainMenuUrl);
		session.setAttribute("KYCMessage", "");
		List<NameValuePair> parammenuHistory = new ArrayList<NameValuePair>();
		parammenuHistory.add(new BasicNameValuePair("api_pass", "usermainmenu"));
		parammenuHistory.add(new BasicNameValuePair("current_Date", reportDate));
		try {
			httpPostMenu.setEntity(new UrlEncodedFormEntity(parammenuHistory));
			closeableHttpClientMenuHttpResponse = closeableHttpClientMenu.execute(httpPostMenu);
			String responseString = EntityUtils.toString(closeableHttpClientMenuHttpResponse.getEntity(), "UTF-8");
			System.out.println("Response ===== >>>>> " + responseString);

			JSONArray itemArray=new JSONArray(responseString);
			System.out.println("Array ===== >>>>> " + itemArray.length());
			ArrayList<KycForm> menulistOfResponse = new ArrayList<KycForm>();
			for (int i = 0; i < itemArray.length(); i++) {
				//System.out.println("valu of  i" +i );
				KycForm menuList = new KycForm();
				JSONArray nesteditemArray= itemArray.getJSONArray(i);
				System.out.println("nesteditemArray ===== >>>>> " + nesteditemArray);
				for (int j =0; j < nesteditemArray.length(); j++) {
					String menuId= nesteditemArray.getString(0);
					menuList.setMenuId(menuId);
					System.out.println("Value" + menuId );
					String menuName = nesteditemArray.getString(1);
					menuList.setMenuName(menuName);
					System.out.println("Value" + menuName );
					String menuLink = nesteditemArray.getString(2);
					System.out.println("Value" + menuLink);
					menuList.setMenuLink(menuLink);
					  // String username_FromJson = nesteditemArray.getString(j);
				}
				menulistOfResponse.add(menuList);
			}
            oKycFormlist.setListOfMenuList(menulistOfResponse);
			session.setAttribute("KycFormmMenuList",oKycFormlist);


		} catch (Exception e) {
			e.printStackTrace();
		}
		return "HomeScreenWallet";
	}
	@RequestMapping(value = "/erapay/testlogin")
	public String TestLogin(HttpServletRequest request, HttpServletResponse response, Model model,
							@ModelAttribute("oKycForm") KycForm oKycForm) throws Exception {
		IpFinder ipFinder=new IpFinder();
        String iP=ipFinder.getIp(request);

		HttpSession session = request.getSession(true);
		logger.debug("Login()");
		System.out.println("I am in testlogin page");
		String serverIp =(String) session.getAttribute("TESTURL");
		System.out.println("LoginIPTETS"+serverIp);
		String appServerIp = (String) session.getAttribute("AppServerIp");
		System.out.println("Ip"+appServerIp);
		session.setAttribute("KYCUPDATEMESSAGE", " ");
		session.setAttribute("transactionList", " ");
		session.setAttribute("LoginMessage", " ");
		session.setAttribute("SignUpMessage", " ");
		session.setAttribute("photoemailid", null);
		session.setAttribute("USERMOBILENO","");
		session.setAttribute("SESSIONID"," ");
		session.setAttribute("WALLETBALANCE"," ");
		String userType=" ";
		LoginFormBean oLogInForm = new LoginFormBean();
		String responseCode = " ";
		String responseStatus = "";
		String userName = "";
		String sessionID = "";
		String cusCode = " ";
		String walletID =  " ";
		String mobileNo = "";
		String currentBalance = "";
		int errorexeception = 0;
		CloseableHttpResponse closeableHttpResponse = null;
		CloseableHttpClient httpclient = HttpClients.createDefault();
        String serverUrl= serverIp+"/ERAPAY/signInRest.do";
		System.out.println("HOST"+serverUrl);
        System.out.println("testloginIP"+serverUrl);
        HttpPost httpPost = new HttpPost(serverUrl);
      //  HttpPost httpPost = new HttpPost(url);
		session.setAttribute("KYCMessage", "");
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("api_pass", "usersignin"));
		params.add(new BasicNameValuePair("emailid", oKycForm.getMailId()));
		params.add(new BasicNameValuePair("password", oKycForm.getPassword()));
		try {
			httpPost.setEntity(new UrlEncodedFormEntity(params));
			closeableHttpResponse = httpclient.execute(httpPost);
			errorexeception = closeableHttpResponse.getStatusLine().getStatusCode();
			System.out.println("ERORRRRRRRRR" + errorexeception);
			String responseString = EntityUtils.toString(closeableHttpResponse.getEntity(), "UTF-8");
			System.out.println("ERORRRRRRRRR" + responseString);
			JSONObject json = new JSONObject(responseString);
			responseCode = json.getString("Response_Code");
			responseStatus = json.getString("Response_Status");
			if (responseCode.equals("2")) {
				userType=json.getString("usertype");
				userName=json.getString("User_Name");
				session.setAttribute("GSUSERNAME", userName);
				System.out.println("UserType"+userType);
				oLogInForm.setErrorCode(responseCode);
				session.setAttribute("USERTYPE",userType);
			}
			if (responseCode.equals("0")) {
				session.setAttribute("USERTYPE",userType);
				userType=json.getString("usertype");
				userName = json.getString("User_Name");
				cusCode = json.getString("CusCode");
				walletID = json.getString("Wallet_ID");
				responseCode = json.getString("Response_Code");
				String currentBalance1 = json.getString("current_Bal");
				long requestCount= json.getLong("requestcount");
				String requestCount1= String.valueOf(requestCount);
				//double d = Double.parseDouble(currentBalance);
				sessionID=json.getString("Session");
				session.setAttribute("photoemailid", oKycForm.getMailId());
				session.setAttribute("USERMOBILENO", mobileNo);
				session.setAttribute("CUSCODE", cusCode);
				session.setAttribute("SESSIONID",sessionID);
				session.setAttribute("LoginWalletId", walletID);
				session.setAttribute("WALLETBALANCE", currentBalance1);
                session.setAttribute("RequestCount", requestCount1);
				// sessionID =parts[3];
			}
			session.setAttribute("GSSESSION", sessionID);
			oLogInForm.setErrorCode(responseCode);
		}
		catch (Exception e) {
			e.printStackTrace();
		} finally {
            httpclient.close();
        }
		CloseableHttpClient closeableHttpClientHistory = HttpClients.createDefault();
		String userActivityServerUrl= serverIp+"/ERAPAY/userActivityHistory.do";
		String signInApiUrl="/erapay/testlogin";
		HttpPost httpPostHistory = new HttpPost(userActivityServerUrl);
		session.setAttribute("KYCMessage", "");
		List<NameValuePair> paramsHistory = new ArrayList<NameValuePair>();
		paramsHistory.add(new BasicNameValuePair("api_pass", "history"));
		paramsHistory.add(new BasicNameValuePair("userid", oKycForm.getMailId()));
		paramsHistory.add(new BasicNameValuePair("sessionid", sessionID));
		paramsHistory.add(new BasicNameValuePair("actionname", signInApiUrl));
		paramsHistory.add(new BasicNameValuePair("actionTime",dateAndTime ));
		paramsHistory.add(new BasicNameValuePair("actionouttime",""));
		paramsHistory.add(new BasicNameValuePair("timeinterval", "usersignin"));
		paramsHistory.add(new BasicNameValuePair("terminalid", "usersignin"));
		paramsHistory.add(new BasicNameValuePair("oprstamp", oKycForm.getMailId()));
		paramsHistory.add(new BasicNameValuePair("timestamp",dateAndTime));
		paramsHistory.add(new BasicNameValuePair("ip_remote",iP));
		System.out.println("Response ===== >>>>> " + oKycForm.getMailId());
		System.out.println("Response ===== >>>>> " + oKycForm.getPassword());
		activityHistoryApiCall.getHistory(closeableHttpClientHistory, httpPostHistory, paramsHistory);
		String cuscode = (String) session.getAttribute("CUSCODE");
		System.out.println("CusCOde" + cuscode);
		if (oLogInForm.getErrorCode().equals("0")) {
			session.setAttribute("KYCHOMEFIELD", "LOGIN");
			session.setAttribute("GSMAILID", oKycForm.getMailId());
			// session.setAttribute("sErrorMessage",
			// oMenuGenarationBO.getErrorMessage());
			session.setAttribute("LoginMessage", responseStatus);
			session.setAttribute("GSUSERNAME", userName);
			return "OTP";
		}
		else if (oLogInForm.getErrorCode().equals("1")) {
			// session.setAttribute("sErrorMessage",
			// oMenuGenarationBO.getErrorMessage());
			session.setAttribute("LoginMessage", responseStatus);
			return "testlogin";
		} else if (oLogInForm.getErrorCode().equals("2") ) {

			session.setAttribute("GSMAILID", oKycForm.getMailId());
			session.setAttribute("KYCMessage", "Please Fill Up Kyc Form");
			if(userType.equals("C"))
			{
				return "BuisnessKyc";
			}
			else if(userType.equals("P"))
			{

				return "kycnew";
			}
			return "kycnew";
		} else if (errorexeception > 0) {
			session.setAttribute("GSMAILID", oKycForm.getMailId());
			session.setAttribute("KYCMessage", "Please Fill Up Kyc Form");
			return "error";
		} else {
			// session.setAttribute("sErrorMessage",
			// oMenuGenarationBO.getErrorMessage());
			session.setAttribute("GSMAILID", oKycForm.getMailId());
			session.setAttribute("KYCMessage", "Please Fill Up Kyc Form");
			return "error";
		}
	}

	/*
	@RequestMapping(value = "/home", method = RequestMethod.POST)
	public String Home(HttpServletRequest request, HttpServletResponse response, Model model,
					   @ModelAttribute("oKycForm") KycForm oKycForm) throws Exception {
		LoginFormBean oLogInForm = new LoginFormBean();
		HttpSession session = request.getSession(true);
		String responseCode = "";
		String responseStatus = "";
		String userName = "";
		String sessionID = "";
		String cusCode = "";
		String walletID = "";
		String mobileNo = "";
		String currentBalance = "";
		String iP=ipFinder.getIp(request);
		CloseableHttpResponse closeableHttpResponse = null;
		CloseableHttpClient httpclient = HttpClients.createDefault();
		HttpPost httpPost = new HttpPost("http://10.11.201.169:8080/ERAPAY/signInRest.do");
		session.setAttribute("KYCMessage", "");
		String appServerIp = (String) session.getAttribute("AppServerIp");
		System.out.println("Ip"+appServerIp);
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("api_pass", " ignin"));
		params.add(new BasicNameValuePair("emailid", oKycForm.getMailId()));
		params.add(new BasicNameValuePair("password", oKycForm.getPassword()));
		System.out.println("Response ===== >>>>> " + oKycForm.getMailId());
		System.out.println("Response ===== >>>>> " + oKycForm.getPassword());
		try {
			httpPost.setEntity(new UrlEncodedFormEntity(params));
			closeableHttpResponse = httpclient.execute(httpPost);
			String responseString = EntityUtils.toString(closeableHttpResponse.getEntity(), "UTF-8");
			JSONObject json = new JSONObject(responseString);
			responseCode = json.getString("Response_Code");
			responseStatus = json.getString("Response_Status");
			if (responseCode.equals("0")) {
				userName = json.getString("User_Name");
				cusCode = json.getString("User_Name");
				walletID = json.getString("Wallet_ID");
				responseCode = json.getString("Response_Code");
				currentBalance = json.getString("Response_Code");
				session.setAttribute("CUSCODE", cusCode);
				session.setAttribute("LoginWalletId", walletID);
				// sessionID =parts[3];
			}
			session.setAttribute("GSSESSION", sessionID);
			oLogInForm.setErrorCode(responseCode);
		}

		catch (Exception e) {
			e.printStackTrace();

		} finally {
			httpclient.close();
		}
		CloseableHttpResponse closeableHttpResponseHistory = null;
		CloseableHttpClient closeableHttpClientHistory = HttpClients.createDefault();
		String signInApiUrl="http://10.11.201.169:8080/ERAPAY/signInRest.do";
		HttpPost httpPostHistory = new HttpPost("http://10.11.201.169:8080/ERAPAY/userActivityHistory.do");
		session.setAttribute("KYCMessage", "");
		String sessionId= (String) session.getAttribute("SESSIONID");
		List<NameValuePair> paramsHistory = new ArrayList<NameValuePair>();
		paramsHistory.add(new BasicNameValuePair("api_pass", "history"));
		paramsHistory.add(new BasicNameValuePair("userid", oKycForm.getMailId()));
		paramsHistory.add(new BasicNameValuePair("sessionid", sessionId));
		paramsHistory.add(new BasicNameValuePair("actionname", signInApiUrl));
		paramsHistory.add(new BasicNameValuePair("actionintime", "11111"));
		paramsHistory.add(new BasicNameValuePair("actionouttime",dateAndTime));
		paramsHistory.add(new BasicNameValuePair("timeinterval", "usersignin"));
		paramsHistory.add(new BasicNameValuePair("terminalid", "usersignin"));
		paramsHistory.add(new BasicNameValuePair("oprstamp", oKycForm.getMailId()));
		paramsHistory.add(new BasicNameValuePair("ip_remote",iP));
		System.out.println("Response ===== >>>>> " + oKycForm.getMailId());
		System.out.println("Response ===== >>>>> " + oKycForm.getPassword());
		activityHistoryApiCall.getHistory(closeableHttpClientHistory, httpPostHistory, paramsHistory);
		String cuscode = (String) session.getAttribute("CUSCODE");
		System.out.println("CusCOde" + cuscode);
		if (oLogInForm.getErrorCode().equals("0")) {
			// session.setAttribute("sErrorMessage",
			// oMenuGenarationBO.getErrorMessage());
			session.setAttribute("LoginMessage", responseCode);
			session.setAttribute("GSUSERNAME", responseStatus);
			session.setAttribute("GSUSERMOBILE", mobileNo);
			session.setAttribute("GSMAILID", oKycForm.getMailId());
			CloseableHttpResponse closeableHttpResponse1 = null;
			CloseableHttpClient httpclient1 = HttpClients.createDefault();
			HttpPost httpPost1 = new HttpPost("http://10.11.201.169:8080/ERAPAY/getTransactionHistory.do");

			List<NameValuePair> params1 = new ArrayList<NameValuePair>();
			params1.add(new BasicNameValuePair("api_pass", "tranhistory"));
			try {
				httpPost1.setEntity(new UrlEncodedFormEntity(params1));
				closeableHttpResponse1 = httpclient1.execute(httpPost1);
				String responseString1 = EntityUtils.toString(closeableHttpResponse1.getEntity(), "UTF-8");
				System.out.println("Response ===== >>>>> " + responseString1);
				StringTokenizer multiTokenizer = new StringTokenizer(responseString1, ",");
				ArrayList<KycForm> listOfResponse = new ArrayList<KycForm>();
				int i = 0;
				KycForm oKycForm1 = new KycForm();

				while (multiTokenizer.hasMoreTokens()) {
					String elem = multiTokenizer.nextToken();
					elem = elem.replace("[", "").replace("]", "").replace("\"", "");
					System.out.println("elem1111===>> " + elem);
					if (i % 4 == 0)
						oKycForm1.setTrandat(elem.toString());
					else if (i % 4 == 1)
						oKycForm1.setWalletID(elem);
					else if (i % 4 == 2)
						oKycForm1.setTrnamt1(elem);
					else if (i % 4 == 3) {
						oKycForm1.setDocType(elem);
						listOfResponse.add(oKycForm1);
						oKycForm1 = new KycForm();
					}
					++i;
				}
				oKycForm.setTransctionHistoryList(listOfResponse);
				session.setAttribute("transactionList", listOfResponse);

			} catch (Exception e) {
				e.printStackTrace();
			}
			CloseableHttpResponse closeableHttpResponse2 = null;
			CloseableHttpClient httpclient2 = HttpClients.createDefault();

			HttpPost httpPost2 = new HttpPost("http://10.11.201.169:8080/ERAPAY/getUserImage.do");
			String userID = (String) session.getAttribute("GSMAILID");
			List<NameValuePair> params2 = new ArrayList<NameValuePair>();
			// Map<String,Object> dateValue = new HashMap<String,Object>()
			// params.add(new BasicNameValuePair("action","addbank"));
			params2.add(new BasicNameValuePair("api_pass", "image"));
			params2.add(new BasicNameValuePair("user_ID", userID));
			System.out.println(params2);

			// params.add((NameValuePair) dateValue.put("timstamp", date));

			try {
				httpPost2.setEntity(new UrlEncodedFormEntity(params2));
				// httpPost2.getRequestLine().get
				closeableHttpResponse2 = httpclient2.execute(httpPost2);
				String responseString2 = EntityUtils.toString(closeableHttpResponse2.getEntity(), "UTF-8");
				System.out.println("Response ===== >>>>> " + responseString2);
				String[] parts = responseString2.split(",");
				responseStatus = parts[0];
				String image = parts[1];
				System.out.println(image);
				byte[] data64 = Base64.getDecoder().decode(image);
				File file12 = new File("D:/images/" + cuscode + ".jpg");
				FileOutputStream fileOutputStream = new FileOutputStream(file12);
				fileOutputStream.write(data64);
				fileOutputStream.close();
				String base64Image = Base64.getEncoder().encodeToString(data64);
				oKycForm.setImage(base64Image);
				System.out.println("image" + base64Image);
				/*
				 * byte[] byteData = image.getBytes(); BufferedImage img = null;
				 * ByteArrayInputStream bis = new
				 * ByteArrayInputStream(byteData); BufferedImage bImage2 =
				 * ImageIO.read(bis); URL url = new
				 * URL("http://www.mkyong.com/image/mypic.jpg"); img =
				 * ImageIO.read(url); ImageIO.write(img, "jpg", new
				 * File("D:\\output.jpg") );
				 */
				// String DataResponse = responseString.replace("[",
				// "").replace("]", "");
				// result += responseBody;
				// System.out.println("Response ===== >>>>>
				// "+closeableHttpResponse);
/*
			} catch (Exception e) {

				e.printStackTrace();

			} finally {
				httpclient.close();
			}
			return "HomeScreenWallet";
		}

		else if (oLogInForm.getErrorCode().equals("1")) {
			// session.setAttribute("sErrorMessage",
			// oMenuGenarationBO.getErrorMessage());
			session.setAttribute("LoginMessage", responseStatus);
			return "paymentlogin";
		} else if (oLogInForm.getErrorCode().equals("2")) {
			session.setAttribute("GSMAILID", oKycForm.getMailId());
			session.setAttribute("CUSCODE", cusCode);
			session.setAttribute("KYCMessage", "Please Fill Up Kyc Form");
			return "kycnew";
		} else {
			// session.setAttribute("sErrorMessage",
			// oMenuGenarationBO.getErrorMessage());
			session.setAttribute("GSMAILID", oKycForm.getMailId());
			session.setAttribute("KYCMessage", "Please Fill Up Kyc Form");
			return "kycnew";
		}
	}
	/*

	@RequestMapping(value = "/home1")
	public String executehome(Model model, HttpServletRequest request, HttpServletResponse response,
							  @ModelAttribute("oLogInForm") LoginFormBean oLogInForm) throws IOException {
		HttpSession session = request.getSession(true);
		String appServerIp = (String) session.getAttribute("AppServerIp");
		System.out.println("Ip"+appServerIp);
		CloseableHttpResponse closeableHttpResponse = null;
		CloseableHttpClient httpclient = HttpClients.createDefault();
		HttpPost httpPost = new HttpPost("http://10.11.201.169:8080/ERAPAY/getTransactionHistory.do");
		String outMessage = "";
		String outCode = "";
		DateFormat df = new SimpleDateFormat("dd-MM-yyyy ");
		Date today = Calendar.getInstance().getTime();
		String reportDate = df.format(today);
		System.out.println("DATE" + reportDate);
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("api_pass", "tranhistory"));
		try {
			httpPost.setEntity(new UrlEncodedFormEntity(params));
			closeableHttpResponse = httpclient.execute(httpPost);
			String responseString = EntityUtils.toString(closeableHttpResponse.getEntity(), "UTF-8");
			System.out.println("Response ===== >>>>> " + responseString);
			StringTokenizer multiTokenizer = new StringTokenizer(responseString, ",");
			ArrayList<LoginFormBean> listOfResponse = new ArrayList<LoginFormBean>();
			int i = 0;
			LoginFormBean oLoginFormBean = new LoginFormBean();
			while (multiTokenizer.hasMoreTokens()) {
				String elem = multiTokenizer.nextToken();
				elem = elem.replace("[", "").replace("]", "").replace("\"", "");
				// System.out.println("elem1111===>> "+elem);
				if (i % 4 == 0)
					oLoginFormBean.setWalletID(elem);
				else if (i % 4 == 1)
					oLoginFormBean.setDocType(elem);
				else if (i % 4 == 2) {
					oLoginFormBean.setTrandat(elem.toString());
				} else if (i % 4 == 3) {
					oLoginFormBean.setTrnamt(elem.toString());
					oLoginFormBean.setTrandat(elem.toString());
					listOfResponse.add(oLoginFormBean);
					oLoginFormBean = new LoginFormBean();
				}
				++i;
			}
			oLogInForm.setTransctionHistoryList(listOfResponse);
			session.setAttribute("transactionList", listOfResponse);
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			httpclient.close();
		}
		return " /HomeScreenWallet";
	}



	@RequestMapping(value = "homescreenwallet")
	public String Homescreenwallet(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		logger.debug("addbankaccount()");
		return "HomeScreenWallet";
	}
	/*
	 * @RequestMapping(value = "/executeaddbankaccountinfo") public String
	 * Executeaddbankaccountinfo(Model model,
	 *
	 * @ModelAttribute("oSignUpFormBean") SignUpFormBean oSignUpFormBean,
	 * HttpServletRequest request, SessionStatus status, HttpServletResponse
	 * response) throws Exception { HttpSession session =
	 * request.getSession(true); System.out.println("Name95656564 ");
	 * oAddBankAccountBO =
	 * oAddBankAccountDAO.getAddBankAccountInfo(oAddBankAccountForm.getEmail());
	 * if (oAddBankAccountBO.getErrorCode()==0) {
	 * //session.setAttribute("sErrorMessage",
	 * oMenuGenarationBO.getErrorMessage()); return " /kyc"; } else {
	 * System.out.println("Name95656564 =====>>>>>>> "); // sSuccess =
	 * sFatalErrorAction; // System.out.println("Name95656564 =====>>>>>>> " +
	 * // oAdminUserProfileBo.getEmail()); return " /MenuGenaration"; } }
	 */
	@RequestMapping(value = "/index")
	public String Sign(Model model, HttpServletRequest request, HttpServletResponse response) throws UnknownHostException {
		HttpSession session = request.getSession(true);
		logger.debug("Login()");
		InetAddress inetAddress = InetAddress.getLocalHost();
		String eraPayServerIp=bean.getServerIp();
		//String appServerIp= inetAddress.getHostAddress();
		//System.out.println("Host Name:- " + inetAddress.getHostName());
		//session.setAttribute("AppServerIp",appServerIp);
		//System.out.println("AppServerIp "+appServerIp);
		//int localPort=request.getLocalPort();
		// String port = Integer.toString(localPort);
		//System.out.println("Port Test "+localPort);
		//http://10.11.201.169:8080/ERAPAY/getAllBankforRegistration.do
		String url="http://"+eraPayServerIp;
		System.out.println("url"+url);
		session.setAttribute("TESTURL",url);
		return "NewFile";
	}
	@RequestMapping(value = "/transfertobankaccount")
	public String transfertobankaccount(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String appServerIp = (String) session.getAttribute("AppServerIp");
		System.out.println("Ip"+appServerIp);
		logger.debug("addbankaccount()");
		return " /TransferToBankAccount";
	}
	@RequestMapping(value = "/erapay//otptest")
	public String otptest(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession(true);
		String appServerIp = (String) session.getAttribute("AppServerIp");
		System.out.println("Ip"+appServerIp);
		logger.debug("addbankaccount()");
		CloseableHttpResponse closeableHttpResponse = null;
		CloseableHttpClient httpclient = HttpClients.createDefault();
		HttpPost httpPost = new HttpPost("http://203.76.150.133/MissCallAlertAPI/talkTimeMissedCallAlert.do");
		String outMessage = "";
		String outCode = "";
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date today = Calendar.getInstance().getTime();
		String reportDate = df.format(today);
		System.out.println("DATE" + reportDate);
		HashMap<String, String> headerMap = new HashMap<>();
		headerMap.put("api_userid", "himel");
		headerMap.put("api_pass", "123");
		for (Map.Entry<String, String> entry : headerMap.entrySet()) {
			httpPost.addHeader(entry.getKey(), entry.getValue());
		}
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("referenceNo", "123456"));
		params.add(new BasicNameValuePair("mobileNo", "01718836550"));
		try {
			httpPost.setEntity(new UrlEncodedFormEntity(params));
			closeableHttpResponse = httpclient.execute(httpPost);
			String responseString = EntityUtils.toString(closeableHttpResponse.getEntity(), "UTF-8");
			System.out.println("Response");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			httpclient.close();
		}
		return "OTP";
	}
	@RequestMapping(value = "/typeofsignup")
	public String typeofsignup(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String appServerIp = (String) session.getAttribute("AppServerIp");
		System.out.println("Ip"+appServerIp);
		logger.debug("Login()");
		return "TypeOfSignUp";
	}	@RequestMapping(value = "/erapay/testdash")
	public String testdash(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String appServerIp = (String) session.getAttribute("AppServerIp");
		System.out.println("Ip"+appServerIp);
		logger.debug("Login()");
		return "testdash";
	}
	@RequestMapping(value = "/voucher")
	public String voucher(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		return "voucher";
	}
	@RequestMapping(value = "/skrilldash")
	public String skrilldash(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String appServerIp = (String) session.getAttribute("AppServerIp");
		System.out.println("Ip"+appServerIp);
		logger.debug("Login()");
		return "DashSkrillTest";
	}
	@RequestMapping(value = "/faq")
	public String faq(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);	String appServerIp = (String) session.getAttribute("AppServerIp");
		System.out.println("Ip"+appServerIp);

		logger.debug("Login()");
		return "faqtest";
	}
	@RequestMapping(value = "/testsignup")
	public String signupnew (Model model, HttpServletRequest request, HttpServletResponse response,@ModelAttribute("osignUpFormBean")SignUpFormBean osignUpFormBean) {
		HttpSession session = request.getSession(true);
		String appServerIp = (String) session.getAttribute("AppServerIp");
		System.out.println("Ip"+appServerIp);
		logger.debug("Login()");
		return "testsignup";
	}
	@RequestMapping(value = "/loginpage")
	public String loginpage (Model model, HttpServletRequest request, HttpServletResponse response,@ModelAttribute("osignUpFormBean")SignUpFormBean osignUpFormBean) {
		HttpSession session = request.getSession(true);
		String appServerIp = (String) session.getAttribute("AppServerIp");
		System.out.println("Ip"+appServerIp);
		logger.debug("Login()");
		return "loginpage";
	}
	@RequestMapping(value = "/logout")
	public String Logout(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String appServerIp = (String) session.getAttribute("AppServerIp");
		System.out.println("Ip"+appServerIp);
		logger.debug("Login()");
		session.setAttribute("KYCHOMEFIELD", " ");
		session.setAttribute("USERINFORESPONSEADDRESS", " ");
		session.setAttribute("USERINFORESPONSEINTRODUCER", " ");
		session.setAttribute("KYCMessage", "");
		session.setAttribute("transactionList", null);
		session.setAttribute("LoginMessage", " ");
		session.setAttribute("SignUpMessage", " ");
		session.setAttribute("KYCUPDATEMESSAGE", " ");
		session.setAttribute("USERINFORESPONSE", " ");
		session.setAttribute("KYCMessage", " ");
		session.setAttribute("LoadFundMessage", "");
		session.setAttribute("KYCMessage", "");
		session.setAttribute("LOADFUNDAMOUNT","");
		session.setAttribute("LOADFUNDACCOUNT", "");
		session.setAttribute("LOADFUNDACCOUNTTITTLE", "");
		session.setAttribute("LoadFundMessage", "");
		session.setAttribute("message", "");
		session.setAttribute("GSMAILID", "");
		session.setAttribute("photoemailid","");
		session.setAttribute("USERMOBILENO","");
		session.setAttribute("CUSCODE", "");
		session.setAttribute("LoginWalletId", "");
		session.setAttribute("WALLETBALANCE","");
		session.setAttribute("LoginMessage", "");
		session.setAttribute("PINCODEMESSAGE"," ");
		session.setAttribute("wallettomerchantpaymentMsg", "");
		session.setAttribute("GSSESSION", "");
		session.setAttribute("PINCODEMESSAGE"," ");
		session.setAttribute("CHANGEPASSWORDMESSAGE", " ");
		session.setAttribute("PasswordRecovery"," ");
		session.setAttribute("SignUpMessage", "");
		session.setAttribute("Talktimemsg"," ");
		session.setAttribute("WalletOpenErrorMessage","");
		session.setAttribute("CURWALLETBALANCE"," ");
		session.setAttribute("LOADFUNDAMOUNT", "");
		session.setAttribute("WALLETAMOUNT","");
		session.setAttribute("WALLETIDCREDIT", "");
		session.setAttribute("WALLETNarration","");
		session.setAttribute("WalletMsg", "");
		session.setAttribute("LoginMessage", "");
		session.setAttribute("KYCUPDATEMESSAGE", " ");
		session.setAttribute("transactionList", null);
		session.setAttribute("LoginMessage", " ");
		session.setAttribute("SignUpMessage", " ");
		session.setAttribute("photoemailid","");
		session.setAttribute("USERMOBILENO","");
		session.setAttribute("CUSCODE", "");
		session.setAttribute("LoginWalletId", "");
		session.setAttribute("WALLETBALANCE","");
		session.setAttribute("GSUSERNAME", "");
		session.setAttribute("RequestCount", " ");

		return "testlogin";
	}
}
	
