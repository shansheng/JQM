<%@page import="commonj.sdo.DataObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="/common/js/commscripts.jsp" %>
<%@ taglib uri="http://eos.primeton.com/tags/logic" prefix="l"%>
<html>
<!-- 
  - Author(s): 陈鹏
  - Date: 2016-08-18 16:32:02 
  - Description:
-->
<head>
	<title><b:write property="workitem/workItemName" /></title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE10" />
    
    <style type="text/css">
      .td1{
        border-right: 1px solid #D3D3D3;
        border-left: 1px solid #D3D3D3;
      }
      .td2{
        border-right: 1px solid #D3D3D3;
      }
      .asLabel .mini-textbox-input{
        color: red;
        background:none;cursor:default;
      }
      .asLabel_gray .mini-textbox-input{
         color: black;
         background:none;cursor:default;
      }
      
      .p{
           border-bottom: 1px solid #D3D3D3;     
        }
        P{
          margin: 0px;padding: 0px;
        }
        
    </style>
    <%
	   Object rootObj= com.eos.web.taglib.util.XpathUtil.getDataContextRoot("request", pageContext); 
	   //业务ID
	   String bizId =(String)com.eos.web.taglib.util.XpathUtil.getObjectByXpath(rootObj,"bizId");
	   //流程ID
	   String processinstid =(String)com.eos.web.taglib.util.XpathUtil.getObjectByXpath(rootObj,"processInstID");
	   //工作项ID
	   String workItemID =(String)com.eos.web.taglib.util.XpathUtil.getObjectByXpath(rootObj,"workItemID");
	   
	   //获取产品代码
	   DataObject obj = (DataObject)com.eos.web.taglib.util.XpathUtil.getObjectByXpath(rootObj,"firstGradeBond");
	   String vcProductCode = obj.getString("vcProductCode");
	   String lNextExerciseDate = obj.getString("lNextExerciseDate");
	   
	   //获取工作项信息
	   DataObject workitem = (DataObject)com.eos.web.taglib.util.XpathUtil.getObjectByXpath(rootObj,"workitem");
	   String activityDefID = workitem.getString("activityDefID");
 	%>
