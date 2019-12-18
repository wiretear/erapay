package com.era.erapay.SignUp;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.era.erapay.common.CommonBean;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


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

@Controller
public class SignUpController {
	private final Logger logger = LoggerFactory.getLogger(SignUpController.class);
	@Autowired
	CommonBean bean;
    
    @RequestMapping(value= "/signup")
	public String SignUp(Model model, HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("osignUpFormBean")SignUpFormBean osignUpFormBean) {
		 HttpSession session = request.getSession(true);
		String appServerIp = (String) session.getAttribute("AppServerIp");
		 logger.debug("SignUp()");
			session.setAttribute("SignUpMessage", " ");

		    return "SignUpNew";
	}
    @RequestMapping(value= "/signuptest1")
	public String signuptest(Model model, HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("osignUpFormBean")SignUpFormBean osignUpFormBean) {
		 HttpSession session = request.getSession(true);
		String appServerIp = (String) session.getAttribute("AppServerIp");
		 logger.debug("SignUp()");
	
			session.setAttribute("SignUpMessage", " ");
		 return "users/float";
	}

    @RequestMapping(value = "/erapay/executesignup", method = RequestMethod.POST)
	public String Home(HttpServletRequest request, HttpServletResponse response, Model model,
			@ModelAttribute("osignUpFormBean")SignUpFormBean osignUpFormBean) throws Exception {
		String eraPayServerIp=bean.getServerIp();
		String url="http://"+eraPayServerIp;
    	 HttpSession session = request.getSession(true);
		String appServerIp = (String) session.getAttribute("AppServerIp");
		//String serverIp =(String) session.getAttribute("TESTURL");
		String serverIp =(String) session.getAttribute("TESTURL");
		System.out.println("HOST"+serverIp);
		String signupRestRegUrl= url+"/ERAPAY/signupRestReg.do";
          System.out.println("SIGNUPURL"+signupRestRegUrl);

		String userActivityServerUrl= serverIp+"/ERAPAY/userActivityHistory.do";
		    session.setAttribute("LoginMessage", " ");

		    String api_user_id="";
			String api_pass="";
			String terminal_id="";
			String userid ="";
			String sessionid=""; 
			String emailid= "";
			String password ="";
			String outCode="";
			String errorCode="";
			String errorMessage="";
            String outMessage="";
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    		Date today = Calendar.getInstance().getTime();
    		String reportDate = df.format(today);
    		System.out.println("DATE"+reportDate);
			CloseableHttpResponse closeableHttpResponse = null;
	        CloseableHttpClient httpclient = HttpClients.createDefault();
	        HttpPost httpPost = new HttpPost(signupRestRegUrl);
            List<NameValuePair> params = new ArrayList<NameValuePair>();
            params.add(new BasicNameValuePair("api_pass","adduser"));
            params.add(new BasicNameValuePair("name",osignUpFormBean.getUserName()));
            params.add(new BasicNameValuePair("emailid",osignUpFormBean.getEmail()));
            params.add(new BasicNameValuePair("password",osignUpFormBean.getPassword()));
            params.add(new BasicNameValuePair("mobileno",osignUpFormBean.getPhone()));
            params.add(new BasicNameValuePair("signupid"," "));
            params.add(new BasicNameValuePair("signupDate",reportDate));
            params.add(new BasicNameValuePair("oprstamp",osignUpFormBean.getEmail()));
            params.add(new BasicNameValuePair("timstamp",reportDate));
            params.add(new BasicNameValuePair("terminalid","P"));
            try {
            	httpPost.setEntity(new UrlEncodedFormEntity(params));
                closeableHttpResponse = httpclient.execute(httpPost);
                String responseString = EntityUtils.toString(closeableHttpResponse.getEntity(),"UTF-8");
            /*
                System.out.println("Response ===== >>>>> "+responseString);
                String[] parts = responseString.split(",");
                outMessage=parts[0];
                outCode=parts[1];
                //osignUpFormBean.setErrorCode(outCode);
                 */
    			System.out.println("Response ===== >>>>> " + responseString);
    			JSONObject json = new JSONObject(responseString);
    			errorCode=json.getString("Response_Code");
    			errorMessage=json.getString("Response_Status");
    			System.out.println("test jason"+errorCode+"again"+errorMessage);
	 }catch(Exception e){
     	e.printStackTrace();
				session.setAttribute("SignUpMessage", "SERVER ERROR");
     } finally {	        
         httpclient.close();
     }
            if (errorCode.equals("0")) {
				//session.setAttribute("sErrorMessage", oMenuGenarationBO.getErrorMessage());
				session.setAttribute("SignUpMessage", errorMessage);
				return "testlogin";
			}
            else  {
    			//session.setAttribute("sErrorMessage", oMenuGenarationBO.getErrorMessage());
				System.out.println("test jason"+errorCode+"again"+errorMessage);
    			session.setAttribute("SignUpMessage",errorMessage);
    			 return "SignUpNew";
    		}		
	}
	@RequestMapping(value= "/businesssignup")
	public String Business(Model model, HttpServletRequest request, HttpServletResponse response,
						 @ModelAttribute("osignUpFormBean")SignUpFormBean osignUpFormBean) {
		HttpSession session = request.getSession(true);
		String appServerIp = (String) session.getAttribute("AppServerIp");
		logger.debug("SignUp()");
		session.setAttribute("SignUpMessage", " ");
		return "BuisnessSignUp";
	}
	@RequestMapping(value = "/executebusinesssignup", method = RequestMethod.POST)
	public String executebusinesssignup(HttpServletRequest request, HttpServletResponse response, Model model,
					   @ModelAttribute("osignUpFormBean")SignUpFormBean osignUpFormBean) throws Exception {
		HttpSession session = request.getSession(true);
		String appServerIp = (String) session.getAttribute("AppServerIp");
		String serverIp =(String) session.getAttribute("TESTURL");
		String signupRestRegUrl= serverIp+"/ERAPAY/signupRestReg.do";
		String userActivityServerUrl= serverIp+"/ERAPAY/userActivityHistory.do";
		session.setAttribute("LoginMessage", " ");
		String api_user_id="";
		String api_pass="";
		String terminal_id="";
		String userid ="";
		String sessionid="";
		String emailid= "";
		String password ="";
		String outCode="";
		String errorCode="";
		String errorMessage="";
		String outMessage="";
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date today = Calendar.getInstance().getTime();
		String reportDate = df.format(today);
		System.out.println("DATE"+reportDate);
		CloseableHttpResponse closeableHttpResponse = null;
		CloseableHttpClient httpclient = HttpClients.createDefault();
		HttpPost httpPost = new HttpPost(signupRestRegUrl);
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("api_pass","adduser"));
		params.add(new BasicNameValuePair("name",osignUpFormBean.getUserName()));
		params.add(new BasicNameValuePair("emailid",osignUpFormBean.getEmail()));
		params.add(new BasicNameValuePair("password",osignUpFormBean.getPassword()));
		params.add(new BasicNameValuePair("mobileno",osignUpFormBean.getPhone()));
		params.add(new BasicNameValuePair("signupid"," "));
		params.add(new BasicNameValuePair("signupDate",reportDate));
		params.add(new BasicNameValuePair("oprstamp",osignUpFormBean.getEmail()));
		params.add(new BasicNameValuePair("timstamp",reportDate));
		params.add(new BasicNameValuePair("terminalid","C"));
		try {
			httpPost.setEntity(new UrlEncodedFormEntity(params));
			closeableHttpResponse = httpclient.execute(httpPost);
			String responseString = EntityUtils.toString(closeableHttpResponse.getEntity(),"UTF-8");
            /*
                System.out.println("Response ===== >>>>> "+responseString);
                String[] parts = responseString.split(",");
                outMessage=parts[0];
                outCode=parts[1];
                //osignUpFormBean.setErrorCode(outCode);
                 */
			System.out.println("Response ===== >>>>> " + responseString);
			JSONObject json = new JSONObject(responseString);
			errorCode=json.getString("Response_Code");
			errorMessage=json.getString("Response_Status");
			System.out.println("test jason"+errorCode+"again"+errorMessage);
		}catch(Exception e){
			e.printStackTrace();
		} finally {
			httpclient.close();
		}
		if (errorCode.equals("0")) {
			//session.setAttribute("sErrorMessage", oMenuGenarationBO.getErrorMessage());
			session.setAttribute("SignUpMessage", errorMessage);
			return "testlogin";
		}
		else  {
			//session.setAttribute("sErrorMessage", oMenuGenarationBO.getErrorMessage());
			System.out.println("test jason"+errorCode+"again"+errorMessage);
			session.setAttribute("SignUpMessage",errorMessage);
			return "BuisnessSignUp";
		}
	}
		}

