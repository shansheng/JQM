<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://eos.primeton.com/tags/logic" prefix="l"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="/common/js/commscripts.jsp" %>
<!-- 
  - Author(s): wjh
  - Date: 2018-03-07 17:00:50
  - Description:
-->
<head>
<title>风控发起页面</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	
</head>

<body style="width: 100%; height:100%; margin: 0px; overflow:auto;">
<div id="tabs" class="nui-tabs" height="100%"> 
	 <div title="基本信息"> 
		<!-- 主体内容 -->
		<div region="center" style="width:100%; height:570px">
			<l:equal property="cBizType" propertyType="parameter" targetValue="1"  >
				<!-- 一级债交易信息 -->
   				<%@include file="/riskMgr/instruct/firstGradeDabtView.jsp" %>
			</l:equal>
			<l:notEqual property="cBizType"  propertyType="parameter" targetValue="1">
				<!-- 二级债交易信息 -->
	   			<%@include file="/riskMgr/instruct/instructInfoView.jsp" %>
			</l:notEqual>
			
   			<!-- 风控信息 -->
   			<%@include file="/riskMgr/instruct/riskInfoBanTableForApprove.jsp" %>
			
		</div>
	</div> 
</div>	
	<script type="text/javascript">
		nui.parse();
		var lRiskmgrId = "${param.lRiskmgrId}";
		var lResultId = "${param.lResultId}";
		var vcRiskType = "${param.vcRiskType}";
		var cStatus = "${param.cStatus}";
		var pageType = "";
		var isEdit = "n";
		var processInstID = "";
		
		var grid = nui.get("approveRiskGrid");	//风控信息页
		
		$(function(){
			//加载交易信息
			setInstructInfo(lResultId);
			//加载风控表格
			setRiskInfoTable(lRiskmgrId,null,isEdit);
			//加载误卡按钮
			judgeIsBtnAuth();
		})
		
		
		//判断是否有风控误卡废弃权限
		function judgeIsBtnAuth(){
			if(lRiskmgrId==null||lRiskmgrId=="") {
				nui.get("endProcess").hide();
				return;
			}
			var json = nui.encode({vcProductCode:nui.get("vcProductCode").getValue(),lResultId:lResultId,lRiskmgrId:lRiskmgrId});
			$.ajax({   //查询用户选中设计的workItemID
	            url:"com.cjhxfund.ats.riskMgr.riskMgr.judgeIsAuth.biz.ext",
	            data:json,
	            type:'POST',
	            contentType:'text/json',
	            cache : false,
				async: false,
	            success:function(data){
	            	//风控误卡按钮显隐
	            	if(data.btnAuth){
	            		nui.get("endProcess").show();
	            	} else {
	            		nui.get("endProcess").hide();
	            	}
	            }
            });
		}
    </script>
</body>
</html>