<script type="text/javascript" src="<%=request.getContextPath() %>/common/js/commonjs.js"></script>
</head>
<body style="width: 100%;height: 100%;overflow: hidden;margin: 0px;">
<div id="dataform1" style="height: 100%;">
	<div id="tabs" class="nui-tabs" height="100%" onactivechanged="activechangedFun">
		<div title="基本信息">
			<!-- 左右布局控件 -->
			<div id="layout1" class="nui-layout" style="width:100%;height:100%;" >
				<!-- 主体内容 -->
				<div title="center" region="center" width="80%">
					<input class="nui-hidden" id="processinstid" name="processinstid" value="<%=processinstid %>"/>
				    <input class="nui-hidden" id="workItemID" name="workItemID" value="<%=workItemID %>"/>
				    <input class="nui-hidden" id="workItemName" value="<b:write property="workitem/workItemName" />">
				    <!-- 投资编号 -->
				    <input class="nui-hidden"  name="applyInst.cApplyAuthStatus" value="<b:write property="firstGradeBond/cApplyAuthStatus" />" /> 
					<input class="nui-hidden"  name="applyInst.cPaymentAuthStatus" value="<b:write property="firstGradeBond/cPaymentAuthStatus" />" />
					<input class="nui-hidden" name="applyInst.cApplyInstType" value="<b:write property="firstGradeBond/cApplyInstType" />" />
				    <input class="nui-hidden" id="lInvestNo" name="firstGradeBond.lInvestNo" value="<b:write property="firstGradeBond/lInvestNo" />"/>
				    <input class="nui-hidden" id="lApplyInstId" name="firstGradeBond.lApplyInstId" value="<b:write property="firstGradeBond/lApplyInstId" />"/>
				    <input class="nui-hidden" id="stockissueinfo.lStockIssueId" name="stockissueinfo.lStockIssueId" value="<b:write property="firstGradeBond/lStockIssueId" />"/>
				    <!-- 流程业务主表ID -->
				    <input class="nui-hidden" id="lBizId" name="firstGradeBond.lBizId" value="<b:write property="firstGradeBond/lBizId" />"/>
				    <!-- 流程类型 -->
				    <input class="nui-hidden" id="vcBusinessType" name="firstGradeBond.vcBusinessType" value="<b:write property="firstGradeBond/vcBusinessType" />"/>
				    <!-- 产品编码 -->
				    <input class="nui-hidden" id="vcProductCode" name="firstGradeBond.vcProductCode" value="<b:write property="firstGradeBond/vcProductCode" />"/>
				    <!-- 组合编码 -->
				    <input class="nui-hidden" id="lCombiId" name="firstGradeBond.lCombiId" value="<b:write property="firstGradeBond/lCombiId" />"/>
				    <input class="nui-hidden" id="vcCombiNo" name="firstGradeBond.vcCombiNo" value="<b:write property="firstGradeBond/vcCombiNo" />"/>
				    <!-- 资产单元序号 -->
				    <input class="nui-hidden" id="lAssetId" name="firstGradeBond.lAssetId" value="<b:write property="firstGradeBond/lAssetId" />"/>
				    <!-- 资产单元编码 -->
				    <input class="nui-hidden" id="vcAssetNo" name="firstGradeBond.vcAssetNo" value="<b:write property="firstGradeBond/vcAssetNo" />"/>
				    <!-- 资产单元名称 -->
				    <input class="nui-hidden" id="vcAssetName" name="firstGradeBond.vcAssetName" value="<b:write property="firstGradeBond/vcAssetName" />"/>
				    <input class="nui-hidden" id="dBidLimitTime" name="firstGradeBond.dBidLimitTime" value="<b:write property="firstGradeBond/dBidLimitTime" />"/>
				    <!-- 新债投资编号 -->
				    <input class="nui-hidden" id="lStockInvestNo" name="firstGradeBond.lStockInvestNo" value="<b:write property="firstGradeBond/lStockInvestNo" />"/>
				    <input class="nui-hidden" id="lAttchCount" name="firstGradeBond.lAttchCount" value="<b:write property="firstGradeBond/lAttchCount" />"/>
				    <input class="nui-hidden" id="vcStockType" name="firstGradeBond.vcStockType" value="<b:write property="firstGradeBond/vcStockType" />"/>
					<input class="nui-hidden" id="vcBusinessObject" name="firstGradeBond.vcBusinessObject" value="<b:write property="firstGradeBond/vcBusinessObject" />"/>
				    <input class="nui-hidden" name="firstGradeBond.cMarketNo" value="<b:write property="firstGradeBond/cMarketNo" />" />
				    <input class="nui-hidden" name="firstGradeBond.enInvestBalance" id="vcInvestBalance" value="<b:write property="firstGradeBond/enInvestBalance" />"/>
				    <input class="nui-hidden" name="firstGradeBond.enInterestRate" id="enInterestRate" value="<b:write property="firstGradeBond/enInterestRate" />"/>
				    <!-- Fix指令/建议编号 -->
				    <input class="nui-hidden" id="vcClordId" name="firstGradeBond.vcClordId" value="<b:write property="firstGradeBond/vcClordId" />"/>
				    <input class="nui-hidden" id="vcOrigordId" name="firstGradeBond.vcOrigordId" value="<b:write property="firstGradeBond/vcOrigordId" />"/>
				    
				    <!-- 指令/建议状态 -->
				    <input class="nui-hidden" id="cStatus" name="firstGradeBond.cStatus" value="<b:write property="firstGradeBond/cStatus" />"/>
				    <input class="nui-hidden" id="lValidStatus" name="firstGradeBond.lValidStatus" value="<b:write property="firstGradeBond/lValidStatus" />"/>
				    <!-- Fix发送状态 -->
				    <input class="nui-hidden" id="lFixValidStatus" name="firstGradeBond.lFixValidStatus" value="<b:write property="firstGradeBond/lFixValidStatus" />"/>
				    
				    <!-- 当中标回退到中标确认环节时隐藏提交之前输入的缴款信息 -->
				    <l:in property="workitem/activityDefID" targetValue="ATS_FM_CZ_ZBQR">    
						<input class="nui-hidden" name="firstGradeBond.vcTransactionType" value="<b:write property="firstGradeBond/vcTransactionType" />"   />
						<input class="nui-hidden" name="firstGradeBond.vcBeneficiary" value="<b:write property="firstGradeBond/vcBeneficiary" />"/>
			            <input class="nui-hidden" name="firstGradeBond.vcCollectionAccount" value="<b:write property="firstGradeBond/vcCollectionAccount" />" />
			            <input class="nui-hidden" name="firstGradeBond.vcBankLine" value="<b:write property="firstGradeBond/vcBankLine" />" />
			            <input class="nui-hidden" name="firstGradeBond.vcPayLine" value="<b:write property="firstGradeBond/vcPayLine" />" />
			            <input class="nui-hidden" name="firstGradeBond.vcReceivableRemark" value="<b:write property="firstGradeBond/vcReceivableRemark" />" />
			        </l:in>
				    
				    <table style="width:100%;table-layout:fixed;" class="nui-form-table"> 
		                <tr>
		                    <td class="form_label" width="25%" align="right">
		                        业务日期:    
		                    </td>
		                    <td colspan="1">
		                        <input class="nui-datepicker" name="firstGradeBond.dApplicationTime" format="yyyy-MM-dd" width="170" value="<b:write property="firstGradeBond/dApplicationTime" />" readonly="readonly"/>
		                    </td>
		                    
		                    <td class="form_label" align="right" width="25%">
								投标截止日期:
						  	</td>
						  	<td colspan="1" width="270px">
							     <!-- 日期和时间分开显示 -->
							     <input style="width: 98px;"  id="dApplicationDate" onvaluechanged="onTimeValueChanged"   class="mini-datepicker" showTodayButton="true" format="yyyy-MM-dd"  readonly="readonly"/>
						         <input style="width: 40px;" url="<%=request.getContextPath() %>/fm/instr/processUtil/timeHH.txt" class="nui-dictcombobox"  id="dApplicationTimeHH" readonly="readonly"/>
							                 时
							     <input style="width: 40px;" url="<%=request.getContextPath() %>/fm/instr/processUtil/timeMM.txt" class="nui-dictcombobox"  id="dApplicationTimeMM" readonly="readonly"/>
							                 分
							     <!-- 提醒的时间 -->
							     <input class="nui-hidden" type="hidden"  id="bidRemind" />
						  	 </td>
		                </tr>
		                <tr>
		                  <td class="form_label" align="right">
		                        产品名称:
		                    </td>
		                    <td colspan="1">
		                        <input class="nui-textbox" id="vcProductName" width="170" name="firstGradeBond.vcProductName" value="<b:write property="firstGradeBond/vcProductName" />" readonly="readonly"/>
		                    </td>
		                    <td class="form_label" align="right">
			                        组合名称:
			                  </td>
			                  <td colspan="1">
			                      <input class="nui-textbox"  width="170" id="vcCombiName" name="firstGradeBond.vcCombiName" value="<b:write property="firstGradeBond/vcCombiName" />" readonly="readonly"/>
			                  </td>
		                </tr>
		                <tr>
		                  <td class="form_label" align="right">
		                        债券代码:
		                    </td>
		                    <td colspan="1" >
		                        <%--<input class="nui-textbox" name="firstGradeBond.vcStockCode"/>--%>
		                        <input  id="vcStockCode" width="170" class="nui-textbox"name="firstGradeBond.vcStockCode" value="<b:write property="firstGradeBond/vcStockCode" />" readonly="readonly"/>
		                    </td>
		                	 <td class="form_label" align="right">
		                        债券简称:
		                    </td>
		                    <td colspan="1">
		                        <input class="nui-textbox" id="vcStockName" width="170" name="firstGradeBond.vcStockName" value="<b:write property="firstGradeBond/vcStockName" />" readonly="readonly"/>
		                    </td>
		                </tr>
		                <tr>
		                	<td class="form_label" align="right">
				登记托管机构:
					  		</td>
					  		<td colspan="1">
					  			<!-- 登记托管机构 -->
					  			<input width="170"class="nui-dictcombobox" id="vcPaymentPlace" name="firstGradeBond.vcPaymentPlace" value="<b:write property="firstGradeBond/vcPaymentPlace" />" dictTypeId="CF_JY_DJTGCS" readonly="readonly" />
					  		</td>
		                    <td class="form_label" align="right">
		                        债券类别:
		                    </td>
		                    <td colspan="1">
		                        <input class="nui-textbox" width="170" id="vcStocktypeName" name="firstGradeBond.vcStocktypeName" 
		                        value="<b:write property="firstGradeBond/vcStocktypeName" />" readonly="readonly"/>
		                        <input class="nui-hidden" id="vcStockType" name="firstGradeBond.vcStockType" value="<b:write property="firstGradeBond/vcStockType" />" />
		                    </td>
		                    
		                </tr>
		                <tr>
		                	<td class="form_label" align="right">
		                        发行主体:
		                    </td>
		                    <td colspan="1">
		                        <input class="nui-textbox" width="170" name="firstGradeBond.vcIssuerNameFull" value="<b:write property="firstGradeBond/vcIssuerNameFull" />" readonly="readonly"/>
		                    </td>
		                    <td class="form_label" align="right">
		                        债券全称:
		                    </td>
		                    <td colspan="1">
		                        <input class="nui-textbox" id="vcStockNameFull" width="170" name="stockissueinfo.vcStockNameFull" value="<b:write property="firstGradeBond/vcStockName" />" readonly="readonly"/>
		                    </td>
		                </tr>
		                <tr>
		                	<td class="form_label" align="right">
						发行日期:
						   </td>
						   <td colspan="1">
						    <input width="170"  id="lIssueBeginDate" name="stockissueinfo.lIssueBeginDate"  class="mini-datepicker" showTodayButton="true"  
						    	readonly="readonly" value="<b:write property="firstGradeBond/lIssueBeginDate" />"/>
						   </td>
		                	<l:in property="workitem/activityDefID" targetValue="ATS_FM_CZ_ZBQR">     
		                    <td class="form_label" align="right">
		                         发行规模(亿):
		                    </td>
		                    <td colspan="1">
		                        <input class="nui-textbox" name="firstGradeBond.enIssueBalance" id="enIssueBalance" width="170" value="<b:write property="firstGradeBond/enIssueBalance" />"/>
		                    </td>
		                 </l:in>
		                 <l:notIn property="workitem/activityDefID" targetValue="ATS_FM_CZ_ZBQR">     
		                 	<td class="form_label" align="right">
		                         发行规模(亿):
		                    </td>
		                    <td colspan="1">
		                        <input class="nui-textbox" name="firstGradeBond.enIssueBalance" id="enIssueBalance" width="170" value="<b:write property="firstGradeBond/enIssueBalance" />" readonly="readonly"/>
		                    </td>
		                 </l:notIn>
		                </tr>
		                
		                 <tr>
		                	<td class="form_label" align="right">
		                    	债券详情:
		                    </td>
		                    <td colspan="1">
		                    	<a  class='nui-button' plain='false' onclick="queryStockDetail()">
									查看债券详情
								</a>
		                    </td>
		                    <td class="form_label" align="right">
		                    </td>
		                    <td colspan="1">
		                    </td>
		                </tr>
		                </table>
		                <div style="height: 5px"></div>
	    <div id="panel1" class="mini-panel" title="其他信息" iconCls="icon-edit" style="width:100%;padding: 0px;" 
    		showToolbar="true" showCollapseButton="true" showFooter="true" allowResize="false" collapseOnTitleClick="true">
		                <table style="width:100%; table-layout:fixed;" border="0" class="nui-form-table">
		                <tr>
		                	<td class="form_label" align="right" width="25%">
		                        	主承销商:
		                    </td>
		                    <td colspan="3">
		                        <input width="90%" class="nui-textbox" name="firstGradeBond.vcMainUnderwriter"  value="<b:write property="firstGradeBond/vcMainUnderwriter" />"  readonly="readonly"/>
		                    </td>
		                </tr>
		                <tr>
		                <td class="form_label" align="right" width="25%">
		                        副主承销商:
		                    </td>
		                    <td colspan="3">
		                        <input width="90%" class="nui-textbox" name="firstGradeBond.vcDeputyUnderwriter"  value="<b:write property="firstGradeBond/vcDeputyUnderwriter" />"  readonly="readonly"/>
		                    </td>
		                </tr>
		                 <tr>
		                 <td class="form_label" align="right">
		                        承销团:
		                    </td>
		                    <td colspan="3">
		                        <input width="90%" class="nui-textbox" name="firstGradeBond.vcGroupUnderwriter"  value="<b:write property="firstGradeBond/vcGroupUnderwriter" />"  readonly="readonly"/>
		                    </td>
		                </tr>
		                <tr>
		                	 <td class="form_label" align="right">
		                        交易对手:
		                    </td>
		                    <td colspan="1">
		                    	<input class="nui-hidden" type="hidden" id="hlRivalId" name="firstGradeBond.lRivalId"  value="<b:write property="firstGradeBond/lRivalId" />"/>
								<input class="nui-textbox" name="firstGradeBond.vcBusinessObject" id="vcBusinessObject" style="width: 170px;" readonly="readonly"
								value="<b:write property="firstGradeBond/vcBusinessObject" />" />
		                    </td>
		                    <td class="form_label" align="right">
		                        主体类型:
		                    </td>
		                    <td colspan="1">
		                        <input class="nui-dictcombobox" dictTypeId="ATS_FM_ISSUE_PROPERTY" width="170" name="firstGradeBond.vcIssueProperty" value="<b:write property="firstGradeBond/vcIssueProperty" />" readonly="readonly"/>
		                    </td>
		                </tr>
		                <tr>
		                	<td class="form_label" align="right" width="20%">
		                        主体评级:
		                    </td>
		                    <td colspan="1">
		                        <input class="nui-dictcombobox" dictTypeId="issuerRating" width="170" id="cIssueAppraise" 
		                        name="firstGradeBond.cIssueAppraise" value="<b:write property="firstGradeBond/cIssueAppraise" />" readonly="readonly"/>
		                    </td>
		                    <td class="form_label" align="right">
		                        债券评级:
		                    </td>
		                    <td colspan="1"> 
		                        <input class="nui-dictcombobox" dictTypeId="creditRating" id="cBondAppraise" 
		                        width="170" name="firstGradeBond.cBondAppraise" value="<b:write property="firstGradeBond/cBondAppraise" />" readonly="readonly"/>
		                    </td>
		                </tr>
		                <tr>
		                    <td class="form_label" align="right">
		                        主体评级机构:
		                    </td>
		                    <td colspan="1">
		                        <input class="nui-dictcombobox" dictTypeId="outRatingOrgan" width="170" id="vcIssueAppraiseOrgan" 
		                        name="firstGradeBond.vcIssueAppraiseOrgan" value="<b:write property="firstGradeBond/vcIssueAppraiseOrgan" />"  readonly="readonly"/>
		                    </td>
		                    <td class="form_label" align="right">
		                        债券评级机构:
		                    </td>
		                    <td colspan="1">
		                        <input class="nui-dictcombobox" dictTypeId="outRatingOrgan" width="170" id="vcBondAppraiseOrgan" 
		                        name="firstGradeBond.vcBondAppraiseOrgan" value="<b:write property="firstGradeBond/vcBondAppraiseOrgan" />"  readonly="readonly"/>
		                    </td>
		                </tr>
		                <tr>
		                    <td colspan="1" class="form_label" align="right">
					特殊条款:	
							</td>
							<td colspan="1">
							<input width="170" id="stockissueinfo.vcSpecialText"  class="nui-dictcombobox" name="stockissueinfo.vcSpecialText"  valueField="dictID" textField="dictName" dictTypeId="specialText"  
								emptyText="请选择" nullItemText="请选择" multiSelect="true" showClose="true" valueFromSelect="true"  oncloseclick="onCloseClickValueEmpty" 
								value="<b:write property="firstGradeBond/vcSpecialText" />" readonly/>
							</td>
		                    <td class="form_label" align="right">
		                       发行期限(年):
		                    </td>
		                    <td colspan="1">
		                        <input class="nui-textbox" name="firstGradeBond.enExistLimite" width="170" value="<b:write property="firstGradeBond/enExistLimite" />" readonly="readonly"/>
		                    </td>
		                </tr>
		                <tr>
		                      <td class="form_label" align="right">
							     	特殊期限:
							  </td>
							  <td colspan="1">
							      <input class="nui-textbox" name="firstGradeBond.vcSpecialLimite" width="170" value="<b:write property="firstGradeBond/vcSpecialLimite" />" readonly="readonly"/>
							  </td>
		                	<td class="form_label" align="right">
		                       下一行权日:
		                    </td>
		                    <td colspan="1">
		                    	<input style="width:170px;" class="nui-datepicker"  id="lNextExerciseDate" name="stockissueinfo.lNextExerciseDate" readonly="readonly"
		                    	value="<b:write property="firstGradeBond/lNextExerciseDate" />"/>
		                    </td>
		                </tr>
		                <tr>
		                    <td class="form_label" align="right">
	                       下一利率跳升点数:
		                    </td>
		                    <td colspan="1">
		                    	<input class="nui-textbox" name="stockissueinfo.lNInterestRateJumpPoints" id="lNInterestRateJumpPoints" style="width: 170px;"
								value="<b:write property="firstGradeBond/lNInterestRateJumpPoints" />" readonly="readonly"/>
		                    </td>
		                	<td class="form_label" align="right">
		                        首次付息日:
		                    </td>
		                    <td colspan="1">
								<input class="nui-datepicker" name="firstGradeBond.dInitInterestPaymentDate" id="dInitInterestPaymentDate"
								value="<b:write property="firstGradeBond/dInitInterestPaymentDate" />" style="width: 170px;"  readonly="readonly"/>
		                    </td>
		                </tr>
		                <tr>
							<td class="form_label" align="right">
	                       公司净资产（元）:
							</td>
							<td colspan="1">
								<input class="nui-textbox" name="stockissueinfo.enIssuerNetValue" id="enIssuerNetValue" style="width: 170px;"
								value="<b:write property="firstGradeBond/enIssuerNetValue" />" readonly="readonly"/>
							</td>
		                	<td class="form_label" align="right">
	                     城投行政级别:
	                    </td>
	                    <td colspan="1" >
							<input style="width:170px;"  id="vcCityLevel" class="nui-dictcombobox" name="stockissueinfo.vcCityLevel" readonly="readonly"
					     showNullItem="true"  emptyText="---请选择---" nullItemText="---请选择---" dictTypeId="cityLevel"  value="<b:write property="firstGradeBond/vcCityLevel" />"/>
	                    </td>
		                </tr>               
		                <tr id="morStockNameAndCode">
		                <td class="form_label" align="right">
	                       股票名称:
	                    </td>
	                    <td colspan="1" >
							<input class="nui-textbox" name="stockissueinfo.vcMortStockName" id="vcMortStockName" style="width: 170px;"
							value="<b:write property="firstGradeBond/vcMortStockName" />" readonly="readonly"/>
	                    </td>
	                    <td class="form_label" align="right">
	                        股票代码:
	                    </td>
	                    <td colspan="1" class="td2">
							<input class="nui-textbox" name="stockissueinfo.vcMortStockCode" id="vcMortStockCode" style="width: 170px;"
							value="<b:write property="firstGradeBond/vcMortStockCode" />" readonly="readonly"/>
	                    </td>  
	                </tr>
	                
	                 <tr id="morStockAmount">
	                    <td class="form_label" align="right">
	                        股票抵押数量(万股):
	                    </td>
	                    <td colspan="1">
							<input class="nui-textbox" name="stockissueinfo.vcMortStockAmount" id="vcMortStockAmount" style="width: 170px;"
							value="<b:write property="firstGradeBond/vcMortStockAmount" />" readonly="readonly"/>
	                    </td>
	                    <td class="form_label" align="right">
	                    </td>
	                    <td colspan="1">
	                    </td>
	                </tr>
	                <tr>
						<td class="form_label" align="right">
	                     所属行业(证监会二级):
	                    </td>
	                    <td colspan="1" >
							<input class="nui-hidden" name="stockissueinfo.vcIssueAppraiseCsrc" id="vcIssueAppraiseCsrc" style="width: 170px;"
							value="<b:write property="firstGradeBond/vcIssueAppraiseCsrc" />" readonly="readonly"/>
							<input class="nui-textbox" name="stockissueinfo.vcIssueAppraiseCsrcName" id="vcIssueAppraiseCsrcName" style="width: 170px;"
							value="<b:write property="firstGradeBond/vcIssueAppraiseCsrcName" />" readonly="readonly"/>
	                    </td>
	                	<td class="form_label" align="right">
		                       投标区间:
		                    </td>
		                    <td colspan="1">
		                        <input class="nui-textbox" name="firstGradeBond.vcTenderInterval" width="170" value="<b:write property="firstGradeBond/vcTenderInterval" />" readonly="readonly"/>
		                    </td>
	                </tr>
	                  <tr>
	                    <td class="form_label" align="right">
	                        是否具有回售权:
	                    </td>
	                    <td colspan="1" class="radio-border-top-none">
	                        <input id="resaleRight" class="nui-dictradiogroup" name="firstGradeBond.cIsHaveSaleback" 
	                       dictTypeId="COF_YESORNO" style="float: left;" value="<b:write property="firstGradeBond/cIsHaveSaleback" />" readonly/>
	                    </td>
	                    <td class="form_label" align="right"> 
	                        是否具有赎回权:
	                    </td>
	                    <td colspan="1" class="radio-border-top-none">
	                        <input id="redemptionRight" class="nui-dictradiogroup" name="firstGradeBond.cIsHaveBuyback" 
	                         dictTypeId="COF_YESORNO" style="float: left;" value="<b:write property="firstGradeBond/cIsHaveBuyback" />" readonly/>
	                    </td>
		                </tr>
		                <tr>
		                    <td class="form_label" align="right" style="border-bottom: 1px solid #D3D3D3;">
		                        备注:
		                    </td>
		                    <td colspan="3" style="border-bottom: 1px solid #D3D3D3;">
		                        <input class="nui-textarea" width="515" height="40" name="firstGradeBond.vcRemarks"
		                        value="<b:write property="firstGradeBond/vcRemarks" />" readonly="readonly"/>
		                    </td>
		                </tr>
		            </table>
		             <table style="width:100%; table-layout:fixed;" border="0" class="nui-form-table">	
		            	<tr>
		            		<td class="form_label" align="right" style="padding:5px 0px;">
				                       已投资该发行主体债券存量(万元):
				            </td>
				            <td colspan="1" style="padding:5px 0px;">
								<input class="nui-textbox"  id="fsumamount" style="width: 150px;float: left;margin-right: 10px;" readonly="readonly"
								value="<b:write property="firstGradeBond/enCategoryMoney" />"/>
								<a id="" class='nui-button' plain='false' onclick="loadVcNetScale()" iconCls="icon-reload">刷新</a>
				             </td>
		                    <td class="form_label" align="right" style="padding:5px 0px;">
		                        产品净值规模(万元):
		                    </td>
		                    <td colspan="1" style="padding:5px 0px;">
								<input class="nui-textbox" id="enNetScale" style="width: 170px;" readonly="readonly" value="<b:write property="firstGradeBond/enNetScale" />" />
								<input class="nui-hidden" id="enNetScale1" name="firstGradeBond.enNetScale"  value="<b:write property="firstGradeBond/enNetScale" />" />
		                    </td>
		                </tr>
		                <tr>
				                    <td class="form_label" align="right" style="padding:5px 0px;">
				                        该笔债券投资占发行规模比例(%):
				                    </td>
				                    <td colspan="1" style="padding:5px 0px;">
										<input class="nui-textbox asLabel" name="applyInst.enInvestScaleRatio" id="enInvestScaleRatio" style="width:150px;" inputStyle="background-color:#f0f0f0;"
										value="<b:write property="firstGradeBond/enInvestScaleRatio" />" onvaluechanged="calculationNetWorthScale" readonly="readonly"/>
				                    </td>
				                    <td class="form_label" align="right" style="padding:5px 0px;">
				                      同一发行主体占产品净值规模比例(%):
				                    </td>
				                    <td colspan="1" style="padding:5px 0px;">
										<input class="nui-textbox asLabel"  id="enIssuerNetRatio" name="applyInst.enIssuerNetRatio" style="width: 170px;" 
										inputStyle="background-color:#f0f0f0;" onvaluechanged="calculationNetWorthScale" value="<b:write property="firstGradeBond/enIssuerNetRatio" />" readonly="readonly"/>
				                    </td>
				          </tr>
			              <tr>
				                    <td class="form_label" align="right" style="padding:5px 0px;">
				                        该笔债券投资占产品净值规模比例(%):
				                    </td>
				                    <td colspan="1"  style="padding:5px 0px;">
										<input class="nui-textbox asLabel" id="enInvestNetRatio" name="applyInst.enInvestNetRatio" style="width: 150px;" inputStyle="background-color:#f0f0f0;"
										value="<b:write property="firstGradeBond/enInvestNetRatio" />" readonly="readonly"/>
				                    </td>
				                    <td class="form_label" align="right" style="padding:5px 0px;">
				                      弱流动性资产规模占产品净值规模比例(%):
				                    </td>
				                    <td colspan="1"  style="padding:5px 0px;">
										<input class="nui-textbox asLabel"  id="enWeakNetRatio" name="applyInst.enWeakNetRatio" style="width: 170px;" 
										inputStyle="background-color:#f0f0f0;" onvaluechanged="calculationNetWorthScale" value="<b:write property="firstGradeBond/enWeakNetRatio" />" readonly="readonly"/>
				                    </td>
				          </tr>
		            </table>
		            </div>
		            <div title="报量录入">
						<div class="nui-toolbar" style="border-bottom:0;padding:0px;margin-top: 2px;height: 25px;">
							<table style="width:100%;">
								<tr>
									<td style="width:100%;">
							          	&nbsp;&nbsp;报量信息
									</td>
									<td >
				                  		<a class="nui-button " plain="false" iconCls="icon-search" onclick="reportHistory()"  plain="false" tooltip="报量历史">
				                    		&nbsp;
				                  		</a>
				                	</td>	
							        <td>
					                  	<a class="nui-button " plain="false" iconCls="icon-reload" onclick="gridReload('instReport')"  plain="false" tooltip="刷新">
					                    	&nbsp;
					                  	</a>
					                </td>
					                 <td >
										<a class="nui-button " plain="false" iconCls="icon-help" onclick="showTips()"  plain="false" tooltip="帮助">
											&nbsp;
										</a>
									</td>
								</tr>
							</table>
						</div>
			            <div class="nui-datagrid" id="instReport"   height="100px" showPager="false" allowSortColumn="false" allowCellSelect="true" 
							 allowCellEdit="true"  url="com.cjhxfund.ats.fm.instr.StockIssueInfoBiz.loadReport.biz.ext?bizId=<%=bizId %>" multiSelect="true" allowCellValid="true" oncellvalidation="reportEdit" >
								<div property="columns">
									<div field="enReport"  headerAlign="center" allowSort="true">报量(万元)</div>
									<div field="enOffer"  headerAlign="center" allowSort="true">报价(%)</div>
									<div field="vcReportRemark"  headerAlign="center" allowSort="true">报量说明</div>
								</div>
						</div>
					</div>
					 <div class="nui-panel" title="缴款信息"  style="width:100%;height: 28px;margin-top: 5px;" showToolbar="false" showFooter="true" >
				   </div>
				   <table style="width:100%;table-layout:fixed;" class="nui-form-table">
				      <tr>
			             <td class="form_label" align="right" width="25%">
			                        缴款面值(万元):
			             </td>
			             <td colspan="1" class="radio-border-top-none" width="25%" >
			                 <input class="nui-textbox"  id="payFaceValue"
			                    value="<b:write property="firstGradeBond/enPayFaceValue" />"  style="width: 170px;" readonly="readonly"/>
			             	 <input class="nui-hidden"  id="enPayFaceValue" name="firstGradeBond.enPayFaceValue" value="<b:write property="firstGradeBond/enPayFaceValue" />"/>   
			             </td>
			             <td class="form_label" align="right" width="25%">
			                       发行价格(元):
			             </td>
			             <td colspan="1" class="radio-border-top-none" width="25%" >
			                 <input class="nui-textbox" name="firstGradeBond.enBallotPrice" id="enBallotPrice"
			                    value="<b:write property="firstGradeBond/enBallotPrice" />" vtype="float"  style="width: 170px;" readonly="readonly" />
			             </td>
				      </tr>
				      <tr>
			             <td class="form_label" align="right" width="25%">
			                        缴款金额(万元):
			             </td>
			             <td colspan="1" class="radio-border-top-none" width="25%" >
			                 <input class="nui-textbox"  id="paymentMoney"
			                    value="<b:write property="firstGradeBond/enPaymentMoney" />"  style="width: 170px;" readonly="readonly" />
			             	 <input class="nui-hidden" name="firstGradeBond.enPaymentMoney" id="enPaymentMoney"
			                       value="<b:write property="firstGradeBond/enPaymentMoney" />"  />
			             </td>
			             <td class="form_label" align="right" width="25%">
			                        缴款日期:
			             </td>
			            <td colspan="1" width="33%">
							<input class="nui-datepicker" name="firstGradeBond.dPaymentDate" id="dPaymentDate" 
								value="<b:write property="firstGradeBond/dPaymentDate" />"  style="width: 170px;" readonly="readonly"/>
			             </td>
			          </tr>
			          <tr>
			             <td class="form_label" align="right">
			                        票面利率(%):
			             </td>
			            <td colspan="1">
							<input class="nui-textbox" name="firstGradeBond.enCouponRate" id="enCouponRate" 
								value="<b:write property="firstGradeBond/enCouponRate" />"  style="width: 170px;" readonly="readonly"/>
			             </td>
			             <td class="form_label" align="right">
			                        付息频率:
			             </td>
			             <td colspan="1">
			                 <input class="nui-dictcombobox" dictTypeId="ATS_CF_JY_FREQUENCY"  name="firstGradeBond.vcFrequency" id="vcFrequency"
			                    value="<b:write property="firstGradeBond/vcFrequency" />"  style="width: 170px;" readonly="readonly"/>
			             </td>
			          </tr>
			          <tr>
			             <td class="form_label" align="right">
			                        还本方式:
			             </td>
			            <td colspan="1">
							<input class="nui-dictcombobox" dictTypeId="CF_JY_MODE_REPAYMENT"  name="firstGradeBond.vcModeRepayment" id="vcModeRepayment" 
								value="<b:write property="firstGradeBond/vcModeRepayment" />"  style="width: 170px;" readonly="readonly"/>
			             </td>
			             <td class="form_label" align="right" style="border-bottom: 1px solid #D3D3D3;">
			                        计息起始日:
			             </td>
			             <td colspan="1"  style="border-bottom: 1px solid #D3D3D3;">
			             <input class="nui-datepicker" name="firstGradeBond.lBegincalDate" id="lBegincalDate" 
								value="<b:write property="firstGradeBond/lBegincalDate" />"  style="width: 170px;" readonly="readonly" />
			             </td>
			          </tr>
			          <tr>
			             <td class="form_label" align="right" style="border-bottom: 1px solid #D3D3D3;">
			                        到期日:
			             </td>
			             <td colspan="3"  style="border-bottom: 1px solid #D3D3D3;">
			                 <input class="nui-datepicker" name="firstGradeBond.lEndincalDate" id="lEndincalDate"
			                    value="<b:write property="firstGradeBond/lEndincalDate" />"  style="width: 170px;" readonly="readonly"/>
			             </td>
			           </tr>
				   </table>
				   <div class="nui-panel" title="收款账户信息"  style="width:100%;height: 28px;margin-top: 5px;" showToolbar="false" showFooter="true" >
				       </div>
		            <table style="width:100%;table-layout:fixed;" class="nui-form-table">
		                <tr>
		                    <td class="form_label" width="25%" align="right">
		                        缴款方式:    
		                    </td>
		                    <td colspan="1" width="25%">
		                        <input class="nui-dictcombobox" dictTypeId="ATS_FM_PAYMENT" name="firstGradeBond.vcTransactionType" width="170" value="<b:write property="firstGradeBond/vcTransactionType" />" readonly="readonly"/>
		                    </td>
		                    <td class="form_label" width="25%" align="right">
		                        收款人户名:
		                    </td>
		                    <td colspan="1" width="25%">
		                        <input class="nui-textbox"id="combProductName" width="170" name="firstGradeBond.vcBeneficiary" value="<b:write property="firstGradeBond/vcBeneficiary" />" readonly="readonly"/>
		                    </td>
		                </tr>
		                <tr>
		                	<td class="form_label" width="25%" align="right">
		                        收款账号:    
		                    </td>
		                    <td colspan="1" width="25%">
		                        <input class="nui-textbox" name="firstGradeBond.vcCollectionAccount" value="<b:write property="firstGradeBond/vcCollectionAccount" />" width="170" readonly="readonly"/>
		                    </td>
		                    <td class="form_label" width="25%" align="right">
		                        大额支付行号:    
		                    </td>
		                    <td>
		                        <input class="nui-textbox" name="firstGradeBond.vcPayLine" value="<b:write property="firstGradeBond/vcPayLine" />" width="170" readonly="readonly"/>
		                    </td>  
		                </tr>
		                <tr>
		                   <td class="form_label" width="25%" align="right" style="border-bottom: 1px solid #D3D3D3;">
		                        备注:
		                    </td>
		                    <td colspan="3" style="border-bottom: 1px solid #D3D3D3;">
		                        <input class="nui-textarea" id="vcReceivableRemark" width="515" height="40" name="firstGradeBond.vcReceivableRemark" value="<b:write property="firstGradeBond/vcReceivableRemark" />" readonly="readonly"/>
		                    </td>
		                </tr>
		            </table>  
		       	</div>  
				<!-- 投资范围 -->
				<!-- 居右east，据左west -->
				<l:notIn property="workitem/activityDefID" targetValue="ATS_FM_CZ_XYYY2">
				<div  title="投资范围" region="east" width="275" showCloseButton="false" showSplitIcon="true">	
		    		<iframe src="<%=request.getContextPath() %>/fm/comm/ProductInvestmentRange.jsp?vcProductCode=<%=vcProductCode %>" width="100%" height="100%" scrolling="auto" frameborder="0"></iframe>
				</div>  
				</l:notIn>
			</div>    
		</div>
		<div title="审批内容">
		   <%@include file="/fm/instr/firstGradeDebt/processControl.jsp" %>
		</div>
		<div title="流程信息" url="com.cjhxfund.ats.fm.comm.processGraph.flow?processInstID=<%=processinstid %>&workItemID=<%=workItemID %>&bizId=<%=bizId %>"></div>
		<%-- <div title="产品投资范围" url="<%=request.getContextPath() %>/fm/comm/ProductInvestmentRange.jsp?vcProductCode=<%=vcProductCode %>"></div> --%>
		<l:in property="workitem/activityDefID" targetValue="ATS_FM_CZ_TBZX,ATS_FM_CZ_CZZZCXS,ATS_FM_CZ_FSZCXS">
			<div title="传真发送列表" url="<%=request.getContextPath() %>/fm/instr/firstGradeDebt/eastFaxList.jsp?bizId=<%=bizId %>&processinstid=<%=processinstid %>&type=1" refreshOnClick="true"></div>
		</l:in>
