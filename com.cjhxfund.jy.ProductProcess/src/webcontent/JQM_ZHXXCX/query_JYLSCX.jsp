<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="/common/js/commscripts.jsp" %>

<head>
<title>交易流水查询</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    
</head>

<body style="width:99.6%;height:99.6%;">
<div  class="nui-tabs"  style="width:100%;height:100%;" activeIndex="0" id="tab1">
	   		</div>
	<script type="text/javascript">
    	nui.parse();
    	//tab页权限处理
		 nui.ajax({
			url:"com.cjhxfund.ats.fm.comm.common.queryMenuList.biz.ext",
            type:'POST',
            data:{funcCode:"ATS_ZHXXCX_YHJCJHB,ATS_ZHXXCX_JYSCJHB,ATS_ZHXXCX_YHJHG,ATS_ZHXXCX_JYSHG,ATS_ZHXXCX_TYCK,ATS_ZHXXCX_JYSZQXYHG,ATS_ZHXXCX_CWZXCJ"},//
            cache:false,
            contentType:'text/json',
            success:function(text){
            	var result = nui.decode(text.treeNodes);
	        	if(result){
			        var tempArray = new Array();	        		
	        		for(var k=0;k<result.length;k++){
	        			if(result[k].RES_ID=="ATS_ZHXXCX_YHJCJHB"){
							tempArray[0]=result[k];
						}
						if(result[k].RES_ID=="ATS_ZHXXCX_JYSCJHB"){
							tempArray[1]=result[k];
						}
						if(result[k].RES_ID=="ATS_ZHXXCX_YHJHG"){
							tempArray[2]=result[k];
						}
						if(result[k].RES_ID=="ATS_ZHXXCX_JYSHG"){
							tempArray[3]=result[k];
						}
						if(result[k].RES_ID=="ATS_ZHXXCX_TYCK"){
							tempArray[4]=result[k];
						}	
						if(result[k].RES_ID=="ATS_ZHXXCX_JYSZQXYHG"){
							tempArray[5]=result[k];
						}		
						if(result[k].RES_ID=="ATS_ZHXXCX_CWZXCJ"){
							tempArray[6]=result[k];
						}		
	        		}
	        		
		        	for(var i=0;i<tempArray.length;i++){
		        		if(tempArray[i]!=null){
					    	var actionURL = '<%=request.getContextPath()%>'+tempArray[i].FUNCACTION;
					    	
							var tabs = nui.get("tab1"); 
							
					        var tab = {title: tempArray[i].FUNCNAME,url:actionURL,showCloseButton:false,refreshOnClick:"true"};
					        var tab1 = tabs.addTab(tab);    
				        }        			        
			        }
			        var tabs = nui.get("tab1");
			        var tab1 = tabs.getTab(0);
                    tabs.activeTab(tab1);	 
	            }
            }
		 });
		 
    </script>
</body>
</html>