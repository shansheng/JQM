<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.eos.access.http.security.config.HttpSecurityConfig"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.primeton.cap.AppUserManager"%>
<html>
<!-- 
  - Author(s): shitf
  - Date: 2013-03-04 16:22:15
  - Description:
-->
<head>
<%@include file="/common.jsp"%>
<script src="<%= request.getContextPath() %>/common/nui/locale/zh_CN.js" type="text/javascript"></script>
<title>修改密码</title>
<%
   String url = null;
   HttpSecurityConfig securityConfig = new HttpSecurityConfig();
   boolean isOpenSecurity = securityConfig.isOpenSecurity();
   if(isOpenSecurity){
   		boolean isAllInHttps = securityConfig.isAllInHttps();
   		if(!isAllInHttps){
   			String ip = securityConfig.getHost();
   			String https_port = securityConfig.getHttps_port();
   			url = "https://" + ip + ":" + https_port + request.getContextPath() + "/coframe/rights/user/org.gocom.components.coframe.rights.user.cipher.update_password.flow";
   		}else{
   			url = "org.gocom.components.coframe.rights.user.cipher.update_password.flow"; 
   		}
   }else{
   		url = "org.gocom.components.coframe.rights.user.cipher.update_password.flow";
   }
 %>
</head>
<body>
<div style="padding-top:5px;">
	<form method="post" id = "form1"	name="UpdateForm" action="<%=url%>"  onsubmit="return checkFormSelf(this);">
		<input id="operatorId" class="nui-hidden" name="user/operatorId" />
		<input id="userId" class="nui-hidden" name="user/userId" value="<%=AppUserManager.getCurrentUserId() %>"/>
		<table class="nui-form-table" style="width:100%;">
	      <tr>
	        <th class="nui-form-label" style="width:110px;"><label for="user.userId$text">当前用户：</label></th>
	        <td>
	          <input id="currentUser" class="nui-textbox nui-form-input" value="<%=AppUserManager.getCurrentUserId() %>" enabled="false" />
	        </td>
	      </tr>
	      <tr class="odd">
	        <th class="nui-form-label"><label for="password$text">输入旧密码：</label></th>
	        <td>
	          <input id="password" class="nui-password nui-form-input" name="password" required="true" onvalidation="onCheckRight"/>
	        </td>
	      </tr>
	      <tr>
	        <th class="nui-form-label"><label for="pwd1$text">输入新密码：</label></th>
	        <td>
	          <input class="nui-password nui-form-input" id="pwd1" required="true" onvalidation="onCheckPwd"/>
	        </td>
	      </tr>
	      <tr class="odd">
	        <th class="nui-form-label"><label for="pwd2$text">确定新密码：</label></th>
	        <td>
	          <input class="nui-password nui-form-input" id="pwd2" name="user/password" required="true" onvalidation="onCheckEqual"/>
	        </td>
	      </tr>
	    </table>
	    <div class="nui-toolbar" style="border:0;padding:0px;">
		   <table width="100%">
		      <tr>
		        <td style="text-align:center;">
		          <a class='nui-button' plain='false' iconCls="icon-save" onclick="save">保存</a>
              <span style="display:inline-block;width:25px;"></span>
              <a class='nui-button' plain='false' iconCls="icon-cancel" onclick="cancel">取消</a>
		        </td>
		      </tr>
		   </table>
		</div>
	</form>
</div>

<script type="text/javascript">    
    nui.parse();

    function save () {
      var form = document.getElementById("form1");
      if(checkFormSelf("#form1") == false){
        return false;
      }
      form.submit();
    }

     

    <%
    	Object result = request.getAttribute("retValue");
    	String retValue = "";
     	if(result != null){
     		retValue = (String)result;
     		if(retValue.equals("true")){
     			out.println("setSuccess()");
     		}else if(retValue.equals("false")){
				out.println("setError()");  
     		}
     	}
     %>
	function setError(){
    	nui.alert("原密码填写错误！");
    }    
    function setSuccess(){
    	nui.alert("密码修改成功！");
    	window.close();
    }
    function cancel(){
      CloseWindow("cancel");
    }
    
    function onCheckRight(e){
      if(e.isValid){
       // if(retValue=="false"){
        //   e.errorText = "密码不正确";
        //   e.isValid = false;
       // }
      }
    }
  
    function onCheckEqual(e){
      if(e.isValid){
        var pwd = nui.get("pwd1").value;
        if(e.value!=pwd){
          e.errorText = "新密码不一致";
          e.isValid = false;
        }
      }
    }
    
    function checkFormSelf(form1){
    	var form = new nui.Form(form1);//将普通form转为nui的form
 		form.validate();
      	if (form.isValid() == true) {
      		return true;
      	}
    	return false;
    }
    
    function CloseWindow(action){
      if(action=="close" && form.isChanged()){
        if(confirm("数据已改变,是否先保存?")){
          return false;
        }
      }else if(window.CloseOwnerWindow) 
        return window.CloseOwnerWindow(action);
      else
        return window.close();
    }
    
    //验证复杂密码，必须包含数字、特殊字符与字母，最小为8位
    function onCheckPwd(e){
      var regex = new RegExp('(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{8,30}');
      var pwd1 = nui.get("pwd1").getValue();
      if (!regex.test(pwd1) || pwd1.length < 8) {
          e.errorText = "密码必须包含数字、字母、特殊字符且不少于8位";
          e.isValid = false;
      }
    }
  </script>
</body>
</html>