</div>

</div>
	<script type="text/javascript">
		nui.parse();
    	//获取应用名称
    	var contextPath = '<%=request.getContextPath() %>';
    	var activityDefID = '<%=activityDefID %>';   //获取活动定义ID
    	var file_grid = nui.get("file_grid");   //附件列表对象
    	var form = new nui.Form("#dataform1");//将普通form转为nui的form
    	
    	//加载报量信息
		//var instReport_from = new nui.Form("instReport_from");
		var instReport = nui.get("instReport");
    	instReport.load();
    	
    //tab标签切换时重新加载查询激活的tab标签的记录--所有业务通用
	function activechangedFun(){
		//标签切换时同时刷新“今日待处理”，模块数据
		//reloadWaitConfirmFun();
	
		//获取激活的tab标签的标题
		var activeTabTitle = nui.get("tabs").getActiveTab().title;
		
		if(activeTabTitle.indexOf("审批内容")!=-1){
			//附件列表
		     var file_grid = nui.get("file_grid");
		     var file_Form = new nui.Form("#file_Form").getData(false,false);
		     file_grid.load(file_Form);
		}
	}
	
	//刷新datagrid表格
	function gridReload(datagrid){
		var grid = nui.get(datagrid);
			grid.reload();
	}	
		 
	     
     function loademployeeGrid(){ 
		//附件列表查询
    	var file_grid = nui.get("file_grid");
		var file_Form = new nui.Form("#file_Form").getData(false,false);
		file_grid.load(file_Form);
     }
     
     function processSubmit(){
		    var typeText = nui.get("operateType").getSelected().text;
			nui.confirm("确认是否提交流程--"+typeText+"？","系统提示",function(action){
			if(action == "ok"){
	    		var form = new nui.Form("#dataform1");
	    		var operateType = nui.get("operateType").getValue();
	    		//var lFixValidStatus = nui.get("lFixValidStatus").getValue();
	    	  	//设置路径
			  	urlStr = contextPath + "/com.cjhxfund.ats.fm.instr.FirstGradeBond.firstGradeBondHandle.biz.ext";
			  	var bpsParam=form.getData(false,true).bpsParam;
			  	var pmprcaprvinfo1=form.getData(false,true).pmprcaprvinfo;
			  	var userTempData = form.getData(false,true).userTempData;
			  	if(activityDefID!="ATS_FM_TGLR" && activityDefID!="ATS_FM_TGFH" && activityDefID!="ATS_FM_WTRFH"){
					bpsParam.FaxNumber = nui.get("FaxNumber").getText();
					var FaxNumber =nui.get("FaxNumber").getText().split(",");
					  if(bpsParam.FaxNumber!="" && bpsParam.FaxNumber!=null){
							var checkFax = /^((\d{3,4}-)?\d{7,8})(\d{7,8})?$/;
					    	for(var i=0;i<FaxNumber.length;i++ ){
					    	    if(!checkFax.test(FaxNumber[i])){
									nui.alert("传真格式为:XXX-12345678或XXXX-1234567或XXXX-12345678或12345678","系统提示");
									return;
							     }
					    	} 
					    }
					    bpsParam.vcTelephoneNumber =nui.get("vcTelephoneNumber").getText();
					    var phoneNumber =nui.get("vcTelephoneNumber").getText().split(",");
						if(bpsParam.vcTelephoneNumber!="" && bpsParam.vcTelephoneNumber!=null){
					    	var checkPhone = /^((0\d{2,3}-\d{7,8})|(1[3584]\d{9}))$/;
					    	for(var i=0;i<phoneNumber.length;i++ ){
					    	    if(!checkPhone.test(phoneNumber[i])){
									nui.alert("联系电话格式不正确,多个号码时，用英文逗号分隔","系统提示");
									return;
					            }
					    	} 
					    }
				}
			  	//组装参数		
				data = {
					workItemID:nui.get("workItemID").getValue(),
					pmprcaprvinfo:pmprcaprvinfo1,
					bpsParam:bpsParam,
					applyInst:form.getData(false,true).firstGradeBond,
					userTempData:userTempData
				};
				
			  	//操作为同意时调用
			  	if(operateType == 1){
			  		/* var lInvestNo = nui.get("lInvestNo").getValue();
			  		var lBizId = nui.get("lBizId").getValue();
			  		var json = nui.encode({lInvestNo:lInvestNo,lBizId:lBizId}); */
			  		saveData(data,urlStr);
					/* $.ajax({
						url:"com.cjhxfund.ats.fm.instr.FirstGradeBond.getFixState.biz.ext",
						type:'POST',
						data:json,
						cache:false,
						contentType:'text/json',
						success:function(text){
							if(text.applyInst.lFixValidStatus == 0){
								nui.confirm("尚未下单，是否确认提交?","系统提示",function(action){
									if(action == "ok"){
										saveData(data,urlStr);
									}
								});
							}else if(text.applyInst.lFixValidStatus == 4){
								nui.confirm("下单失败，是否确认提交?","系统提示",function(action){
									if(action == "ok"){
										saveData(data,urlStr);
									}
								});
							}else if(text.applyInst.lFixValidStatus == 3){
								saveData(data, urlStr);
							}
						}
					});	 */
			  	}else if(operateType == 2){
	        	  	 var backActivity = nui.get("backActivity").getValue();
	        	  	 if(backActivity == ""){
	        	  	   nui.alert("当操作为退回时,必须选择退办节点。","系统提示");
	        	  	   return;
	        	  	 }else{
	        	  	 	saveData(data, urlStr);
	        	  	 }
	        	}else{
	        		saveData(data, urlStr);
	        	}  
			}
		});	
    }
    
    
    //默认加载审核信息
    var operateText = nui.get("operateType").getSelected().text;
	nui.get("comments").setValue(operateText);
     
	 //调用附件查询方法
     loademployeeGrid();	
    

