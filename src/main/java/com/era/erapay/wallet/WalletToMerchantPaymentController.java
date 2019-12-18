package com.era.erapay.wallet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.era.erapay.KYC.KycForm;
import com.era.erapay.common.ActivityHistoryApiCall;
import com.era.erapay.common.CommonBean;
import com.era.erapay.common.IpFinder;
import com.era.erapay.login.LoginFormBean;
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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;


@Controller
public class WalletToMerchantPaymentController {
    @Autowired
    CommonBean bean;

    IpFinder ipFinder =new IpFinder();
    ActivityHistoryApiCall activityHistoryApiCall=new ActivityHistoryApiCall();
    DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh.mm.ss  aa");
    Date today = Calendar.getInstance().getTime();
    String dateAndTime = df.format(today);
    @RequestMapping(value = "/wallettomerchanpayment")
    public String wallettomerchantpayment(Model model, HttpServletRequest request, @ModelAttribute("oWalletToMerchantPaymentForm") WalletToMerchantPaymentForm oWalletToMerchantPaymentForm, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(true);
        String appServerIp = (String) session.getAttribute("AppServerIp");
        String serverIp =(String) session.getAttribute("TESTURL");
        String userActivityHistoryUrl= serverIp+"/ERAPAY/userActivityHistory.do";

        session.setAttribute("wallettomerchantpaymentMsg", " ");
        String iP=ipFinder.getIp(request);
        String sessionId= (String) session.getAttribute("SESSIONID");
        String mailId= (String) session.getAttribute("photoemailid");
        CloseableHttpClient closeableHttpClientHistory = HttpClients.createDefault();
        String apiUrl="/erapay/wallettomerchanpayment";
        HttpPost httpPostHistory = new HttpPost(userActivityHistoryUrl);
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
        return "wallettomerchantpayment";
    }

    @RequestMapping(value = "/executewallettomerchanpayment")
    public String formsuccsess(Model model,
                               @ModelAttribute("oWalletToMerchantPaymentForm") WalletToMerchantPaymentForm oWalletToMerchantPaymentForm, HttpServletRequest request,
                               SessionStatus status, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession(true);
        String appServerIp = (String) session.getAttribute("AppServerIp");
        session.setAttribute("wallettomerchantpaymentMsg", " ");
        String outCode = "";
        String outMessage = "";
        String userID = (String) session.getAttribute("GSMAILID");
        String eraPayServerIp=bean.getServerIp();
        String url="http://"+eraPayServerIp;
        System.out.println("url"+url);
        session.setAttribute("TESTURL",url);
        String iP=ipFinder.getIp(request);
        String sessionId= (String) session.getAttribute("SESSIONID");
        String mailId= (String) session.getAttribute("photoemailid");
        CloseableHttpClient closeableHttpClientHistory = HttpClients.createDefault();
        String apiUrl="/erapay/executewallettomerchanpayment";
        String serverIp ="http://"+eraPayServerIp;
        System.out.println("IP OF SERVER"+serverIp);
        String userActivityHistoryUrl= serverIp+"/ERAPAY/userActivityHistory.do";
        String wallettomerchantpaymentUrl= serverIp+"/ERAPAY/wallettomerchantpayment.do";
        HttpPost httpPostHistory = new HttpPost(userActivityHistoryUrl);
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
        HttpPost httpPost = new HttpPost(wallettomerchantpaymentUrl);
        DateFormat df = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        Date today = Calendar.getInstance().getTime();
        String reportDate = df.format(today);
        System.out.println(reportDate);


        //Map<String,Object> dateValue = new HashMap<String,Object>();
        List<NameValuePair> params = new ArrayList<>();
        // params.add(new BasicNameValuePair("action","addbank"));
        params.add(new BasicNameValuePair("api_pass", "wallet"));
        params.add(new BasicNameValuePair("docnum", "124578"));
        params.add(new BasicNameValuePair("doctyp", "WTM"));
        params.add(new BasicNameValuePair("oprcod", "123"));
        params.add(new BasicNameValuePair("trndat", reportDate));
        params.add(new BasicNameValuePair("walletid", "1"));
        params.add(new BasicNameValuePair("drccrd", "C"));
        params.add(new BasicNameValuePair("curcde", "BDT"));
        params.add(new BasicNameValuePair("exrate", ""));
        params.add(new BasicNameValuePair("trnamt", oWalletToMerchantPaymentForm.getAmount()));
        params.add(new BasicNameValuePair("destwalletid", ""));
        params.add(new BasicNameValuePair("srcrefno1", ""));
        params.add(new BasicNameValuePair("srcrefno2", ""));
        params.add(new BasicNameValuePair("srcrefno3", ""));
        params.add(new BasicNameValuePair("srcrefno4", ""));
        params.add(new BasicNameValuePair("narration", ""));
        params.add(new BasicNameValuePair("terminalId", ""));
        params.add(new BasicNameValuePair("oprstamp", userID));
        params.add(new BasicNameValuePair("timestamp", reportDate));

        //params.add((NameValuePair) dateValue.put("timstamp", date));

        try {
            httpPost.setEntity(new UrlEncodedFormEntity(params));
            closeableHttpResponse = httpclient.execute(httpPost);
            String responseString = EntityUtils.toString(closeableHttpResponse.getEntity(), "UTF-8");
            System.out.println("Response ===== >>>>> " + responseString);
            String[] parts = responseString.split(",");
            outMessage = parts[0];
            outCode = parts[1];


            //String DataResponse = responseString.replace("[", "").replace("]", "");
            //     result += responseBody;

            //       System.out.println("Response ===== >>>>> "+closeableHttpResponse);

        } catch (Exception e) {

            e.printStackTrace();

        } finally {
            httpclient.close();
        }
        if (outCode.equals("0")) {
            //session.setAttribute("sErrorMessage", oMenuGenarationBO.getErrorMessage());
            session.setAttribute("wallettomerchantpaymentMsg", outMessage);

            return "wallettomerchantpayment";
        } else {
            //session.setAttribute("sErrorMessage", oMenuGenarationBO.getErrorMessage());
            session.setAttribute("wallettomerchantpaymentMsg", outMessage);
            return "wallettomerchantpayment";
        }


    }

