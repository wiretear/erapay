package com.era.erapay.wallet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

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
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


import com.era.erapay.Fund.LoadFundForm;


@Controller
public class WalletToWalletController {
	IpFinder ipFinder = new IpFinder();
	ActivityHistoryApiCall activityHistoryApiCall = new ActivityHistoryApiCall();
	DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh.mm.ss  aa");
	Date today = Calendar.getInstance().getTime();
	String dateAndTime = df.format(today);
	String debitResponseCode = " ";
	String debitResponseStatus = " ";
	String walletCurrencyResponseCode=" ";
	String walletCurrencyResponseStatus=" ";

	@RequestMapping(value = "/wallettowallet")
	public String walletowallet(Model model, HttpServletRequest request, HttpServletResponse response, @ModelAttribute("owallettowallet") WalletToWalletForm owallettowallet) throws IOException {
		HttpSession session = request.getSession(true);
		String appServerIp = (String) session.getAttribute("AppServerIp");
		String iP = ipFinder.getIp(request);
		String sessionId = (String) session.getAttribute("SESSIONID");
		String mailId = (String) session.getAttribute("photoemailid");
		CloseableHttpClient closeableHttpClientHistory = HttpClients.createDefault();
		String apiUrl = "/erapay/wallettowallet";
		String serverIp =(String) session.getAttribute("TESTURL");
		String userAccountCurrentBalancerUrl= serverIp+"/ERAPAY/userAccountCurrentBalance.do";
		String userActivityServerUrl= serverIp+"/ERAPAY/userActivityHistory.do";
		HttpPost httpPostHistory = new HttpPost(userActivityServerUrl);
		session.setAttribute("KYCMessage", "");
		List<NameValuePair> paramsHistory = new ArrayList<NameValuePair>();
		paramsHistory.add(new BasicNameValuePair("api_pass", "history"));
		paramsHistory.add(new BasicNameValuePair("userid", mailId));
		paramsHistory.add(new BasicNameValuePair("sessionid", sessionId));
		paramsHistory.add(new BasicNameValuePair("actionname", apiUrl));
		paramsHistory.add(new BasicNameValuePair("actionintime", "11111"));
		paramsHistory.add(new BasicNameValuePair("actionouttime", dateAndTime));
		paramsHistory.add(new BasicNameValuePair("timeinterval", "usersignin"));
		paramsHistory.add(new BasicNameValuePair("terminalid", "usersignin"));
		paramsHistory.add(new BasicNameValuePair("oprstamp", mailId));
		paramsHistory.add(new BasicNameValuePair("ip_remote", iP));
		activityHistoryApiCall.getHistory(closeableHttpClientHistory, httpPostHistory, paramsHistory);
		session.setAttribute("WalletMsg", " ");
		CloseableHttpResponse walletCurcloseableHttpResponse = null;
		CloseableHttpClient walletCurhttpclient = HttpClients.createDefault();
		HttpPost walletCurhttpclienthttpPost = new HttpPost(userAccountCurrentBalancerUrl);
		String walletID = (String) session.getAttribute("LoginWalletId");
		List<NameValuePair> walletCurhttpclienthttpPostparams = new ArrayList<>();
		//Map<String,Object> dateValue = new HashMap<String,Object>()
		// params.add(new BasicNameValuePair("action","addbank"));
		walletCurhttpclienthttpPostparams.add(new BasicNameValuePair("api_pass", "currentbalance"));
		walletCurhttpclienthttpPostparams.add(new BasicNameValuePair("walletid", walletID));
		System.out.println(walletCurhttpclienthttpPostparams);
		//params.add((NameValuePair) dateValue.put("timstamp", date));
		try {
			walletCurhttpclienthttpPost.setEntity(new UrlEncodedFormEntity(walletCurhttpclienthttpPostparams));
			walletCurcloseableHttpResponse = walletCurhttpclient.execute(walletCurhttpclienthttpPost);
			String responseString = EntityUtils.toString(walletCurcloseableHttpResponse.getEntity(), "UTF-8");
			System.out.println("Response ===== >>>>> " + responseString);
			JSONObject json = new JSONObject(responseString);
			walletCurrencyResponseCode = json.getString("Response_Code");
			walletCurrencyResponseCode = json.getString("Response_Code");
			Number walletCurrency = json.getNumber("Current_Balance");
			NumberFormat formatter = new DecimalFormat("#0.00");
			String formattedwalletCurrency=formatter.format(walletCurrency);
			System.out.println("Response ===== >>>>> " + walletCurrency);
			session.setAttribute("CURWALLETBALANCE",formattedwalletCurrency);
		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			walletCurhttpclient.close();
		}


		return "WalletToWalletTransfer";
	}