function loadVcNetScale(){
	//从O32加载产品净值规模相关信息
	var lIssuerId= "<b:write property="firstGradeBond/lIssuerId" />";
	var vcProductCode=nui.get("vcProductCode").getValue();
	if(lIssuerId=="" || vcProductCode==""){
		return;
	}
	var json = nui.encode({vcProductCode:vcProductCode,lIssuerId:lIssuerId});
	$.ajax({
		url:"com.cjhxfund.ats.fm.instr.atsFmBiz.getVfundasset.biz.ext",
		type:'POST',
		data:json,
		cache:false,
		async:false,
		contentType:'text/json',
		success:function(text){
			if((text.enFundValue!=null || text.fsumamount!=null) && text.applyInsts!=null){
				if(text.enFundValue[0] != undefined && text.enFundValue[0].ENFUNDVALUE!=null && text.enFundValue[0].ENFUNDVALUE!=""){
					nui.get("enNetScale").setValue(text.enFundValue[0].ENFUNDVALUE/10000);
					//设置净值规模隐藏提交值
					nui.get("enNetScale1").setValue(text.enFundValue[0].ENFUNDVALUE/10000);
					formatNumberCommon("enNetScale",4);	
				}
				if(text.fsumamount[0] != undefined && text.applyInsts[0] != undefined){						
					nui.get("fsumamount").setValue(text.fsumamount[0].FSUMAMOUNT);
				}
			}
		}
	});
	
	var enIssueBalance = nui.get("enIssueBalance").getValue().replace(/,/gi,'');        //发行规模
	var enInvestBalance1 = nui.get("vcInvestBalance").getValue().replace(/,/gi,''); 	//投标金额
    var payFaceValue = nui.get("payFaceValue").getValue().replace(/,/gi,''); 	        //缴款面值
    var enNetScale = nui.get("enNetScale").getValue().replace(/,/gi,'');  				//净值规模
    var enCategoryMoney = nui.get("fsumamount").getValue().replace(/,/gi,'');      		//债券存量
    var enInvestBalance;
    //如果缴款面值为空，这用投标金额算债券占比,否则用缴款面值算
    if(payFaceValue=="" || payFaceValue==null){
      enInvestBalance=enInvestBalance1;
    }else{
      enInvestBalance=payFaceValue;
    }
       		
    //当发行规模与缴款面值不为空并且不为0时计算该笔债券投资占发行规模比例
	//公式为缴款面值/发行规模
	if(enIssueBalance != "" && enInvestBalance != "" && enIssueBalance != 0 && enInvestBalance != 0){
	   nui.get("enInvestScaleRatio").setValue(((enInvestBalance/(enIssueBalance * 10000)) * 100).toFixed(6));
	}else{
	   nui.get("enInvestScaleRatio").setValue(0);
	}
	       
	//当缴款面值、债券存量与净值规模都不为空并且都不为0时计算同一发行人占产品净值规模比例
	//公式为(本次缴款面值+主体发行债券存量)/净值规模
	if(enNetScale != "" && enInvestBalance != "" && enCategoryMoney != ""){
	    if(enNetScale != 0 && enInvestBalance != 0 && enCategoryMoney != 0){
	       nui.get("enIssuerNetRatio").setValue((((Number(enInvestBalance) + Number(enCategoryMoney * 10000))/(enNetScale * 10000)) * 100).toFixed(6));
	    }
	}else{
	   nui.get("enIssuerNetRatio").setValue(0);
	}
	       
	//当净值规模与投标金额不为空并且不为0时计算该笔债券投资占产品净值规模比例
	//公式为投标金额/净值规模
	if(enNetScale != "" && enInvestBalance != "" && enNetScale !=0 && enInvestBalance != 0){
	   nui.get("enInvestNetRatio").setValue(((enInvestBalance/(enNetScale * 10000)) * 100).toFixed(6));
	}else{
	   nui.get("enInvestNetRatio").setValue(0);
	}	
}
	function dateTemp(oldData){
			oldData=oldData+"";
			if(oldData==0 || oldData=="" || oldData=="null"){
				return "";
			}
			
			var datas=oldData.indexOf("-");
			if(datas>=0){
				return oldData;
			}
			var yy=oldData.substr(0,4);//0开始，截取后面4位
			var mm=oldData.substr(4,2);//4开始，截取后面2位
			var dd=oldData.substr(6,2);
			
			return yy+"-"+mm+"-"+dd;
		}
		
	function onAccountTypeChanged() {
	 		var vcStockType=nui.get("vcStockType").getValue();
	        if(vcStockType!="" && vcStockType!=null){
		        if(vcStockType == 'Q' || vcStockType == 'O' ){
		        	$("#morStockNameAndCode").show();
		        	$("#morStockAmount").show();
		        }else{
			       nui.get("vcMortStockName").setValue("");
			       nui.get("vcMortStockCode").setValue("");
			       nui.get("vcMortStockAmount").setValue("");
			        $("#morStockNameAndCode").hide();
		           $("#morStockAmount").hide();
		        }
		    }
        }
    </script>
    <script	src="<%=request.getContextPath() %>/fm/instr/processUtil/process.js" type="text/javascript"></script>
	<script type="text/javascript">
		
		//获取回退的实例对象
		loadActivities();
		
		
		//债券类别为可转债时，显示股票名称，股票代码，抵押股票数量
		onAccountTypeChanged();
		
		//分解投标截止时间
		var dApplicationDateStr =  nui.get("dBidLimitTime").getValue();
		var dApplicationDate  = new Date(Date.parse(dApplicationDateStr.replace(/-/gi,  "/")));
		nui.get("dApplicationDate").setValue(dApplicationDate);
		nui.get("dApplicationTimeHH").setValue(dApplicationDate.getHours());
		nui.get("dApplicationTimeMM").setValue(dApplicationDate.getMinutes());
		
		//初始化产品净值规模(万元)和已投资该发行主体债券存量(万元)的三位一逗
		formatNumberCommon("fsumamount",4);
		formatNumberCommon("enNetScale",4);
		
		function inIt(){
			//缴款面值加千分位
			//payFaceValueFun();
			//缴款金额(万元)加千分位
			paymentMoneyFun();
			//中签数量加入千分位
			//formatNumberCommon("vcBallotNumber",0);  
			
			//获取参数
      		var resaleRight = "<b:write property="firstGradeBond/cIsHaveSaleback" />";          //是否具有回售权
	  		var redemptionRight = "<b:write property="firstGradeBond/cIsHaveBuyback" />";  //是否具有赎回权

			if(resaleRight == "1"){
				document.getElementById("resaleYear").style.display = "block";
			}
			if(redemptionRight == "1"){
				
				document.getElementById("redemptionYear").style.display = "block";
			}
		}
		//初始化调用
		//inIt();
		
		//调用附件查询方法
     	loademployeeGrid("file_grid","#file_Form");	
     	var columns = file_grid.columns;
     	if(activityDefID == "ATS_FM_XXHD1" || activityDefID == "ATS_FM_CZ_ZBFH" || activityDefID == "ATS_FM_CZ_SFFXYYY"){
     		columns[columns.length - 1].header = "<label style='color: red;'>是否需要归档</label>";
     		columns[columns.length - 2].readOnly = true;
     		columns[columns.length - 3].header = "<label style='color: red;'>是否需要用印</label>";
     	}else{
     		columns[columns.length - 3].readOnly = true;
     		columns[columns.length - 2].readOnly = true;
     		columns[columns.length - 1].readOnly = true;
     	}
     	
     	function showTips() {
			var reportTypeMark = "";
			var json = '{"paramKey":"REPORT_TYPE_MARK"}';
			var url = "<%= request.getContextPath() %>/fm/instr/firstGradeDebt/reportMark.jsp";
			var title = "报量方式说明";
			var width = "610";
			var height = "618";
			//从系统参数获得报量方式
			$.ajax({
				url:"com.cjhxfund.ats.fm.comm.zhfwptparamconfbiz.getParamValue.biz.ext",
				type:'POST',
				data:json,
				cache:false,
				async:false,
				contentType:'text/json',
				success:function(data){
					reportTypeMark = data.paramValue;
				}
			});
			nui.open({
				url: url,
				title: title, width: width, height: height,
				onload: function () {//弹出页面加载完成
					 var iframe = this.getIFrameEl(); 
        			//调用弹出页面方法进行初始化
        			iframe.contentWindow.SetData(reportTypeMark); 
				},
				ondestroy: function (action) {//弹出页面关闭前,把新增的主体简称返回赋值给查询框
				}
			});
	}
	
	//查询债券详情
	  function queryStockDetail(){
	    var lStockIssueId= nui.get("stockissueinfo.lStockIssueId").getValue();
	  	nui.open({
                    url: "<%=request.getContextPath() %>/fm/baseinfo/firstGradeDebt/debtIssueQueryDetail.jsp?lStockIssueId="+lStockIssueId,
                    title: "详细信息", 
                    width: 980, 
           			height: 700,
                    //allowResize:false,
                    onload: function () {
                        var iframe = this.getIFrameEl();
                        iframe.contentWindow.initForm();
                    },
                    ondestroy: function (action) {
                        if(action=="saveSuccess"){
	                        grid.reload();
                   	 	}
                    }
                });
	  }
	  
	// 报量历史展示
	function reportHistory(){
		var investNo = nui.get("lInvestNo").value;
		nui.open({
			url: "<%= request.getContextPath() %>/fm/comm/showReportHistory.jsp",
			title: "历史报量", 
			width: 650, 
			height: 450,
			onload: function () {//弹出页面加载完成
				 var iframe = this.getIFrameEl(); 
				//调用弹出页面方法进行初始化
				iframe.contentWindow.setData(investNo); 
			},
			ondestroy: function (action) {//弹出页面关闭前,把新增的主体简称返回赋值给查询框
			}
		});
	}
	</script>
</body>
</html>