    @RequestMapping(value = "/executeerapayment")
    public String erapayment(Model model,
                             @ModelAttribute("oWalletToMerchantPaymentForm") WalletToMerchantPaymentForm oWalletToMerchantPaymentForm, HttpServletRequest request,
                             SessionStatus status, HttpServletResponse response) throws Exception {

        HttpSession session = request.getSession(true);
        String eraPayServerIp=bean.getServerIp();
        String url="http://"+eraPayServerIp;
        System.out.println("url"+url);
        session.setAttribute("TESTURL",url);
        String iP=ipFinder.getIp(request);
        String sessionId= (String) session.getAttribute("SESSIONID");
        String appServerIp = (String) session.getAttribute("AppServerIp");
        String mailId= (String) session.getAttribute("photoemailid");
        String serverIp =(String) session.getAttribute("TESTURL");
        String userActivityHistoryUrl= serverIp+"/ERAPAY/userActivityHistory.do";
        CloseableHttpClient closeableHttpClientHistory = HttpClients.createDefault();
        String apiUrl="/erapay/executeerapayment";
        HttpPost httpPostHistory = new HttpPost(userActivityHistoryUrl);
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
        String outCodePayemnt = "";
        String flag = "";
        String referenceNo = "";
        String resAmount = "";
        String resCharge = "";
        String transactionNo = "";
        String resNarration = "";
        String redirectUrl = "";
        session.setAttribute("LoginMessage", "");
        flag = request.getParameter("flag");
        referenceNo = request.getParameter("referenceNo");
        resAmount = request.getParameter("resAmount");
        resCharge = request.getParameter("resCharge");
        resNarration = request.getParameter("resNarration");
        redirectUrl = request.getParameter("redirectUrl");
        transactionNo = request.getParameter("transactionNo");
        session.setAttribute("referenceNo", referenceNo);
        session.setAttribute("resAmount", resAmount);
        session.setAttribute("resNarration", resNarration);
        session.setAttribute("transactionNo", transactionNo);
        session.setAttribute("redirectUrl", redirectUrl);
        session.setAttribute("resCharge", resCharge);
        System.out.println("Charge" + resCharge);
        System.out.println("FLAG PRINT ====>>>> " + flag + " ===>>>>> " + resAmount);
        return "erapaypaymentlogin";
    }
    @RequestMapping(value = "/erapay/executewallettomerchanpaymenttest")
    public String executewallettomerchanpaymenttest(Model model,
                                                    @ModelAttribute("oWalletToMerchantPaymentForm") WalletToMerchantPaymentForm oWalletToMerchantPaymentForm, HttpServletRequest request,
                                                    SessionStatus status, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession(true);
        String appServerIp = (String) session.getAttribute("AppServerIp");
        session.setAttribute("wallettomerchantpaymentMsg", " ");
        String api_user_id = "";
        String api_pass = "";
        String terminal_id = "";
        String userid = "";
        String sessionid = "";
        String emailid = "";
        String password = "";
        String outCode = "";
        String outMessage = "";
        String outUserName = "";
        String sessionID = "";
        String referenceNo = " ";
        String cusCode = "";
        String responseCode = "";
        String responseStatus = "";
        String curCode="";
        String curName="";
        String bdtCurCode="";
        oWalletToMerchantPaymentForm.setName(outUserName);
        int errorexeception = 0;
        String iP=ipFinder.getIp(request);
        String sessionId= (String) session.getAttribute("SESSIONID");
        String mailId= (String) session.getAttribute("photoemailid");
        CloseableHttpClient closeableHttpClientHistory = HttpClients.createDefault();
        String apiUrl="/erapay/executewallettomerchanpaymenttest";
        String serverIp =(String) session.getAttribute("TESTURL");
        String userActivityHistoryUrl= serverIp+"/ERAPAY/userActivityHistory.do";
        String loginUrl= serverIp+"/ERAPAY/signInRest.do";


        HttpPost httpPostHistory = new HttpPost(userActivityHistoryUrl);
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
        HttpPost httpPost = new HttpPost(loginUrl);
        session.setAttribute("KYCMessage", "");
        List<NameValuePair> params = new ArrayList<NameValuePair>();
        params.add(new BasicNameValuePair("api_pass", "usersignin"));
        params.add(new BasicNameValuePair("emailid", oWalletToMerchantPaymentForm.getEmail()));
        params.add(new BasicNameValuePair("password", oWalletToMerchantPaymentForm.getPassword()));
        System.out.println("Response ===== >>>>> " + oWalletToMerchantPaymentForm.getEmail());
        System.out.println("Response ===== >>>>> " + oWalletToMerchantPaymentForm.getPassword());
        try {
            httpPost.setEntity(new UrlEncodedFormEntity(params));
            closeableHttpResponse = httpclient.execute(httpPost);
            errorexeception = closeableHttpResponse.getStatusLine().getStatusCode();
            System.out.println("ERORRRRRRRRR" + errorexeception);
            String responseString = EntityUtils.toString(closeableHttpResponse.getEntity(), "UTF-8");
            System.out.println("ERORRRRRRRRR" + responseString);
            JSONObject json = new JSONObject(responseString);
             String userType=json.getString("usertype");
            session.setAttribute("USERTYPE",userType);

            String userName = json.getString("User_Name");
            session.setAttribute("GSUSERNAME", userName);
            cusCode = json.getString("CusCode");
            String walletID = json.getString("Wallet_ID");
            responseCode = json.getString("Response_Code");
            Number currentBalance1 = json.getNumber("current_Bal");
            NumberFormat formatter = new DecimalFormat("#0.00");
            String curbal2=formatter.format(currentBalance1);
            long requestCount= json.getLong("requestcount");
            String requestCount1= String.valueOf(requestCount);
            //double d = Double.parseDouble(currentBalance);
            System.out.println("doble"+curbal2);
            sessionID=json.getString("Session");

            session.setAttribute("photoemailid", oWalletToMerchantPaymentForm.getEmail());
            //session.setAttribute("USERMOBILENO", mobileNo);
            session.setAttribute("CUSCODE", cusCode);
            session.setAttribute("SESSIONID",sessionID);
            session.setAttribute("LoginWalletId", walletID);
            session.setAttribute("WALLETBALANCE", curbal2);
            session.setAttribute("RequestCount", requestCount1);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            httpclient.close();
        }
        CloseableHttpResponse closeableHttpResponse1 = null;
        CloseableHttpClient httpclient1 = HttpClients.createDefault();
        String getAllCurrencyTypeUrl= serverIp+"/ERAPAY/userActivityHistory.do";
        HttpPost httpPost1 = new HttpPost(getAllCurrencyTypeUrl);
        session.setAttribute("KYCMessage", "");
        List<NameValuePair> params1 = new ArrayList<NameValuePair>();
        params1.add(new BasicNameValuePair("api_pass", "currency"));

        try {
            httpPost1.setEntity(new UrlEncodedFormEntity(params1));
            closeableHttpResponse1 = httpclient1.execute(httpPost1);
            errorexeception = closeableHttpResponse1.getStatusLine().getStatusCode();
            System.out.println("ERORRRRRRRRR" + errorexeception);
            String responseString1 = EntityUtils.toString(closeableHttpResponse1.getEntity(), "UTF-8");
            System.out.println("ERORRRRRRRRR" + responseString1);
            JSONArray topArray = null;
            try {
                // Getting your top array

                //THIS IS NOT NEEDED ANYMORE
                //topArray = json.getJSONArray(jsonString);
                //use this instead
                topArray = new JSONArray(responseString1);
                // looping through All elements
                ArrayList<KycForm> nodeList = new ArrayList<KycForm>();
                for(int i = 0; i < topArray.length(); i++){
                    JSONObject c = topArray.getJSONObject(i);
                    //list holding row data
                    // Storing each json item in variable
                     curCode= c.getString("curcde");
                     curName = c.getString("curnam");
                    System.out.println("RESPONSE EXAMPLE"+curCode);
                    if(curCode.equals("BDT"))
                    {
                         bdtCurCode=curCode;
                        oWalletToMerchantPaymentForm.setBdtCurCode(bdtCurCode);
                        System.out.println("RESPONSE BDT "+bdtCurCode);
                    }

                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            httpclient1.close();
        }
        if (responseCode.equals("0")) {
            System.out.println("==>>>>>> " + (String) session.getAttribute("referenceNo"));
            referenceNo = (String) session.getAttribute("referenceNo");
            String resAmount = (String) session.getAttribute("resAmount");
            String resNarration = (String) session.getAttribute("resNarration");
            String transactionNo = (String) session.getAttribute("transactionNo");
            String resCharge = (String) session.getAttribute("resCharge");
            String redirectUrl = (String) session.getAttribute("redirectUrl");
            System.out.print("Refernece" + redirectUrl);
            session.setAttribute("LoginMessage", responseStatus);
            oWalletToMerchantPaymentForm.setAmount(resAmount);
            oWalletToMerchantPaymentForm.setOrderNo(referenceNo);
            oWalletToMerchantPaymentForm.setCharge(resCharge);
            oWalletToMerchantPaymentForm.setDescription(resNarration);
            return "wallettomerchantpayment";
        } else {
            session.setAttribute("LoginMessage", responseStatus);
            return "erapaypaymentlogin";
        }
    }

    @RequestMapping(value = "/erapay/walllogin")
    public String TestLogin(HttpServletRequest request, HttpServletResponse response, Model model,
                            @ModelAttribute("oWalletToMerchantPaymentForm") WalletToMerchantPaymentForm oWalletToMerchantPaymentForm) throws Exception {
        HttpSession session = request.getSession(true);
        String appServerIp = (String) session.getAttribute("AppServerIp");
        session.setAttribute("KYCUPDATEMESSAGE", " ");
        session.setAttribute("transactionList", null);
        session.setAttribute("LoginMessage", " ");
        session.setAttribute("SignUpMessage", " ");
        LoginFormBean oLogInForm = new LoginFormBean();
        String outCode = "";
        String outMessage = "";
        String outUserName = "";
        String sessionID = "";
        String cusCode = "";
        String walletID = "";
        String iP=ipFinder.getIp(request);
        String sessionId= (String) session.getAttribute("SESSIONID");
        String mailId= (String) session.getAttribute("photoemailid");
        CloseableHttpClient closeableHttpClientHistory = HttpClients.createDefault();
        String apiUrl="/erapay/walllogin";
        HttpPost httpPostHistory = new HttpPost("http://10.11.201.169:8080/ERAPAY/userActivityHistory.do");
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
        HttpPost httpPost = new HttpPost("http://10.11.201.169:8080/ERAPAY/signInRest.do");
        session.setAttribute("KYCMessage", "");
        List<NameValuePair> params = new ArrayList<>();
        params.add(new BasicNameValuePair("api_pass", "usersignin"));
        params.add(new BasicNameValuePair("emailid", oWalletToMerchantPaymentForm.getEmail()));
        params.add(new BasicNameValuePair("password", oWalletToMerchantPaymentForm.getPassword()));
        System.out.println("Response ===== >>>>> " + oWalletToMerchantPaymentForm.getEmail());
        System.out.println("Response ===== >>>>> " + oWalletToMerchantPaymentForm.getPassword());
        try {
            httpPost.setEntity(new UrlEncodedFormEntity(params));
            closeableHttpResponse = httpclient.execute(httpPost);
            String responseString = EntityUtils.toString(closeableHttpResponse.getEntity(), "UTF-8");
            System.out.println("Response ===== >>>>> " + responseString);
            String[] parts = responseString.split(",");
            System.out.println("responseString : " + responseString);
            System.out.println("parts array length: " + parts);
            System.out.println("1" + parts[0]);
            outMessage = parts[0];
            outCode = parts[1];
            if (outCode.equals("0")) {
                outUserName = parts[2];
                sessionID = parts[3];
                cusCode = parts[4];
                walletID = parts[5];
                String walletbalance = parts[6];
                String mobileNo = parts[7];
                System.out.println("mobileNo==========>>> " + mobileNo);
                session.setAttribute("photoemailid", oWalletToMerchantPaymentForm.getEmail());
                session.setAttribute("USERMOBILENO", mobileNo);
                session.setAttribute("CUSCODE", cusCode);
                session.setAttribute("LoginWalletId", walletID);
                session.setAttribute("WALLETBALANCE", walletbalance);
                //sessionID =parts[3];
                session.setAttribute("GSSESSION", sessionID);
                oLogInForm.setErrorCode(outCode);
                session.setAttribute("GSMAILID", oWalletToMerchantPaymentForm.getEmail());
                //session.setAttribute("sErrorMessage", oMenuGenarationBO.getErrorMessage());
                session.setAttribute("LoginMessage", outMessage);
                session.setAttribute("GSUSERNAME", outUserName);
                oWalletToMerchantPaymentForm.setName(outUserName);
                System.out.println("==>>>>>> " + (String) session.getAttribute("referenceNo"));
                String referenceNo = (String) session.getAttribute("referenceNo");
                String resAmount = (String) session.getAttribute("resAmount");
                String resNarration = (String) session.getAttribute("resNarration");
                String transactionNo = (String) session.getAttribute("transactionNo");
                String resCharge = (String) session.getAttribute("resCharge");
                String redirectUrl = (String) session.getAttribute("redirectUrl");
                System.out.print("Refernece" + redirectUrl);
                oWalletToMerchantPaymentForm.setAmount(resAmount);
                oWalletToMerchantPaymentForm.setOrderNo(referenceNo);
                oWalletToMerchantPaymentForm.setCharge(resCharge);
                oWalletToMerchantPaymentForm.setDescription(resNarration);

                return "wallettomerchantpayment";
            } else {
                //session.setAttribute("sErrorMessage", oMenuGenarationBO.getErrorMessage());
                session.setAttribute("GSMAILID", oWalletToMerchantPaymentForm.getEmail());
                session.setAttribute("KYCMessage", "Please Fill Up Kyc Form");
                return "erappaypaymentlogin";
            }
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            httpclient.close();
        }
        return walletID;
    }


    @RequestMapping(value = "/rediectpaymentpage")
    public String paymentconfirmation(HttpServletRequest request, HttpServletResponse response, Model model,
                                      @ModelAttribute("oWalletToMerchantPaymentForm") WalletToMerchantPaymentForm oWalletToMerchantPaymentForm) throws Exception {
        HttpSession session = request.getSession(true);
        String appServerIp = (String) session.getAttribute("AppServerIp");
        return "paymentconfirmation";
    }
}