	@RequestMapping(value = "/walletsearch")
	public String walletsearch(Model model, @ModelAttribute("owallettowallet") WalletToWalletForm owallettowallet, HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession(true);
		String appServerIp = (String) session.getAttribute("AppServerIp");
		//	session.setAttribute("LOADFUNDAMOUNT",oLoadFundForm.getAmount());
		String cusCode = (String) session.getAttribute("CUSCODE");
		CloseableHttpResponse closeableHttpResponse = null;
		String serverIp =(String) session.getAttribute("TESTURL");
		String searchDestinationWalletIDUrl= serverIp+"/ERAPAY/searchDestinationWalletID.do";
		String userActivityServerUrl= serverIp+"/ERAPAY/userActivityHistory.do";
		CloseableHttpClient httpclient = HttpClients.createDefault();
		HttpPost httpPost = new HttpPost(searchDestinationWalletIDUrl);
		//Map<String,Object> dateValue = new HashMap<String,Object>();
		List<NameValuePair> params = new ArrayList<>();
		params.add(new BasicNameValuePair("api_pass", "serachwalletid"));
		params.add(new BasicNameValuePair("walletID", ""));
		params.add(new BasicNameValuePair("Name", ""));
		params.add(new BasicNameValuePair("MobileNo", ""));
		params.add(new BasicNameValuePair("customerID", cusCode));

		try {
			httpPost.setEntity(new UrlEncodedFormEntity(params));
			closeableHttpResponse = httpclient.execute(httpPost);
			String responseString = EntityUtils.toString(closeableHttpResponse.getEntity(), "UTF-8");
			System.out.println("Response ===== >>>>> " + responseString);
			JSONObject obj = new JSONObject(responseString);
			JSONArray arr = obj.getJSONArray("walletid");
			JSONArray arr1 = obj.getJSONArray("mobileno");
			JSONArray arr2 = obj.getJSONArray("username");
			ArrayList<WalletToWalletForm> listOfResponse = new ArrayList<WalletToWalletForm>();
			for (int i = 0; i < arr.length(); i++) {
				String walletid_FromJson=arr.getString(i);
				String mobileno_FromJson=arr1.getString(i);
				String username_FromJson=arr2.getString(i);
				WalletToWalletForm walletList = new WalletToWalletForm();
				walletList.setWalletId(walletid_FromJson);
				walletList.setMobileNO(mobileno_FromJson);
				walletList.setName(username_FromJson);
				listOfResponse.add(walletList);
			}
			owallettowallet.setWalletSearchList(listOfResponse);
			/*
			JSONObject obj = new JSONObject(responseString);
			JSONArray arr = obj.getJSONArray("walletid");
			JSONArray arr1 = obj.getJSONArray("mobileno");
			JSONArray arr2 = obj.getJSONArray("username");
			ArrayList listOfResponse = new ArrayList();
			ArrayList listOfResponse1 = new ArrayList();
			ArrayList listOfResponse2 = new ArrayList();
			System.out.println("EEE" + arr);
			System.out.println("EEE" + arr1);
           // WalletToWalletForm owallettowallet1 = new WalletToWalletForm();
		//	WalletToWalletForm owallettowallet2 = new WalletToWalletForm();
			//WalletToWalletForm owallettowallet3 = new WalletToWalletForm();
			int k=0;
            while(k < arr.length()) {
                WalletToWalletForm owallettowallet1 = new WalletToWalletForm();
				String walletId = (String) arr.get(k);
				owallettowallet1.setWalletId(walletId);
				listOfResponse.add(owallettowallet1);
				k++;
			}
            owallettowallet.setWalletSearchList(listOfResponse);
			int i=0;
			while(i < arr1.length()) {
                WalletToWalletForm owallettowallet2 = new WalletToWalletForm();
				String mobileno = (String) arr1.get(i);
                owallettowallet2.setMobileNO(mobileno);
				listOfResponse1.add(owallettowallet2);
				i++;
				//owallettowallet2 = new WalletToWalletForm();
			}
			owallettowallet.setMobileNoSearchList(listOfResponse1);
			int j=0;
            while(j < arr2.length()) {
                WalletToWalletForm owallettowallet3 = new WalletToWalletForm();
				String name = (String) arr2.get(j);
				owallettowallet3.setName(name);
				listOfResponse2.add(owallettowallet3);
				j++;
				//owallettowallet3 = new WalletToWalletForm();
			}
			owallettowallet.setNameSearchList(listOfResponse2);
   	                /*
   	                ArrayList<WalletToWalletForm> listOfResponse = new ArrayList<WalletToWalletForm>();
	                int i =0 ;  
	                WalletToWalletForm owallettowallet1 = new WalletToWalletForm();
	                StringTokenizer multiTokenizer = new StringTokenizer(responseString, ",");
	        		while (multiTokenizer.hasMoreTokens())
	        		{
	        			String elem = multiTokenizer.nextToken();
	        			elem=elem.replace("[", "").replace("]", "").replace("\"", "");
	        			 if( i%3 == 0 ){
	        				 System.out.println("elem0===>> "+elem);
	        				 owallettowallet1.setWalletId(elem);
	        			 }
	        			 else if( i%3 == 1){
	        				 owallettowallet1.setName(elem);
	        				 System.out.println("elem1===>> "+elem);
	        			 }
	        			 else if( i%3 == 2 ){
	        				 System.out.println("elem2===>> "+elem);
	        				 owallettowallet1.setMobileNO(elem);	        		
	        				 listOfResponse.add(owallettowallet1);
	        				 owallettowallet1 = new WalletToWalletForm();
	        			 }

	        			 ++i;  
		        	}
	        		owallettowallet.setWalletSearchList(listOfResponse);
	        		*/
			JSONArray topArray = null;
			try {
				// Getting your top array
				//THIS IS NOT NEEDED ANYMORE
				//topArray = json.getJSONArray(jsonString);
				//use this instead

			} catch (JSONException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			httpclient.close();
		}
		String iP = ipFinder.getIp(request);
		String sessionId = (String) session.getAttribute("SESSIONID");
		String mailId = (String) session.getAttribute("photoemailid");
		CloseableHttpClient closeableHttpClientHistory = HttpClients.createDefault();
		String apiUrl = "/erapay/walletsearch";
		HttpPost httpPostHistory = new HttpPost(userActivityServerUrl);
		session.setAttribute("KYCMessage", "");
		List<NameValuePair> paramsHistory = new ArrayList<NameValuePair>();
		paramsHistory.add(new BasicNameValuePair("api_pass", "history"));
		paramsHistory.add(new BasicNameValuePair("userid", mailId));
		paramsHistory.add(new BasicNameValuePair("sessionid", sessionId));
		paramsHistory.add(new BasicNameValuePair("actionname", apiUrl));
		paramsHistory.add(new BasicNameValuePair("actionintime", "11111"));
		paramsHistory.add(new BasicNameValuePair("actionouttime", dateAndTime));
		paramsHistory.add(new BasicNameValuePair("timeinterval", "usersignin"));
		paramsHistory.add(new BasicNameValuePair("terminalid", "usersignin"));
		paramsHistory.add(new BasicNameValuePair("oprstamp", mailId));
		paramsHistory.add(new BasicNameValuePair("ip_remote", iP));
		activityHistoryApiCall.getHistory(closeableHttpClientHistory, httpPostHistory, paramsHistory);
		return "sendmoneysearch";
	}

	@RequestMapping(value = "/executewalletsearch")
	public String executewalletsearch(Model model, @ModelAttribute("oLoadFundForm") LoadFundForm oLoadFundForm, HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession(true);
		String appServerIp = (String) session.getAttribute("AppServerIp");
		String sessionID = (String) session.getAttribute("GSSESSION");
		String userID = (String) session.getAttribute("GSMAILID");
		String cusCode = (String) session.getAttribute("CUSCODE");
		DateFormat df = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		Date today = Calendar.getInstance().getTime();
		String reportDate = df.format(today);

		String serverIp =(String) session.getAttribute("TESTURL");
		String walletOpenUrl= serverIp+"/ERAPAY/walletOpen.do";
		String userActivityServerUrl= serverIp+"/ERAPAY/userActivityHistory.do";

		String iP = ipFinder.getIp(request);
		String sessionId = (String) session.getAttribute("SESSIONID");
		String mailId = (String) session.getAttribute("photoemailid");
		CloseableHttpClient closeableHttpClientHistory = HttpClients.createDefault();
		String apiUrl = "/erapay/executewalletsearch";
		HttpPost httpPostHistory = new HttpPost(userActivityServerUrl);
		session.setAttribute("KYCMessage", "");
		List<NameValuePair> paramsHistory = new ArrayList<NameValuePair>();
		paramsHistory.add(new BasicNameValuePair("api_pass", "history"));
		paramsHistory.add(new BasicNameValuePair("userid", mailId));
		paramsHistory.add(new BasicNameValuePair("sessionid", sessionId));
		paramsHistory.add(new BasicNameValuePair("actionname", apiUrl));
		paramsHistory.add(new BasicNameValuePair("actionintime", "11111"));
		paramsHistory.add(new BasicNameValuePair("actionouttime", dateAndTime));
		paramsHistory.add(new BasicNameValuePair("timeinterval", "usersignin"));
		paramsHistory.add(new BasicNameValuePair("terminalid", "usersignin"));
		paramsHistory.add(new BasicNameValuePair("oprstamp", mailId));
		paramsHistory.add(new BasicNameValuePair("ip_remote", iP));
		activityHistoryApiCall.getHistory(closeableHttpClientHistory, httpPostHistory, paramsHistory);
		// Print what date is today!
		System.out.println("Report Date: " + cusCode);
		CloseableHttpResponse closeableHttpResponse = null;
		CloseableHttpClient httpclient = HttpClients.createDefault();

		HttpPost httpPost = new HttpPost(walletOpenUrl);
		//Map<String,Object> dateValue = new HashMap<String,Object>();
		List<NameValuePair> params = new ArrayList<>();
		params.add(new BasicNameValuePair("api_pass", "addwallet"));
		params.add(new BasicNameValuePair("walletid", ""));
		params.add(new BasicNameValuePair("opendate", reportDate));
		params.add(new BasicNameValuePair("curcde", "BDT"));
		params.add(new BasicNameValuePair("cuscod", cusCode));
		params.add(new BasicNameValuePair("curbal", "0"));
		params.add(new BasicNameValuePair("blkamt", "0"));
		params.add(new BasicNameValuePair("status", "Y"));
		params.add(new BasicNameValuePair("statusdat", ""));
		params.add(new BasicNameValuePair("terminalid", "Y"));
		params.add(new BasicNameValuePair("clsdat", ""));
		params.add(new BasicNameValuePair("oprstamp", userID));
		//     params.add(new BasicNameValuePair("timestamp",reportDate));
		//params.add((NameValuePair) dateValue.put("timstamp", date));

		try {
			httpPost.setEntity(new UrlEncodedFormEntity(params));
			closeableHttpResponse = httpclient.execute(httpPost);
			String responseString = EntityUtils.toString(closeableHttpResponse.getEntity(), "UTF-8");
			System.out.println("Response ===== >>>>> " + responseString);
			String[] parts = responseString.split(",");
			//String DataResponse = responseString.replace("[", "").replace("]", "");
			//     result += responseBody;
			//       System.out.println("Response ===== >>>>> "+closeableHttpResponse);
		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			httpclient.close();
		}
		session.setAttribute("LOADFUNDAMOUNT", oLoadFundForm.getAmount());
		return "sendmoneysearch";
	}

	@RequestMapping(value = "/executewalletowalletotp")
	public String walletowalletotp(Model model, HttpServletRequest request, HttpServletResponse response, @ModelAttribute("owallettowallet") WalletToWalletForm owallettowallet) throws IOException {

		HttpSession session = request.getSession(true);
		String iP = ipFinder.getIp(request);
		String appServerIp = (String) session.getAttribute("AppServerIp");
		String sessionId = (String) session.getAttribute("SESSIONID");
		String mailId = (String) session.getAttribute("photoemailid");
		String walletID = (String) session.getAttribute("LoginWalletId");String serverIp =(String) session.getAttribute("TESTURL");
		String userAccountCurrentBalanceUrl= serverIp+"/ERAPAY/userAccountCurrentBalance.do";
		String userActivityServerUrl= serverIp+"/ERAPAY/userActivityHistory.do";
		CloseableHttpClient closeableHttpClientHistory = HttpClients.createDefault();
		String apiUrl = "/erapay/executewalletowalletotp";
		HttpPost httpPostHistory = new HttpPost(userActivityServerUrl);
		session.setAttribute("KYCMessage", "");
		String walletTowalletBtnValue = request.getParameter("wallettowalletbtn");
		owallettowallet.setButtonValue(walletTowalletBtnValue);
		System.out.println("Value oF button"+walletTowalletBtnValue);
		List<NameValuePair> paramsHistory = new ArrayList<NameValuePair>();
		paramsHistory.add(new BasicNameValuePair("api_pass", "history"));
		paramsHistory.add(new BasicNameValuePair("userid", mailId));
		paramsHistory.add(new BasicNameValuePair("sessionid", sessionId));
		paramsHistory.add(new BasicNameValuePair("actionname", apiUrl));
		paramsHistory.add(new BasicNameValuePair("actionintime", "11111"));
		paramsHistory.add(new BasicNameValuePair("actionouttime", dateAndTime));
		paramsHistory.add(new BasicNameValuePair("timeinterval", "usersignin"));
		paramsHistory.add(new BasicNameValuePair("terminalid", "usersignin"));
		paramsHistory.add(new BasicNameValuePair("oprstamp", mailId));
		paramsHistory.add(new BasicNameValuePair("ip_remote", iP));
		activityHistoryApiCall.getHistory(closeableHttpClientHistory, httpPostHistory, paramsHistory);
		// Print what date is today!
		session.setAttribute("WALLETAMOUNT", owallettowallet.getAmount());
		session.setAttribute("WALLETIDCREDIT", owallettowallet.getWalletId());
		session.setAttribute("WALLETNarration", owallettowallet.getWalletNarration());
		CloseableHttpResponse walletCurcloseableHttpResponse = null;
		CloseableHttpClient walletCurhttpclient = HttpClients.createDefault();
		HttpPost walletCurhttpclienthttpPost = new HttpPost(userAccountCurrentBalanceUrl);
		List<NameValuePair> walletCurhttpclienthttpPostparams = new ArrayList<>();
		//Map<String,Object> dateValue = new HashMap<String,Object>()
		// params.add(new BasicNameValuePair("action","addbank"));
		walletCurhttpclienthttpPostparams.add(new BasicNameValuePair("api_pass", "currentbalance"));
		walletCurhttpclienthttpPostparams.add(new BasicNameValuePair("walletid", walletID));
		System.out.println(walletCurhttpclienthttpPostparams);
		//params.add((NameValuePair) dateValue.put("timstamp", date));
		try {
			walletCurhttpclienthttpPost.setEntity(new UrlEncodedFormEntity(walletCurhttpclienthttpPostparams));
			walletCurcloseableHttpResponse = walletCurhttpclient.execute(walletCurhttpclienthttpPost);
			String responseString = EntityUtils.toString(walletCurcloseableHttpResponse.getEntity(), "UTF-8");
			System.out.println("Response ===== >>>>> " + responseString);
			JSONObject json = new JSONObject(responseString);
			walletCurrencyResponseCode = json.getString("Response_Code");
			Number walletCurrency = json.getNumber("Current_Balance");
			NumberFormat formatter = new DecimalFormat("#0.00");
			String formattedwalletCurrency=formatter.format(walletCurrency);
			System.out.println("Response ===== >>>>> " + walletCurrency);
			session.setAttribute("CURWALLETBALANCE",formattedwalletCurrency);

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			walletCurhttpclient.close();
		}


		return "WalletToWalletTransfer";
	}

	@RequestMapping(value = "/executewalletowallet")
	public String dowalletowallet(Model model, HttpServletRequest request, HttpServletResponse response, @ModelAttribute("owallettowallet") WalletToWalletForm owallettowallet) throws IOException {

		HttpSession session = request.getSession(true);
		String appServerIp = (String) session.getAttribute("AppServerIp");
		String serverIp =(String) session.getAttribute("TESTURL");
		String waltowaltransferUrl= serverIp+"/ERAPAY/waltowaltransfer.do";
		String userActivityServerUrl= serverIp+"/ERAPAY/userActivityHistory.do";
		String userAccountCurrentBalanceUrl= serverIp+"/ERAPAY/userAccountCurrentBalance.do";
		System.out.println("sssss"+waltowaltransferUrl);

		String outCode = "";
		String outMessage = "";
		String userID = (String) session.getAttribute("GSMAILID");
		String iP = ipFinder.getIp(request);
		String sessionId = (String) session.getAttribute("SESSIONID");
		String mailId = (String) session.getAttribute("photoemailid");
		CloseableHttpClient closeableHttpClientHistory = HttpClients.createDefault();
		String signInApiUrl = "http://10.11.201.169:8080/ERAPAY/signInRest.do";
		HttpPost httpPostHistory = new HttpPost(userActivityServerUrl);
		session.setAttribute("KYCMessage", "");
		List<NameValuePair> paramsHistory = new ArrayList<NameValuePair>();
		paramsHistory.add(new BasicNameValuePair("api_pass", "history"));
		paramsHistory.add(new BasicNameValuePair("userid", mailId));
		paramsHistory.add(new BasicNameValuePair("sessionid", sessionId));
		paramsHistory.add(new BasicNameValuePair("actionname", signInApiUrl));
		paramsHistory.add(new BasicNameValuePair("actionintime", "11111"));
		paramsHistory.add(new BasicNameValuePair("actionouttime", dateAndTime));
		paramsHistory.add(new BasicNameValuePair("timeinterval", "usersignin"));
		paramsHistory.add(new BasicNameValuePair("terminalid", "usersignin"));
		paramsHistory.add(new BasicNameValuePair("oprstamp", mailId));
		paramsHistory.add(new BasicNameValuePair("ip_remote", iP));
		activityHistoryApiCall.getHistory(closeableHttpClientHistory, httpPostHistory, paramsHistory);
		CloseableHttpResponse closeableHttpResponse = null;
		CloseableHttpClient httpclient = HttpClients.createDefault();

       System.out.println("DATA"+ owallettowallet.getAmount());
		HttpPost httpPost = new HttpPost(waltowaltransferUrl);
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date today = Calendar.getInstance().getTime();
		String reportDate = df.format(today);
		String walletIdCredit = (String) session.getAttribute("WALLETIDCREDIT");
		String walletId = (String) session.getAttribute("LoginWalletId");
		String amount = (String) session.getAttribute("WALLETAMOUNT");
		String  narration = (String) session.getAttribute("WALLETNarration");
		System.out.println("narration" + narration);
		List<NameValuePair> params = new ArrayList<>();
		System.out.println("pagevalue"+walletIdCredit);
		System.out.println("Debit"+walletId);
		//Map<String,Object> dateValue = new HashMap<String,Object>()
		// params.add(new BasicNameValuePair("action","addbank"));
		params.add(new BasicNameValuePair("api_pass", "D"));
		params.add(new BasicNameValuePair("docnum", "123"));
		params.add(new BasicNameValuePair("doctyp", "FND"));
		params.add(new BasicNameValuePair("oprcod", "1"));
		params.add(new BasicNameValuePair("trndat", reportDate));
		params.add(new BasicNameValuePair("debit_walletid", walletId));
		params.add(new BasicNameValuePair("narration", narration));
		params.add(new BasicNameValuePair("emailID", userID));
		params.add(new BasicNameValuePair("drcrcd", "D"));
		params.add(new BasicNameValuePair("curcde", "BDT"));
		params.add(new BasicNameValuePair("exrate", "1"));
		params.add(new BasicNameValuePair("trnamt", amount));
		params.add(new BasicNameValuePair("walletid", walletIdCredit));
		params.add(new BasicNameValuePair("srcrefno1", ""));
		params.add(new BasicNameValuePair("srcrefno2", ""));
		params.add(new BasicNameValuePair("srcrefno3", ""));
		params.add(new BasicNameValuePair("srcrefno4", ""));
		params.add(new BasicNameValuePair("terminalId", ""));
		params.add(new BasicNameValuePair("oprstamp", userID));
		params.add(new BasicNameValuePair("timestamp", reportDate));
		System.out.println(params);
		//params.add((NameValuePair) dateValue.put("timstamp", date));
		try {
			httpPost.setEntity(new UrlEncodedFormEntity(params));
			closeableHttpResponse = httpclient.execute(httpPost);
			String responseString = EntityUtils.toString(closeableHttpResponse.getEntity(), "UTF-8");
			System.out.println("Response ===== >>>>> " + responseString);
			JSONObject json = new JSONObject(responseString);
			debitResponseCode = json.getString("Response_Code");
			debitResponseStatus = json.getString("Response_Status");
		}
		catch (Exception e) {

			e.printStackTrace();
		}
		finally {
            httpclient.close();
        }
		/*
		if (debitResponseCode.equals("0")){
			CloseableHttpResponse closeableHttpResponse1 = null;
			CloseableHttpClient httpclient1 = HttpClients.createDefault();
			HttpPost httpPost1 = new HttpPost("http://10.11.201.169:8080/ERAPAY/waltowaltransfer.do");
			System.out.println("wallet test" + owallettowallet.getAmount());
			List<NameValuePair> params1 = new ArrayList<>();
			//Map<String,Object> dateValue = new HashMap<String,Object>()
			//params.add(new BasicNameValuePair("action","addbank"));
			params1.add(new BasicNameValuePair("api_pass", "C"));
			params1.add(new BasicNameValuePair("emailID", userID));
			params1.add(new BasicNameValuePair("debit_walletid", walletId));
			params1.add(new BasicNameValuePair("narration", narration));
			params1.add(new BasicNameValuePair("docnum", "123"));
			params1.add(new BasicNameValuePair("doctyp", "FND"));
			params1.add(new BasicNameValuePair("oprcod", "1"));
			params1.add(new BasicNameValuePair("trndat", reportDate));
			params1.add(new BasicNameValuePair("walletid", walletIdCredit));
			params1.add(new BasicNameValuePair("drcrcd", "C"));
			params1.add(new BasicNameValuePair("curcde", "BDT"));
			params1.add(new BasicNameValuePair("exrate", "1"));
			params1.add(new BasicNameValuePair("trnamt", amount));
			params1.add(new BasicNameValuePair("destwalletid", ""));
			params1.add(new BasicNameValuePair("srcrefno1", ""));
			params1.add(new BasicNameValuePair("srcrefno2", ""));
			params1.add(new BasicNameValuePair("srcrefno3", ""));
			params1.add(new BasicNameValuePair("srcrefno4", ""));
			params1.add(new BasicNameValuePair("narration", ""));
			params1.add(new BasicNameValuePair("terminalId", ""));
			params1.add(new BasicNameValuePair("oprstamp", userID));
			params1.add(new BasicNameValuePair("timestamp", reportDate));
			System.out.println(params1);
			//params.add((NameValuePair) dateValue.put("timstamp", date));
			try {
				httpPost1.setEntity(new UrlEncodedFormEntity(params1));
				closeableHttpResponse1 = httpclient1.execute(httpPost1);
				String responseString = EntityUtils.toString(closeableHttpResponse1.getEntity(), "UTF-8");
				System.out.println("Response ===== >>>>> " + responseString);
				String[] parts = responseString.split(",");
				outMessage = parts[0];
				outCode = parts[1];
				//String DataResponse = responseString.replace("[", "").replace("]", "");
				//         result += responseBody;
				//       System.out.println("Response ===== >>>>> "+closeableHttpResponse);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				httpclient.close();
			}
		}
		*/
		if (debitResponseCode.equals("0")) {
			CloseableHttpResponse closeableHttpResponse1 = null;
			CloseableHttpClient httpclient1 = HttpClients.createDefault();
			HttpPost httpPost1 = new HttpPost(waltowaltransferUrl);
			System.out.println("wallet test" + owallettowallet.getAmount());
			List<NameValuePair> params1 = new ArrayList<>();
			//Map<String,Object> dateValue = new HashMap<String,Object>()
			//params.add(new BasicNameValuePair("action","addbank"));
			params1.add(new BasicNameValuePair("api_pass", "C"));
			params1.add(new BasicNameValuePair("emailID", userID));
			params1.add(new BasicNameValuePair("debit_walletid", walletId));
			params1.add(new BasicNameValuePair("narration", narration));
			params1.add(new BasicNameValuePair("docnum", "123"));
			params1.add(new BasicNameValuePair("doctyp", "FND"));
			params1.add(new BasicNameValuePair("oprcod", "1"));
			params1.add(new BasicNameValuePair("trndat", reportDate));
			params1.add(new BasicNameValuePair("walletid", walletIdCredit));
			params1.add(new BasicNameValuePair("drcrcd", "C"));
			params1.add(new BasicNameValuePair("curcde", "BDT"));
			params1.add(new BasicNameValuePair("exrate", "1"));
			params1.add(new BasicNameValuePair("trnamt", amount));
			params1.add(new BasicNameValuePair("destwalletid", ""));
			params1.add(new BasicNameValuePair("srcrefno1", ""));
			params1.add(new BasicNameValuePair("srcrefno2", ""));
			params1.add(new BasicNameValuePair("srcrefno3", ""));
			params1.add(new BasicNameValuePair("srcrefno4", ""));
			params1.add(new BasicNameValuePair("narration", ""));
			params1.add(new BasicNameValuePair("terminalId", ""));
			params1.add(new BasicNameValuePair("oprstamp", userID));
			params1.add(new BasicNameValuePair("timestamp", reportDate));
			System.out.println(params1);
			//params.add((NameValuePair) dateValue.put("timstamp", date));
			try {
				httpPost1.setEntity(new UrlEncodedFormEntity(params1));
				closeableHttpResponse1 = httpclient1.execute(httpPost1);
				String responseString = EntityUtils.toString(closeableHttpResponse1.getEntity(), "UTF-8");
				System.out.println("Response ===== >>>>> " + responseString);
				//String[] parts = responseString.split(",");
				//outMessage = parts[0];
				//outCode = parts[1];
				//String DataResponse = responseString.replace("[", "").replace("]", "");
				//         result += responseBody;
				//       System.out.println("Response ===== >>>>> "+closeableHttpResponse);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				httpclient.close();
			}
			String walletID = (String) session.getAttribute("LoginWalletId");
			CloseableHttpResponse walletCurcloseableHttpResponse = null;
			CloseableHttpClient walletCurhttpclient = HttpClients.createDefault();
			HttpPost walletCurhttpclienthttpPost = new HttpPost(userAccountCurrentBalanceUrl);
			List<NameValuePair> walletCurhttpclienthttpPostparams = new ArrayList<>();
			//Map<String,Object> dateValue = new HashMap<String,Object>()
			// params.add(new BasicNameValuePair("action","addbank"));
			walletCurhttpclienthttpPostparams.add(new BasicNameValuePair("api_pass", "currentbalance"));
			walletCurhttpclienthttpPostparams.add(new BasicNameValuePair("walletid", walletID));
			System.out.println(walletCurhttpclienthttpPostparams);
			//params.add((NameValuePair) dateValue.put("timstamp", date));
			try {
				walletCurhttpclienthttpPost.setEntity(new UrlEncodedFormEntity(walletCurhttpclienthttpPostparams));
				walletCurcloseableHttpResponse = walletCurhttpclient.execute(walletCurhttpclienthttpPost);
				String responseString = EntityUtils.toString(walletCurcloseableHttpResponse.getEntity(), "UTF-8");
				System.out.println("Response ===== >>>>> " + responseString);
				JSONObject json = new JSONObject(responseString);
				walletCurrencyResponseCode = json.getString("Response_Code");
				Number walletCurrency = json.getNumber("Current_Balance");
				NumberFormat formatter = new DecimalFormat("#0.00");
				String formattedwalletCurrency=formatter.format(walletCurrency);
				System.out.println("Response ===== >>>>> " + walletCurrency);
				session.setAttribute("CURWALLETBALANCE",formattedwalletCurrency);

			} catch (Exception e) {

				e.printStackTrace();

			} finally {
				walletCurhttpclient.close();
			}


			//session.setAttribute("sErrorMessage", oMenuGenarationBO.getErrorMessage());
			session.setAttribute("WalletMsg", debitResponseStatus);
			session.setAttribute("WALLETAMOUNT", " ");
			session.setAttribute("WALLETIDCREDIT", " ");
			session.setAttribute("WALLETNarration", " ");
			return "WalletToWalletTransfer";
		}
		else {
			session.setAttribute("WalletMsg", debitResponseStatus);
			return "WalletToWalletTransfer";
		}
	}
}
