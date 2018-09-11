<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="/common.jsp" %>
<!-- 
  - Author(s): 童伟
  - Date: 2017-06-21 15:58:24
  - Description:债券买卖交易员指令详细页
-->
<head>
<title>指令/建议详情</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script type="text/javascript" src="<%=contextPath%>/scripts/com.cjhxfund.js.base/utils/DateUtil.js"></script>
    <script type="text/javascript" src="<%= request.getContextPath() %>/riskMgr/js/riskMgrComm.js"></script>
    <style type="text/css">
    	tr{
		    display: table-row;
		    vertical-align: inherit;
		    border-color: inherit;
		}
		.nui-form-table {
		    border-collapse: collapse;
		    border: none;
		    padding-left: 5px;
		}
		.nui-form-table tr td{
			 padding-right:0;
		}
    </style>
</head>
<body>
	<div id="instructDetail_grid">
        <table class="nui-form-table" class="nui-form-table" style="width:100%; heiht:100%;">
            <tr>
                <td align="right" width="150"><span style="color: red;">*</span>产品名称：</td>
                <td width="180">    
                    <input name="instructInfo.vcProductName" class="nui-textbox" required="true" readonly/>
                </td>
                <td align="right" width="150"><span style="color: red">*</span>净价/全价：</td>
                <td width="180">    
                    <span><input style="width:65px" class="nui-textbox" id="enNetPrice" name="instructInfo.enNetPrice" required="true" readonly/></span>
					/
					<span><input style="width:65px" class="nui-textbox" id="enFullPrice" name="instructInfo.enFullPrice" required="true" readonly/></span>
                </td>
            </tr>
            <tr>
                <td align="right" width="150"><span style="color: red">*</span>组合名称：</td>
                <td width="180">    
                    <input name="instructInfo.vcCombiName" class="nui-textbox" required="true" readonly/>
                </td>
                <td align="right" width="150" id="MaturityLab"><span style="color: red">*</span>到期/行权收益率：</td>
				<td width="180" id="MaturityField">
					<span><input style="width:65px" class="nui-textbox" id="enMaturityYield" name="instructInfo.enMaturityYield" required="true" readonly/></span> 
					<label id="MaturityLabSplit">/</label> 
					<span><input style="width:65px" class="nui-textbox" id="enOptionYield"  name="instructInfo.enOptionYield" required="true" readonly/></span>
				</td>
            </tr>
            <tr>
                <td align="right" width="150"><span style="color: red">*</span>债券代码：</td>
                <td width="180">    
                    <input name="instructInfo.vcStockCode" class="nui-textbox" required="true" readonly/>
                </td>
                <td align="right" width="150"><span style="color: red">*</span>债券名称：</td>
                <td width="180">    
                    <input name="instructInfo.vcStockName" class="nui-textbox"  required="true" style="width:143px" readonly/>
                </td>
            </tr>  
            <tr>
                <td align="right" width="150"><span style="color: red">*</span>委托方向：</td>
                <td width="180">    
                    <input name="instructInfo.vcEntrustDirection" class="nui-dictcombobox" valueField="dictID" textField="dictName" dictTypeId="entrustDirection" required="true" readonly/>
                </td>
                <td align="right" width="150"><span style="color: red">*</span>交易日期：</td>
                <td width="180">                        
                    <input name="instructInfo.lTradeDate" class="nui-textbox" required="true" style="width:143px" readonly/>
                </td>
            </tr>
            <tr>
                <td align="right" width="150"><span style="color: red">*</span>清算速度：</td>
                <td width="180">    
                    <input name="instructInfo.vcSettleSpeed" class="nui-dictcombobox" valueField="dictID" textField="dictName" dictTypeId="settleSpeed" required="true" readonly/>
                </td>
                <td align="right" width="150"><span style="color: red">*</span>结算日期：</td>
                <td width="180">    
                    <input name="instructInfo.lFirstSettleDate" class="nui-textbox" required="true" style="width:143px" readonly/>
                </td>
            </tr>
            
           	<!-- 银行间业务 --> 
            <tr id="interBankBiz1">
                <td align="right" width="150"><span style="color: red">*</span>券面金额（万元）：</td>
                <td width="180">    
                	<input name="instructInfo.enFaceAmount1" class="nui-spinner" minValue="0" maxValue="10000000000" format="n2" required="true" readonly/>
                </td>
                <td align="right" width="150"><span style="color: red">*</span>交易对手：</td>
                <td width="180"> 
                	<input name="instructInfo.vcCounterpartyName1" class="nui-textbox" required="true" style="width:143px" readonly/>   
                </td>
            </tr>
            <tr id="interBankBiz2">
                <td align="right" width="150"><span style="color: red">*</span>对方交易员：</td>
                <td width="180">    
                    <input name="instructInfo.vcCounterpartyTrader1" class="nui-textbox" required="true" readonly/>
                </td>
                <td align="right" width="150">对手主体机构：</td>
                <td width="180">    
                    <input name="instructInfo.vcCounterpartyOrgan1" class="nui-textbox" required="true" style="width:143px" readonly/>
                </td>
            </tr>   
            
            <!-- 上交所固收平台 --> 
            <tr id="sjsgsBiz1">
                <td align="right" width="150"><span style="color: red">*</span>券面金额（万元）：</td>
                <td width="180">    
                	<input name="instructInfo.enFaceAmount" class="nui-spinner" minValue="0" maxValue="10000000000" format="n2" required="true" readonly/>
                </td>
                <td align="right" id="enNetPriceAmountText" width="150"><span style="color: red">*</span>净价金额：</td>
                <td width="180" id="enNetPriceAmountValue">    
                	<input name="instructInfo.enNetPriceAmount" class="nui-spinner" minValue="0" maxValue="10000000000" format="n2" required="true" style="width:143px" readonly/>
                </td>
                <td align="right" id="enFullPriceAmountText" width="150"><span style="color: red">*</span>全价金额：</td>
                <td width="180" id="enFullPriceAmountValue">    
                	<input name="instructInfo.enFullPriceAmount" class="nui-spinner" minValue="0" maxValue="10000000000" format="n2" required="true" style="width:143px" readonly/>
                </td>
            </tr>  
            <tr id="sjsgsBiz2">
                <td id="sjsgs_vcCounterpartyTrader_text" align="right" width="150"><span style="color: red">*</span>对方交易员：</td>
                <td id="sjsgs_vcCounterpartyTrader_value" width="180">    
                    <input name="instructInfo.vcCounterpartyTrader" class="nui-textbox" required="true" readonly/>
                </td>
                <td id="sjsdz_vcRivalSeat_text" align="right" width="150"><span style="color: red">*</span>对手席位：</td>
                <td id="sjsdz_vcRivalSeat_value" width="180">    
                    <input name="instructInfo.vcRivalSeat" class="nui-textbox" required="true" readonly/>
                </td>
                <td align="right" width="150"><span style="color: red">*</span>交易对手：</td>
                <td width="180"> 
                	<input name="instructInfo.vcCounterpartyName" class="nui-textbox" required="true" style="width:143px" readonly/>   
                </td>
            </tr>  
            <tr id="sjsgsBiz3">
            	<td align="right" width="150"><span style="color: red">*</span>约定号：</td>
                <td width="180">    
                    <input name="instructInfo.vcAgreemtCode" class="nui-textbox" required="true" readonly/>
                </td>
                <td align="right" width="150">对手主体机构：</td>
                <td width="180">    
                    <input name="instructInfo.vcCounterpartyOrgan" class="nui-textbox" required="true" style="width:143px" readonly/>
                </td>
            </tr>
            <tr>
				<td align="right" width="150">询价交易员:</td>
				<td><input class="nui-textbox" name="instructInfo.lInquiryTrader" readonly/></td>
				<td align="right" width="150">实际对手方:</td>
				<td><input class="nui-textbox"  name="instructInfo.lActuallyCounterParty"  style="width: 140px" readonly/></td>
			</tr>
            <tr>
                <td align="right" width="150">备注：</td>
                <td colspan="3" style="width:493px;">    
                    <input name="instructInfo.vcRemark" class="nui-textarea" style="width:493px;" required="true" readonly/>
                </td>
            </tr>           
        </table>
    </div>  
    <div class="nui-toolbar" id="confirmInquiryInfo" style="display:none"> 
        <table class="nui-form-table" style="padding:0px; width:100%;" borderStyle="border:0;">
        	<tr>
        		<td align="center" style="text-align:center;" colspan="4">
        			<a class="nui-button" plain="false" iconCls="icon-tip" id="exactrisk" enabled="false" onclick="riskControlTrial()">风控试算</a>
        			<span style="display:inline-block;width:25px;"></span>
        			<a class="nui-button" plain="false" iconCls="icon-ok" id="confirm" enabled="false" onclick="investManagerConfirm()">确认</a>
        			<span style="display:inline-block;width:25px;"></span>
        			<a class="nui-button" plain="false" iconCls="icon-no" id="backConfirm" enabled="false" onclick="backTasks()">退回</a>
        			<span style="display:inline-block;width:25px;"></span>
        			<a class='nui-button' plain='false' iconCls="icon-cancel" onclick="CloseWindow('close')">关闭</a>
        		</td>
        	</tr>
        </table>
	</div>    
    <div class="nui-toolbar" id="inputInquiryInfo" style="border:0;"> 
        <table class="nui-form-table" style="padding:0px; width:100%;" borderStyle="border:0;">
        	<tr>
        		<td align="center" style="text-align:center;" colspan="3">
        			<a class='nui-button' plain='false' iconCls="icon-edit" id="editOrCommit" enabled="false" onclick="editClick()">修改/提交</a>
        			<span style="display:inline-block;width:25px;"></span>
        			<a class='nui-button' plain='false' iconCls="icon-cancel" onclick="CloseWindow('close')">关闭</a>
        		</td>
        	</tr>
        </table>
    </div>
    <div class="nui-toolbar" id="inquiryDetail" style="display:none"> 
        <table class="nui-form-table" style="padding:0px; width:100%;" borderStyle="border:0;">
        	<tr>
        		<td align="center" style="text-align:center;" colspan="3">
        			<a class='nui-button' plain='false' iconCls="icon-cancel" onclick="CloseWindow('close')">关闭</a>
        		</td>
        	</tr>
        </table>
    </div>    
	<!--输入项完整指令/建议end  -->
	<script type="text/javascript">
    	nui.parse();
    	$("#instructDetail_grid .mini-buttonedit-button").remove();
    	var instruct_detail_from = new nui.Form("#instructDetail_grid");
    	var row = "";
    	var instructCheckUser = "";
    	var lResultId = null;
    	var backReturnJson = null;
    	var riskFlagParam = null; 
    	var lResultIdParam = null;
		var lRiskmgrIdParam = null;
		var workItemID = null;
    	
    	function setFormData(data,webType){
    		//跨页面传递的数据对象，克隆后才可以安全使用
    		row = nui.clone(data);
    		if(webType == "confirm"){
    			if(row.cIsValid=="1"){//在指令/建议状态为有效的前提下控制流程样式
				//流程处理状态:-2-询价结果待提交,-1-询价结果待确认,2A-预置指令/建议待激活,
				//4-待风控审批,5-待交易录单,6-待录单复核,7-待前台成交,8-前台已成交,9-后台已成交
					if(DateUtil.toNumStr(new Date())==row.lTradeDate){
						if(row.vcProcessStatus=="-1"){
							if(combiAuthorityJudgment(row.vcProductCode, row.vcCombiCode, "02")){	//拥有投资经理权限
								nui.get("confirm").enable();
								nui.get("backConfirm").enable();
								nui.get("exactrisk").enable();
							}
						}else if(row.vcProcessStatus=="3"){
							if(row.workitemid != null){			// 是否是待办参与人 
								nui.get("confirm").enable();
								nui.get("exactrisk").enable();
								nui.get("backConfirm").enable();
							}
						}
					}
				} 
    			document.getElementById("inputInquiryInfo").style.display = "none";
    			document.getElementById("confirmInquiryInfo").style.display= "";
    			document.getElementById("confirmInquiryInfo").style.border= "0";
    		}else if(webType == "detail"){
    			document.getElementById("inputInquiryInfo").style.display = "none";
    			document.getElementById("inquiryDetail").style.display = "";
    		}else{
    			if(row.cIsValid=="0"){
					if(row.vcProcessStatus=="-2"){
						if(getProductHandleByInstructrionInput(row.vcProductCode, row.vcCombiCode)){
							nui.get("editOrCommit").enable();
						}
					}
				}
    		}
    		if(row.lFirstSettleDate != null){
				row["lFirstSettleDate"] = nui.formatDate(DateUtil.numStrToDate(row["lFirstSettleDate"].toString()),"yyyy-MM-dd");
			}
			if(row.lTradeDate != null){
				row["lTradeDate"] = nui.formatDate(DateUtil.numStrToDate(row["lTradeDate"].toString()),"yyyy-MM-dd");
			}
			// 对方交易员
			if(row.vcCounterpartyTrader != null){
				row["vcCounterpartyTrader1"] = row.vcCounterpartyTrader;
			}
			// 券面金额
			if(row.enFaceAmount != null){
				row["enFaceAmount1"] = row.enFaceAmount;
			}
			//交易对手
			if(row.vcCounterpartyName != null){
				row["vcCounterpartyName1"] = row.vcCounterpartyName;
			}
			//对手主体机构
			if(row.vcCounterpartyOrgan != null){
				row["vcCounterpartyOrgan1"] = row.vcCounterpartyOrgan;
			}
			instruct_detail_from.setData({instructInfo:row});
			if(row.vcBizType == "1"){		
				// 买卖银行间业务显示
				document.getElementById("sjsgsBiz1").style.display = "none";
				document.getElementById("sjsgsBiz2").style.display = "none";
				document.getElementById("sjsgsBiz3").style.display = "none";
			}else if(row.vcBizType == "2" || row.vcBizType == "4"){
				// 买卖上海大宗交易业务和深交所业务显示
				document.getElementById("sjsgs_vcCounterpartyTrader_text").style.display = "none";
				document.getElementById("sjsgs_vcCounterpartyTrader_value").style.display = "none";
				document.getElementById("interBankBiz1").style.display = "none";
				document.getElementById("interBankBiz2").style.display = "none";
				// 上交所大宗 显示对手席位， 上交所固收显示对方交易员, 其他字段一致				
			}else if(row.vcBizType == "3"){
				// 买卖上海固收平台业务显示
				document.getElementById("sjsdz_vcRivalSeat_text").style.display = "none";
				document.getElementById("sjsdz_vcRivalSeat_value").style.display = "none";
				document.getElementById("interBankBiz1").style.display = "none";
				document.getElementById("interBankBiz2").style.display = "none";
			}
			
			// 显示净价金额或者全价金额
			if(row.vcBizType == "1"){		
				// 买卖银行间业务显示
				document.getElementById("enFullPriceAmountValue").style.display = "none";
			}else if(row.vcBizType == "2" || row.vcBizType == "3" || row.vcBizType == "4"){
				// 买卖上海大宗交易业务和深交所业务显示和上交所固收
				if(row.enNetPriceAmount != null && row.enNetPriceAmount != ""){
					// 隐藏全价
					document.getElementById("enFullPriceAmountText").style.display = "none";
					document.getElementById("enFullPriceAmountValue").style.display = "none";
				}else{
					// 展示全价
					document.getElementById("enNetPriceAmountText").style.display = "none";
					document.getElementById("enNetPriceAmountValue").style.display = "none";
				}
			}
			// 到期/行权收益率显示
			showYield(row.vcStockCode,row.vcMarket);
    	}
    	
    	//关闭窗口
		function CloseWindow(action) {
		    if (window.CloseOwnerWindow)
		    return window.CloseOwnerWindow(action);
		    else window.close();
		}
		
		// 到期/行权收益率显示
		function showYield(vcStockCode,vcMarketNo){
			var parameter={vcStockCode:vcStockCode,vcMarketNo:vcMarketNo};
			nui.ajax({
				url:"com.cjhxfund.ats.sm.comm.TBondBaseInfoManager.getAppointBondInfo.biz.ext",
				type : 'POST',
				data : {condition:parameter},
				cache : false,
				contentType : 'text/json',
				success : function(text) {
					var returnJson = nui.decode(text);
					if(returnJson.exception == null){
						var vcSpecialText = null;
						if(returnJson.bondBasicInfo.length>0){
							vcSpecialText = returnJson.bondBasicInfo[0].vcSpecialText;
						}else{
							return;
						}
						
						if(vcSpecialText && (vcSpecialText.indexOf("回售条款")>=0 || vcSpecialText.indexOf("赎回条款")>=0)){
							$("#MaturityLab").html("<span style='color: red'>*</span>到期/行权收益率:");
							$("#enOptionYield").show();
						}else{
							$("#MaturityLab").html("<span style='color: red'>*</span>到期收益率:");
							$("#enOptionYield").hide();
							$("#MaturityLabSplit").hide();
						}
					}
				}
			});
		}
		
		//投资经理确认询价结果
		function investManagerConfirm(){
			row.lTradeDate = row.lTradeDate.replace("//-");
			row.lFirstSettleDate = row.lFirstSettleDate.replace("//-");
			var reg =/(\d{4})\-(\d{2})\-(\d{2})/;
		    row.lTradeDate = row.lTradeDate.replace(reg,"$1$2$3");
		    row.lFirstSettleDate = row.lFirstSettleDate.replace(reg,"$1$2$3");
			if(row.workitemid != null && row.workitemid != ""){		//修改后确认
				var checkResult = 1;	//1=确认，0=退回
				/**风控管理开始**/
				if(row.instructSource!='2' && (row.vcBizType=="1" || row.vcBizType=="3") && judgeRiskTest(workItemID)){
					workItemID = row.workitemid;
					var returnJson = judgeRiskInfo(workItemID, null);	//判断是否有复核节点
					
					if(returnJson.rtnObject.rtnCode=='-1'){		//投资经理不存在
						alert(returnJson.rtnObject.rtnMsg);		//不允许提交
					}else if(returnJson.rtnObject.rtnCode=='1' || returnJson.rtnObject.rtnCode=='2'){	//风控管理存在数据
						if(returnJson.riskInfo.cStatus=='2'){	//风控通过
							checkRiskInfoApprove(workItemID, false);	//校验可用
						}else if(returnJson.workItemDetail.activityDefID=="manualActivity2A"){	//投资经理节点
							nui.alert("风控流程审批未通过，暂不能提交！");
						}else if(returnJson.riskInfo.cStatus=='0' || returnJson.riskInfo.cStatus=='5'){
							checkRiskInfoApprove(workItemID);	//重新调用风控接口
						}else{
							if(returnJson.workItemDetail.activityDefID=="manualActivity1" || returnJson.workItemDetail.activityDefID=="manualActivity111"){
								nui.confirm("风控流程未审批完成，复核通过后会停留在下一节点！","系统提示",function(action){
									if(action=="ok"){
										checkRiskInfoApprove(workItemID, false);	//校验可用
									}
								});
							}else{
								checkRiskInfoApprove(workItemID, false);	//校验可用
							}
						}
					}else{	//风控管理不存在数据
						if(returnJson.workItemDetail.activityDefID=="manualActivity2A"){	//投资经理节点
							checkRiskInfoApprove(workItemID, false);	//校验可用
						}else{	//非投资经理节点
							checkRiskInfoApprove(workItemID);	//重新调用风控接口
						}
					}
					
					return;
				}
				/**风控管理结束**/
				
		        var a = nui.loading("正在处理中,请稍等...","提示");
		        nui.ajax({
		            url: "com.cjhxfund.ats.sm.comm.TaskManager.approveAvailValidate.biz.ext",
		            type: "post",
		            contentType:'text/json',
		            data:{workItemID:row.workitemid, checkResult:checkResult, checkComments:""}, 
		            success: function (text) {
		            	nui.hideMessageBox(a);
		            	var returnJson = nui.decode(text);
		            	if(returnJson.exception == null){
							if(returnJson.rtnCode == "<%=com.cjhxfund.commonUtil.Constants.ATS_SUCCESS%>"){
					    		var alsertMsg = "";
					    		if(checkResult=="0"){
					    			if(returnJson.rtnMsg){
					    				alsertMsg = "</br>此单已退回！</br>退回原因："+returnJson.rtnMsg;
					    			}
					    			nui.alert("操作成功！"+alsertMsg,"系统提示",function(action){
						    			if(action == "ok"){
						    				window.CloseWindow("ok");
						    			}
					    			});
					    		}else{
					    			if(returnJson.rtnMsg){
					        			alsertMsg = "</br>【该投资建议/指令触发以下风控：</br>"+returnJson.rtnMsg+"】</br>";
					        		}
					        		nui.alert("审批成功"+alsertMsg,"系统提示",function(action){
						    			if(action == "ok"){
						    				window.CloseWindow("ok");
						    			}
					    			}); 
					    		}
					    		
							}else if(returnJson.rtnCode == "<%=com.cjhxfund.commonUtil.Constants.ATS_ERROR%>"){
								nui.alert("审批失败</br>"+returnJson.rtnMsg,"系统提示",function(action){
									if(action == "ok"){
					    				window.CloseWindow("ok");
					    			}
								});
								
							}else if(returnJson.rtnCode == "<%=com.cjhxfund.commonUtil.Constants.ATS_ORDER_NO_RCV_FR_O32%>"){
								nui.alert("审批成功"+"</br>"+returnJson.rtnMsg,"系统提示",function(action){
					    			if(action == "ok"){
					    				window.CloseWindow("ok");
					    			}
								}); 
							}else if(returnJson.rtnCode == "<%=com.cjhxfund.commonUtil.Constants.ATS_RISK_VIOLATE_FORBID_CTRL%>"){
								nui.alert("审批失败,触发禁止风控,风控信息如下：</br>"+returnJson.rtnMsg,"系统提示",function(action){
					    			if(action == "ok"){
					    				window.CloseWindow("ok");
					    			}
								});
								
							}else if(returnJson.rtnCode == "<%=com.cjhxfund.commonUtil.Constants.ATS_ORDER_USABLE_AMOUNT_INSUFFICIENT%>"){
								nui.alert("审批失败</br>"+returnJson.rtnMsg,"系统提示",function(action){
					    			if(action == "ok"){
					    				window.CloseWindow("ok");
					    			}
								});
							}else{
								nui.alert("操作异常","系统提示");
							}
						}else{
							nui.alert("系统异常","系统提示");
						}
		            }
		        });
			}else {
				
				/**风控管理开始**/
				if(row.instructSource!='2' && (row.vcBizType=="1" || row.vcBizType=="3") && judgeRiskTest(null, row)){
					var returnJson = judgeRiskInfo(null, row);	//判断是否存在风控、及是否有后续节点
					
					if(returnJson.rtnObject.rtnCode=='-1'){	
						alert(returnJson.rtnObject.rtnMsg);	//出错
					}else if(returnJson.rtnObject.rtnCode=='1' || returnJson.rtnObject.rtnCode=='2'){	//风控管理存在数据
						if(returnJson.riskInfo.cStatus=='2'){
							checkRiskInfoInquiryApprove(getRiskParam(), "false");	//校验可用
						}else{
							if(returnJson.riskInfo.cStatus=='0'){
								checkRiskInfoInquiryApprove(getRiskParam());
							}else{
								nui.alert("风控流程审批未通过，暂不能提交！");
							}
						}
					}else{
						checkRiskInfoInquiryApprove(getRiskParam(), "false");	//校验可用
					}
					
					return;
				}
				/**风控管理结束**/
				
				var a = nui.loading("正在处理中,请稍等...","提示");
				nui.ajax({
					url : "com.cjhxfund.ats.sm.inquiry.inquiryInstruction.investManagerConfirm.biz.ext",
					type : 'POST',
					data : {instructParameter:row},
					cache : false,
					contentType : 'text/json',
					success : function(text) {
						nui.hideMessageBox(a);
						var returnJson = nui.decode(text);
						if(returnJson.exception == null){
							if(returnJson.rtnCode == "<%= com.cjhxfund.commonUtil.Constants.ATS_SUCCESS %>"){
								var riskMsg = returnJson.riskMsg;
		            			if(riskMsg && riskMsg.isAgainstRisk){
		            				riskMsg["alertMsg"]="确认成功！";
		            				nui.open({
				                        url: "<%=request.getContextPath()%>/fix/riskControlDetailList.jsp",
				                        title: "风控信息",
				                        width: 800,
				                        height: 422,
				                        onload: function () {
				                            var iframe = this.getIFrameEl();
				                            iframe.contentWindow.SetData(riskMsg,3);
				                        },
				                        ondestroy: function (action) {
				                            CloseWindow("ok");
				                        }
				                    });
		            			}else{
			            			nui.alert("确认成功！","提示",function(){
										finishInstructWorkitemFisish();
					                });
		            			}
				    		}else if(returnJson.rtnCode =="<%= com.cjhxfund.commonUtil.Constants.ATS_ORDER_NO_RCV_FR_O32 %>"){
				            	nui.alert(returnJson.rtnMsg,"提示");
				            	return;
				            }else if(returnJson.rtnCode == "<%= com.cjhxfund.commonUtil.Constants.ATS_ERROR %>") {
				    			var riskMsg = returnJson.riskMsg;
		            			if(riskMsg && riskMsg.isAgainstRisk){
		            				riskMsg["alertMsg"]="确认失败！";
		            				nui.open({
				                        url: "<%=request.getContextPath()%>/fix/riskControlDetailList.jsp",
				                        title: "风控信息",
				                        width: 800,
				                        height: 422,
				                        onload: function () {
				                            var iframe = this.getIFrameEl();
				                            iframe.contentWindow.SetData(riskMsg,3);
				                        }
				                    });
		            			}else{
		            				nui.alert("确认失败！</br>"+returnJson.rtnMsg,"提示");
		            			}
				            }
						}else{
							nui.alert("系统异常，请联系管理员","提示");
						}
					}
				});
			}
		}
		
		
		/**风控管理开始**/
		function getRiskParam(){
			var parameter = nui.clone(row);
			parameter["callRiskType"]="3";//1-风控试算
			parameter["symbol"]=parameter.vcStockCode;//证券申报代码
			if(parameter.vcBizType=="1"){
				parameter["businClass"]="2";//2-银行间业务
				parameter["exdestination"]="OTC";//交易场所：OTC-场外
			}else if(parameter.vcBizType=="3"){
				parameter["businClass"]="I";//I-上交所固定收益平台
				parameter["exdestination"]="SS";//交易场所：SS-上交所
			}
			parameter["vcInvestType"]="1";//投资类型：1-可交易
			parameter["ordtype"]="2";//证券控制类型:1-金额控 、2-数量控、缺省按2-数量控
			parameter["vcFirstSettleMode"]="3";//结算方式（首次结算方式）：1-见款付券\2- 见券付款\3-券款对付\4-纯券过户)
			parameter["vcMaturitySettleMode"]="3";//结算方式（到期结算方式）：1-见款付券\2- 见券付款\3-券款对付\4-纯券过户
			parameter["lTradeDate"]=parameter.lTradeDate.replace("//-");
		    var reg =/(\d{4})\-(\d{2})\-(\d{2})/;
		    parameter["lTradeDate"] = parameter.lTradeDate.replace(reg,"$1$2$3");
		    parameter["lFirstSettleDate"] = parameter.lFirstSettleDate.replace(reg,"$1$2$3");
			var riskParam = {};
			riskParam = {instructParameter:parameter};
			return riskParam;
		}
		
		function subData(riskReturn, instructJson){
			var riskFlag = "";
			if(workItemID==null || workItemID==""){
				riskFlag = showRiskInfoInquiryApprove(riskReturn, instructJson);
			}else{
				riskFlag = showRiskInfoApprove(riskReturn, instructJson);
			}
			riskControl(riskFlag, instructJson);
		}
		function riskControl(riskFlag, instructJson){
			riskFlagParam = riskFlag;
			lResultIdParam = instructJson.instructParameter.lResultId;
			lRiskmgrIdParam = instructJson.instructParameter.lRiskmgrId;
        	if(riskFlag=='-1'){
        		return;
        	}else if(riskFlag=='1' || riskFlag=='2'){
        		if(workItemID==null || workItemID==""){
					finishInquiryWorkitem();
				}else{
					finishInstructWorkitem(workItemID, '1', '');
				}
        	}else if(riskFlag=='-2'){
        		startRiskProcessInstruct(lResultIdParam, lRiskmgrIdParam);
        	}
        }
        function finishInstructWorkitemFisish(){
        	if(riskFlagParam=='2'){
        		startRiskProcessInstruct(lResultIdParam, lRiskmgrIdParam);
        	}
			window.CloseWindow("ok");
        }
		function finishInquiryWorkitem(){
			var instructParameter = nui.clone(row);
			//日期格式转换
			instructParameter["lTradeDate"]=instructParameter.lTradeDate.replace("//-");
			instructParameter["lFirstSettleDate"]=instructParameter.lTradeDate.replace("//-");
		    var reg =/(\d{4})\-(\d{2})\-(\d{2})/;
		    instructParameter["lTradeDate"] = instructParameter.lTradeDate.replace(reg,"$1$2$3");
		    instructParameter["lFirstSettleDate"] = instructParameter.lFirstSettleDate.replace(reg,"$1$2$3");
			var a = nui.loading("正在处理中,请稍等...","提示");
			nui.ajax({
				url : "com.cjhxfund.ats.sm.inquiry.inquiryInstruction.investManagerConfirm.biz.ext",
				type : 'POST',
				data : {instructParameter:instructParameter},
				cache : false,
				contentType : 'text/json',
				success : function(text) {
					nui.hideMessageBox(a);
					var returnJson = nui.decode(text);
					if(returnJson.exception == null){
						if(returnJson.rtnCode == "<%= com.cjhxfund.commonUtil.Constants.ATS_SUCCESS %>"){
							var riskMsg = returnJson.riskMsg;
	            			if(riskMsg && riskMsg.isAgainstRisk){
	            				riskMsg["alertMsg"]="确认成功！";
	            				nui.open({
			                        url: "<%=request.getContextPath()%>/fix/riskControlDetailList.jsp",
			                        title: "风控信息",
			                        width: 800,
			                        height: 422,
			                        onload: function () {
			                            var iframe = this.getIFrameEl();
			                            iframe.contentWindow.SetData(riskMsg,3);
			                        },
			                        ondestroy: function (action) {
			                            CloseWindow("ok");
			                        }
			                    });
	            			}else{
		            			nui.alert("确认成功！","提示",function(){
									finishInstructWorkitemFisish();
				                });
	            			}
			    		}else if(returnJson.rtnCode =="<%= com.cjhxfund.commonUtil.Constants.ATS_ORDER_NO_RCV_FR_O32 %>"){
			            	nui.alert(returnJson.rtnMsg,"提示",function(){
									CloseWindow("ok");
				                });
			            	return;
			            }else if(returnJson.rtnCode == "<%= com.cjhxfund.commonUtil.Constants.ATS_ERROR %>") {
			    			var riskMsg = returnJson.riskMsg;
	            			if(riskMsg && riskMsg.isAgainstRisk){
	            				riskMsg["alertMsg"]="确认失败！";
	            				nui.open({
			                        url: "<%=request.getContextPath()%>/fix/riskControlDetailList.jsp",
			                        title: "风控信息",
			                        width: 800,
			                        height: 422,
			                        onload: function () {
			                            var iframe = this.getIFrameEl();
			                            iframe.contentWindow.SetData(riskMsg,3);
			                        }
			                    });
	            			}else{
	            				nui.alert("确认失败！</br>"+returnJson.rtnMsg,"提示");
	            			}
			            }
					}else{
						nui.alert("系统异常，请联系管理员","提示");
					}
				}
			});
		}
        /**风控管理结束**/
		
		// 退回
		function backTasks(){
			nui.open({
   				url : nui.context + "/inquiry/inquiryResultManage/inquiryInstructBackReason.jsp",
   				title : "询价退回",
   				width : 500,
   				height : 200,
   				onload : function() {
   					var iframe = this.getIFrameEl();
   					iframe.contentWindow.setData(row);
   				},
   				ondestroy : function(action) {
   					var iframe = this.getIFrameEl();
   					var returnJson = iframe.contentWindow.getData();
   					backReturnJson = mini.clone(returnJson);    //必须。克隆数据。
   					window.CloseWindow("ok");
   				}
			});
		}
		
		function riskControlTrial(){
			var parameter = nui.clone(row);
			parameter["callRiskType"]="1";//1-风控试算
			parameter["symbol"]=parameter.vcStockCode;//证券申报代码
			if(parameter.vcBizType=="1"){
				parameter["businClass"]="2";//2-银行间业务
				parameter["exdestination"]="OTC";//交易场所：OTC-场外
			}else if(parameter.vcBizType=="3"){
				parameter["businClass"]="I";//I-上交所固定收益平台
				parameter["exdestination"]="SS";//交易场所：SS-上交所
			}
			parameter["vcInvestType"]="1";//投资类型：1-可交易
			parameter["ordtype"]="2";//证券控制类型:1-金额控 、2-数量控、缺省按2-数量控
			parameter["vcFirstSettleMode"]="3";//结算方式（首次结算方式）：1-见款付券\2- 见券付款\3-券款对付\4-纯券过户)
			parameter["vcMaturitySettleMode"]="3";//结算方式（到期结算方式）：1-见款付券\2- 见券付款\3-券款对付\4-纯券过户
			parameter["lTradeDate"]=parameter.lTradeDate.replace("//-");
		    var reg =/(\d{4})\-(\d{2})\-(\d{2})/;
		    parameter["lTradeDate"] = parameter.lTradeDate.replace(reg,"$1$2$3");
		    parameter["lFirstSettleDate"] = parameter.lFirstSettleDate.replace(reg,"$1$2$3");
			var param = {};
			var url = "com.cjhxfund.ats.sm.inquiry.inquiryResultManage.inquiryCheckInstructRisk.biz.ext";
			param = {instructParameter:parameter};
			if(parameter.lProcessinstId != null && parameter.lProcessinstId != ""){
				url = "com.cjhxfund.ats.sm.comm.InstructionManager.approveRiskTrial.biz.ext";
				param = {lProcessInstID:parameter.lProcessinstId};
			}
			var a = nui.loading("正在处理中,请稍等...","提示");
			nui.ajax({
			 	url: url,
		        type: 'POST',
		        data: param,
		        cache: false,
		        contentType: 'text/json',
		        success: function (text) {
		        	nui.hideMessageBox(a);
		        	var returnJson = nui.decode(text);
					if(returnJson.exception == null){
		                var riskInfo = returnJson.riskMsg;
		               if (returnJson.rtnCode == "<%= com.cjhxfund.commonUtil.Constants.ATS_SUCCESS %>"){
		                    if(returnJson.rtnMsg!=null){
		                    	nui.alert(returnJson.rtnMsg,"系统提示");
		                    }else{
		                    	nui.alert("风控试算通过!","系统提示");
		                    }
		                }else if(returnJson.rtnCode =="<%= com.cjhxfund.commonUtil.Constants.ATS_ORDER_USABLE_AMOUNT_INSUFFICIENT %>"){
		                	nui.alert(returnJson.rtnMsg,"投资指令/建议风险提示");//可用不足
		                }else if(returnJson.rtnCode == "203"){
		                	nui.alert(returnJson.rtnMsg,"系统提示");//风控校验失败
		                }else if(returnJson.rtnCode == "301"){
		                	//风险提示框start
		                	riskInfo["alertMsg"]=returnJson.rtnMsg;
		                    nui.open({
		                        url:  nui.context +"/fix/riskControlDetailList.jsp",
		                        title: "投资指令/建议风险提示",
		                        width: 800,
		                        height: 422,
		                        onload: function () {
		                            var iframe = this.getIFrameEl();
		                            iframe.contentWindow.SetData(riskInfo,3);
		                        }
		                    });
		                    //风险提示框end
		                }else{
		                    //风险提示框start
		                    nui.open({
		                        url:  nui.context +"/fix/riskControlDetailList.jsp",
		                        title: "投资指令/建议风险提示",
		                        width: 800,
		                        height: 380,
		                        onload: function () {
		                            var iframe = this.getIFrameEl();
		                            iframe.contentWindow.SetData(riskInfo,3);
		                        }
		                    });
		                    //风险提示框end
		                }
					}else{
						nui.alert("系统异常","系统提示");
					}
				}
			});
		}
		
		//查询投资经理权限用户，并判断当前用户是否拥有投资经理权限
		function combiAuthorityJudgment(vcProductCode, vcCombiCode, relateType) {
			var url = "com.cjhxfund.commonUtil.productUserRight.getUsersByProductCombiAndRelateTy.biz.ext";
			var result = false;
			nui.ajax({
				url : url,
				type : 'POST',
				data : {
					productCode : vcProductCode,
					combiCode : vcCombiCode,
					relateType : relateType
				},
				cache : false,
				async : false,
				contentType : 'text/json',
				success : function(text) {
					var returnJson = nui.decode(text);
					if (returnJson.exception == null) {
						var userIds = new Array();
						userIds = returnJson.userIds.split(",");
						for (var i = 0; i < userIds.length; i++) {
							if (userIds[i] == returnJson.userId) {
								result = true;
								return;
							}
						}
						result = false;
					} else {
						result = false;
					}
				}
			});
			return result;
		}
		
		//点击修改/提交
		function editClick(){
   			window.CloseWindow("ok");
		}
		
		function getEditOrCommitValue(){
			backReturnJson = "1";
			return backReturnJson;
		}
		
		function getProductHandleByInstructrionInput(vcProductCode,vcCombiCode) {
			var url = "";
			var result = false;
			url = "com.cjhxfund.commonUtil.productUserRight.getUsersByProductCombiAndRelateTy.biz.ext";
			nui.ajax({
				url : url,
				type : 'POST',
				data : {
					productCode : vcProductCode,
					combiCode : vcCombiCode,
					relateType : "03"
				},
				cache : false,
				async : false,
				contentType : 'text/json',
				success : function(text) {
					var returnJson = nui.decode(text);
					if (returnJson.exception == null) {
						var userIds = new Array();
						userIds = returnJson.userIds.split(",");
						for (var i = 0; i < userIds.length; i++) {
							if (userIds[i] == returnJson.userId) {
								result = true;
								return;
							}
						}
						result = false;
					} else {
						result = false;
					}
				}
			});
			return result;
		}
		
		function setResultNo(lInstructNo){
    		// 按钮显示
			document.getElementById("confirmInquiryInfo").style.display = "none";
			document.getElementById("inputInquiryInfo").style.display = "none";
			document.getElementById("inquiryDetail").style.display = "";
    		var params = {lResultNo:lInstructNo};
    		var a = nui.loading("正在处理中,请稍等...","提示");
    		nui.ajax({
		    	url: "com.cjhxfund.ats.sm.inquiry.inquiryResultManage.getInquiryResultInfoByResultNo.biz.ext",
		      	type: 'POST',
		      	data: {params:params},
		      	contentType: 'text/json',
		      	success: function(text){
		      		nui.hideMessageBox(a);
		      		var returnJson = nui.decode(text.inquiryResultInfo);
		      		if(returnJson.length>0){
		      			var row = returnJson[0];
			    		if(row.lFirstSettleDate != null){
							row["lFirstSettleDate"] = nui.formatDate(DateUtil.numStrToDate(row["lFirstSettleDate"].toString()),"yyyy-MM-dd");
						}
						if(row.lTradeDate != null){
							row["lTradeDate"] = nui.formatDate(DateUtil.numStrToDate(row["lTradeDate"].toString()),"yyyy-MM-dd");
						}
						// 对方交易员
						if(row.vcCounterpartyTrader != null){
							row["vcCounterpartyTrader1"] = row.vcCounterpartyTrader;
						}
						// 券面金额
						if(row.enFaceAmount != null){
							row["enFaceAmount1"] = row.enFaceAmount;
						}
						//交易对手
						if(row.vcCounterpartyName != null){
							row["vcCounterpartyName1"] = row.vcCounterpartyName;
						}
						//对手主体机构
						if(row.vcCounterpartyOrgan != null){
							row["vcCounterpartyOrgan1"] = row.vcCounterpartyOrgan;
						}
						instruct_detail_from.setData({instructInfo:row});
						if(row.vcBizType == "1"){		
							// 买卖银行间业务显示
							document.getElementById("sjsgsBiz1").style.display = "none";
							document.getElementById("sjsgsBiz2").style.display = "none";
							document.getElementById("sjsgsBiz3").style.display = "none";
						}else if(row.vcBizType == "2" || row.vcBizType == "4"){
							// 买卖上海大宗交易业务和深交所业务显示
							document.getElementById("sjsgs_vcCounterpartyTrader_text").style.display = "none";
							document.getElementById("sjsgs_vcCounterpartyTrader_value").style.display = "none";
							document.getElementById("interBankBiz1").style.display = "none";
							document.getElementById("interBankBiz2").style.display = "none";
							// 上交所大宗 显示对手席位， 上交所固收显示对方交易员, 其他字段一致				
						}else if(row.vcBizType == "3"){
							// 买卖上海固收平台业务显示
							document.getElementById("sjsdz_vcRivalSeat_text").style.display = "none";
							document.getElementById("sjsdz_vcRivalSeat_value").style.display = "none";
							document.getElementById("interBankBiz1").style.display = "none";
							document.getElementById("interBankBiz2").style.display = "none";
						}
						
						// 显示净价金额或者全价金额
						if(row.vcBizType == "1"){		
							// 买卖银行间业务显示
							document.getElementById("enFullPriceAmountValue").style.display = "none";
						}else if(row.vcBizType == "2" || row.vcBizType == "3" || row.vcBizType == "4"){
							// 买卖上海大宗交易业务和深交所业务显示和上交所固收
							if(row.enNetPriceAmount != null && row.enNetPriceAmount != ""){
								// 隐藏全价
								document.getElementById("enFullPriceAmountText").style.display = "none";
								document.getElementById("enFullPriceAmountValue").style.display = "none";
							}else{
								// 展示全价
								document.getElementById("enNetPriceAmountText").style.display = "none";
								document.getElementById("enNetPriceAmountValue").style.display = "none";
							}
						}
						// 到期/行权收益率显示
						showYield(row.vcStockCode,row.vcMarket);
		      		}
		      	}
	 		});
    	}
    	
    	var backReturnJson = null;
		function getData(){
			return backReturnJson;
		}
		
		//清除详细信息
    	function clearDetail(){
    		isSigleSelectChanged = false;
    		var currentTabIFrameEl = tabDetailRole.getTabIFrameEl(tabDetailRole.getActiveTab());//获取当前详情标签页
    		if(currentTabIFrameEl.contentWindow.clearDetail){
	    		currentTabIFrameEl.contentWindow.clearDetail();
	    	}
    	}
    </script>
</body>
</html>