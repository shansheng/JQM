<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<%@page import="commonj.sdo.DataObject"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="/common/js/commscripts.jsp" %>
<!-- 
  - Author(s): CJ-WB-DT13
  - Date: 2016-03-01 15:29:20
  - Description:
-->
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
	   
	   int tabsIndex=0;//默认选择基本信息界面
	   if (userObject != null) {
		 String userOrgId = (String)userObject.getUserOrgId();//获取机构
		 if("50".equals(userOrgId)){//机构为综合部的
		 	tabsIndex=1;
		 }
		}
 %>
  	<script type="text/javascript" src="<%=request.getContextPath() %>/common/js/commonjs.js"></script>
<head>
<title><b:write property="workitem/workItemName" />-详情</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />

    <style type="text/css">
      .td1{
        border-right: 1px solid #D3D3D3;
        border-left: 1px solid #D3D3D3;
      }
      .td2{
        border-right: 1px solid #D3D3D3;
      }
      .p{
           border-bottom: 1px solid #D3D3D3;     
        }
        P{
          margin: 0px;padding: 0px;
        }
    </style>
    
</head>
<body style="height: 99%;">
 <div id="dataform1" style="height: 100%;">
   <div class="nui-tabs" id="tabs" activeIndex="<%=tabsIndex %>"  style="width:100%;height:100%;">
		<!-- 业务类型标签页开始... -->
		<div title="基本信息">
			<!-- 左右布局控件 -->
			<div id="layout1" class="nui-layout" style="width:100%;height:100%;" >
				<!-- 主体内容 -->
				<div title="center" region="center" width="80%">
			    <input class="nui-hidden" id="processinstid" name="processinstid" value="<%=processinstid %>"/>
			    <input class="nui-hidden" id="workItemID" name="workItemID" value="<%=workItemID %>"/>
			    <input class="nui-hidden" id="workItemName" name="workItemName" value="<b:write property="workitem/workItemName" />"/>
			    <input class="nui-hidden" id="lInvestNo" name="firstGradeBond.lInvestNo" value="<b:write property="firstGradeBond/lInvestNo" />"/>
			    <input class="nui-hidden" id="lApplyInstId" name="firstGradeBond.lApplyInstId" value="<b:write property="firstGradeBond/lApplyInstId" />"/>
			    <input class="nui-hidden" id="lBizId" name="firstGradeBond.lBizId" value="<b:write property="firstGradeBond/lBizId" />"/>
			    <input class="nui-hidden" id="vcBusinessType" name="firstGradeBond.vcBusinessType" value="<b:write property="firstGradeBond/vcBusinessType" />"/>
			    <input class="nui-hidden" id="vcProductCode" name="firstGradeBond.vcProductCode" value="<b:write property="firstGradeBond/vcProductCode" />"/>
			    <input class="nui-hidden" id="vcCombiNo" name="firstGradeBond.vcCombiNo" value="<b:write property="firstGradeBond/vcCombiNo" />"/>
			    <input class="nui-hidden" id="dBidLimitTime" name="firstGradeBond.dBidLimitTime" value="<b:write property="firstGradeBond/dBidLimitTime" />"/>
			    <input class="nui-hidden" name="firstGradeBond.enInvestBalance" id="vcInvestBalance" value="<b:write property="firstGradeBond/enInvestBalance" />"/>
				<input class="nui-hidden" name="firstGradeBond.enInterestRate" id="enInterestRate" value="<b:write property="firstGradeBond/enInterestRate" />"/>
			    <table style="width:100%;table-layout:fixed;" class="nui-form-table">
	                <tr>
	                    <td class="form_label" width="25%" align="right">
	                        业务日期:    
	                    </td>
	                    <td colspan="1" width="25%">
	                        <input class="nui-datepicker" name="firstGradeBond.dApplicationTime" width="170" value="<b:write property="firstGradeBond/dApplicationTime" />" readonly/>
	                    </td>
	                    <td class="form_label" align="right">
								投标截止日期:
						  	</td>
						  	<td colspan="1">
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
	                        <input class="nui-textbox" id="vcProductName" width="170" name="firstGradeBond.vcProductName" value="<b:write property="firstGradeBond/vcProductName" />" readonly/>
	                    </td>
	                    <td class="form_label" align="right">
		                        组合名称:
		                  </td>
		                  <td colspan="1" >
		                      <input class="nui-textbox"  width="170" id="vcCombiName" name="firstGradeBond.vcCombiName" value="<b:write property="firstGradeBond/vcCombiName" />" readonly/>
		                  </td>
	                </tr>
	                <tr>
	                    <td class="form_label" align="right">
	                        债券代码:
	                    </td>
	                    <td colspan="1" >
	                        <%--<input class="nui-textbox" name="firstGradeBond.vcStockCode"/>--%>
	                        <input  id="vcStockCode" width="170" class="nui-textbox"name="firstGradeBond.vcStockCode" value="<b:write property="firstGradeBond/vcStockCode" />" readonly/>
	                    </td>
	                	<td class="form_label" align="right">
	                        债券简称:
	                    </td>
	                    <td colspan="1" >
	                        <input class="nui-textbox" id="vcStockName" width="170" name="firstGradeBond.vcStockName" value="<b:write property="firstGradeBond/vcStockName" />" readonly/>
	                    </td>
	                </tr>
	                <tr>
	                <td class="form_label" align="right">
	                        登记托管机构:
	                    </td>
	                    <td colspan="1" >
	                        <input class="nui-dictcombobox" dictTypeId="CF_JY_DJTGCS" width="170" name="firstGradeBond.vcPaymentPlace" id="vcPaymentPlace"
	                        value="<b:write property="firstGradeBond/vcPaymentPlace" />" readonly/>
	                    </td>
	                    <td class="form_label" align="right">
	                        债券类别:
	                    </td>
	                    <td colspan="1" >
	                        <input class="nui-textbox" width="170" id="vcStocktypeName" name="firstGradeBond.vcStocktypeName" 
	                        	value="<b:write property="firstGradeBond/vcStocktypeName" />" readonly/>
	                        <input class="nui-hidden" id="vcStockType" name="firstGradeBond.vcStockType" 
	                        	value="<b:write property="firstGradeBond/vcStockType" />" />  
	                    </td>
	                </tr>
	                <tr>
	                	<td class="form_label" align="right">
	                        发行主体:
	                    </td>
	                    <td colspan="1" >
	                        <input class="nui-textbox" width="170" name="firstGradeBond.vcIssuerNameFull" value="<b:write property="firstGradeBond/vcIssuerNameFull" />" readonly/>
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
					    	readonly="readonly"	value="<b:write property="firstGradeBond/lIssueBeginDate" />"/>
					   </td>
					   <td class="form_label" align="right">
	                         发行规模(亿):
	                    </td>
	                    <td colspan="1" >
	                        <input class="nui-textbox" name="firstGradeBond.enIssueBalance" width="170" value="<b:write property="firstGradeBond/enIssueBalance" />" readonly/>
	                    </td>
	                </tr>
	                </table>
	                <div style="height: 5px"></div>
	    <div id="panel1" class="mini-panel" title="其他信息" iconCls="icon-edit" style="width:100%;padding: 0px;" 
    		showToolbar="true" showCollapseButton="true" showFooter="true" allowResize="false" collapseOnTitleClick="true">
		           <table style="width:100%; table-layout:fixed;" border="0" class="nui-form-table">
		           <tr>
		           		<td class="form_label" width="25%" align="right">
	                        主承销商:
	                    </td>
	                    <td colspan="3">
	                        <input class="nui-textbox" name="firstGradeBond.vcMainUnderwriter" width="90%" value="<b:write property="firstGradeBond/vcMainUnderwriter" />" readonly/>
	                    </td>
		           </tr>
		           <tr>
		           		<td class="form_label" width="25%" align="right">
	                        副主承销商:
	                    </td>
	                    <td colspan="3">
	                        <input class="nui-textbox" name="firstGradeBond.vcDeputyUnderwriter" width="90%" value="<b:write property="firstGradeBond/vcDeputyUnderwriter" />" readonly/>
	                    </td>
		           </tr>
		           <tr>
		           		<td class="form_label" width="25%" align="right">
	                        承销团:
	                    </td>
	                    <td colspan="3">
	                        <input class="nui-textbox" name="firstGradeBond.vcGroupUnderwriter" width="90%" value="<b:write property="firstGradeBond/vcGroupUnderwriter" />" readonly/>
	                    </td>
		           </tr>
		           <tr>
						<td class="form_label" align="right">
	                        交易对手:
	                    </td>
	                    <td colspan="1" >
							<input class="nui-textbox" name="firstGradeBond.vcBusinessObject" id="vcBusinessObject" style="width: 170px;" readonly="readonly"
							value="<b:write property="firstGradeBond/vcBusinessObject" />" />
	                    </td>
	                    <td class="form_label" align="right">
	                       主体类型:
	                    </td>
	                    <td colspan="1" >
	                        <input class="nui-dictcombobox" dictTypeId="ATS_FM_ISSUE_PROPERTY" width="170" name="firstGradeBond.vcIssueProperty" value="<b:write property="firstGradeBond/vcIssueProperty" />" readonly/>
	                    </td>
	                </tr>
	                <tr>
	                	<td class="form_label" align="right">
	                        主体评级:
	                    </td>
	                    <td colspan="1">
	                        <input class="nui-dictcombobox" dictTypeId="issuerRating" width="170" id="cIssueAppraise" 
	                        name="firstGradeBond.cIssueAppraise" value="<b:write property="firstGradeBond/cIssueAppraise" />" readonly/>
	                    </td>
	                    <td class="form_label" align="right">
	                        债券评级:
	                    </td>
	                    <td colspan="1" > 
	                        <input class="nui-dictcombobox" dictTypeId="creditRating" id="cBondAppraise" 
	                        width="170" name="firstGradeBond.cBondAppraise" value="<b:write property="firstGradeBond/cBondAppraise" />" readonly/>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="form_label" align="right">
	                        主体评级机构:
	                    </td>
	                    <td colspan="1">
	                        <input class="nui-dictcombobox" dictTypeId="outRatingOrgan" width="170" id="vcIssueAppraiseOrgan" 
	                        name="firstGradeBond.vcIssueAppraiseOrgan" value="<b:write property="firstGradeBond/vcIssueAppraiseOrgan" />"  readonly/>
	                    </td>
	                    <td class="form_label" align="right">
	                        债券评级机构:
	                    </td>
	                    <td colspan="1">
	                        <input class="nui-dictcombobox" dictTypeId="outRatingOrgan" width="170" id="vcBondAppraiseOrgan" 
	                        name="firstGradeBond.vcBondAppraiseOrgan" value="<b:write property="firstGradeBond/vcBondAppraiseOrgan" />"  readonly/>
	                    </td>
	                </tr>
	                <tr>
	                    <td colspan="1" class="form_label" align="right">
				特殊条款:	
						</td>
						<td colspan="1" >
						 <input width="170" id="stockissueinfo.vcSpecialText"  class="nui-dictcombobox" name="stockissueinfo.vcSpecialText"  valueField="dictID" textField="dictName" dictTypeId="specialText"  
							emptyText="请选择" nullItemText="请选择" multiSelect="true" showClose="true" valueFromSelect="true"  oncloseclick="onCloseClickValueEmpty" 
							value="<b:write property="firstGradeBond/vcSpecialText" />" readonly/>
						</td>
	                    <td class="form_label" align="right">
	                        发行期限(年):
	                    </td>
	                    <td colspan="1">
	                        <input class="nui-textbox" name="firstGradeBond.enExistLimite" width="170" value="<b:write property="firstGradeBond/enExistLimite" />" readonly/>
	                    </td>
	                </tr>
	                <tr>
	                      <td class="form_label" align="right">
						     	特殊期限:
						  </td>
						  <td colspan="1">
						      <input class="nui-textbox" name="firstGradeBond.vcSpecialLimite" width="170" value="<b:write property="firstGradeBond/vcSpecialLimite" />" readonly="readonly"/>
						  </td>
	                	<td colspan="1" class="form_label" align="right">
				           	下一行权日:
	                    </td>
	                    <td colspan="1">
	                    	<input style="width:170px;" class="nui-datepicker" id="lNextExerciseDate" name="stockissueinfo.lNextExerciseDate" 
	                    	value="<b:write property="firstGradeBond/lNextExerciseDate" />" readonly="readonly"/>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="form_label" align="right">
	                       下一利率跳升点数:
	                    </td>
	                    <td colspan="1" >
	                    	<input class="nui-textbox" name="stockissueinfo.lNInterestRateJumpPoints" id="lNInterestRateJumpPoints" style="width: 170px;"
							value="<b:write property="firstGradeBond/lNInterestRateJumpPoints" />" readonly="readonly"/>
	                    </td> 
	                	<td class="form_label" align="right">
	                        首次付息日:
	                    </td>
	                    <td colspan="1" >
							<input class="nui-datepicker" name="firstGradeBond.dInitInterestPaymentDate" id="dInitInterestPaymentDate"
							value="<b:write property="firstGradeBond/dInitInterestPaymentDate" />" style="width: 170px;"  readonly/>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="form_label" align="right">
	                       公司净资产（元）:
	                    </td>
	                    <td colspan="1" >
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
	                    <td colspan="1" >
							<input class="nui-textbox" name="stockissueinfo.vcMortStockCode" id="vcMortStockCode" style="width: 170px;" readonly="readonly"
							value="<b:write property="firstGradeBond/vcMortStockCode" />" />
	                    </td>  
	                </tr>
	                
	                 <tr id="morStockAmount">
	                    <td class="form_label" align="right">
	                        股票抵押数量(万股):
	                    </td>
	                    <td colspan="1" >
							<input class="nui-textbox" name="stockissueinfo.vcMortStockAmount" id="vcMortStockAmount" style="width: 170px;"
							value="<b:write property="firstGradeBond/vcMortStockAmount" />" readonly="readonly"/>
	                    </td>
	                    <td class="form_label" align="right">
	                    	
	                    </td>
	                    <td colspan="1" >

	                    </td>
	                </tr>
	                <tr>
	                    <td class="form_label" align="right">
	                     所属行业(证监会二级):
	                    </td>
	                    <td colspan="1" >
							<input class="nui-hidden" name="stockissueinfo.vcIssueAppraiseCsrc" id="vcIssueAppraiseCsrc" style="width: 170px;"
							value="<b:write property="firstGradeBond/vcIssueAppraiseCsrc" />" readonly="readonly"/>
							<input class="nui-textbox" width="170" id="vcIssueAppraiseCsrcName" name="stockissueinfo.vcIssueAppraiseCsrcName" 
	                        	value="<b:write property="firstGradeBond/vcIssueAppraiseCsrcName" />" readonly/>
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
	                         dictTypeId="COF_YESORNO" style="float: left;" onvaluechanged="redemptionRightOnvaluechanged(e)" value="<b:write property="firstGradeBond/cIsHaveBuyback" />" readonly/>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="form_label" align="right" style="border-bottom: 1px solid #D3D3D3;">
	                        备注:
	                    </td>
	                    <td colspan="3"  style="border-bottom: 1px solid #D3D3D3;">
	                        <input class="nui-textarea" width="515" height="40" name="firstGradeBond.vcRemarks"
	                        value="<b:write property="firstGradeBond/vcRemarks" />" readonly/>
	                    </td>
	                </tr>
	            </table>
	             <table style="width:100%; table-layout:fixed;" border="0" class="nui-form-table">	
	            	<tr>
	                    <td class="form_label" align="right" style="padding: 5px 5px;">
				                       已投资该发行主体债券存量(万元):
				        </td>
			            <td colspan="1" style="padding: 5px 5px;">
							<input class="nui-textbox"  id="fsumamount" style="width: 170px;float: left;margin-right: 10px;" readonly="readonly" 
							value="<b:write property="firstGradeBond/enCategoryMoney" />" />
			            </td>
			             <td class="form_label" align="right" style="padding: 5px 5px;">
		                        产品净值规模(万元):
		                </td>
		                <td colspan="1" style="padding: 5px 5px;">
							<input class="nui-textbox" name="firstGradeBond.enNetScale" id="enNetScale" style="width: 170px;"
							value="<b:write property="firstGradeBond/enNetScale" />" onvaluechanged="calculationNetWorthScale" readonly="readonly"/>
		                </td>
		            </tr>
					<tr>
			                <td class="form_label" align="right" style="padding: 5px 5px;">
			                该笔债券投资占发行规模比例(%):
			                </td>
			                <td colspan="1" style="padding: 5px 5px;">
								<input class="nui-textbox asLabel" id="enInvestScaleRatio" style="width: 170px;" readonly="readonly" value="<b:write property="firstGradeBond/enInvestScaleRatio" />" onvaluechanged="BondAccountedCalculation"/>
		                    </td>
		                     <td class="form_label" align="right" style="padding: 5px 5px;">
			                同一发行主体占产品净值规模比例(%):
			                </td>
			                <td colspan="1" style="padding: 5px 5px;">
								<input class="nui-textbox asLabel" id="enIssuerNetRatio" style="width: 170px;" readonly="readonly" value="<b:write property="firstGradeBond/enIssuerNetRatio" />" onvaluechanged="BondAccountedCalculation"/>
		                    </td>
			            </tr>
			            <tr>
			                <td class="form_label" align="right" style="padding: 5px 5px;">
			                该笔债券投资占产品净值规模比例(%):
			                </td>
			                <td colspan="1" style="padding: 5px 5px;">
								<input class="nui-textbox asLabel" id="enInvestNetRatio" style="width: 170px;" readonly="readonly" value="<b:write property="firstGradeBond/enInvestNetRatio" />" onvaluechanged="BondAccountedCalculation"/>
		                    </td>
		                     <td class="form_label" align="right" style="padding: 5px 5px;">
			                弱流动性资产规模占产品净值规模比例(%):
			                </td>
			                <td colspan="1" style="padding: 5px 5px;">
								<input class="nui-textbox asLabel" id="enWeakNetRatio" style="width: 170px;" readonly="readonly" value="<b:write property="firstGradeBond/enWeakNetRatio" />" onvaluechanged="BondAccountedCalculation"/>
		                    </td>
		                <tr>
	            </table>
	            </div>
				<div title="报量录入">
						<div class="nui-toolbar" style="border-bottom:0;padding:0px;margin-top: 2px;height: 27px;">
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
					                <td >
										<a class="nui-button " plain="false" iconCls="icon-help" onclick="showTips()"  plain="false" tooltip="帮助">
											&nbsp;
										</a>
									</td>
								</tr>
							</table>
						</div>
						<div style="font-size:10px;color:red;">
								<div style="width:50%;float: left;padding-left: 10px;"><b>说明：</b>①报量为100万整数倍；②特殊说明请在报量说明中填写；③报价待定时为空即可</div>
								<div style="width:30%;float: right;padding-right: 10px;text-align: right;line-height: 27px;">
								报量方式：<input style="width: 130px;"  url="<%= request.getContextPath() %>/fm/instr/processUtil/reportData.txt" 
								class="nui-dictcombobox"  value="<b:write property="firstGradeBond/cReportType" />" readonly="readonly"/>
								</div>
						</div>
			            <div class="nui-datagrid" id="instReport"   height="100px" showPager="false" allowSortColumn="false" allowCellSelect="true" 
							 allowCellEdit="true"  url="com.cjhxfund.ats.fm.instr.StockIssueInfoBiz.loadReport.biz.ext?bizId=<%=bizId %>" multiSelect="true" allowCellValid="true" >
								<div property="columns">
									<div field="enReport"  headerAlign="center" allowSort="true">报量(万元)</div>
									<div field="enOffer"  headerAlign="center" allowSort="true">报价(%)</div>
									<div field="vcReportRemark"  headerAlign="center" allowSort="true">报量说明</div>
								</div>
						</div>
					</div>
					
		      <%--   <div class="nui-panel" title="缴款信息"  style="width:100%;height: 28px;margin-top: 5px;" showToolbar="false" showFooter="true" >
			   </div>
			   <table style="width:100%;table-layout:fixed;" class="nui-form-table">
			      <tr>
		             <td class="form_label" align="right" width="25%">
		               	缴款面值(万元):
		             </td>
		             <td colspan="1" class="radio-border-top-none" width="25%" >
		                 <input class="nui-textbox" id="payFaceValue" value="<b:write property="firstGradeBond/enPayFaceValue" />"   style="width: 170px;" readonly="readonly" /> 
		             </td>
			         <td class="form_label" align="right" width="25%">
		                                                   发行价格(元):
		             </td>
		             <td colspan="1" class="radio-border-top-none" width="25%" >
		                 <input class="nui-textbox" name="firstGradeBond.enBallotPrice" id="vcBallotPrice"
		                    value="<b:write property="firstGradeBond/enBallotPrice" />" style="width: 170px;"  readonly="readonly"/>
		             </td>
				  </tr>
			      <tr>	 
		             <td class="form_label" align="right" width="25%">
						缴款金额(万元):
		             </td>
		             <td colspan="1" class="radio-border-top-none" width="25%" >
		                 <input class="nui-textbox"  id="paymentMoney" value="<b:write property="firstGradeBond/enPaymentMoney" />"  style="width: 170px;" readonly="readonly"/>
		             </td>
		             <td class="form_label" align="right" width="25%">
		                        缴款日期:
		             </td>
		            <td colspan="1"  width="25%">
						<input class="nui-datepicker" name="firstGradeBond.dPaymentDate" id="dPaymentDate" 
							value="<b:write property="firstGradeBond/dPaymentDate" />"  style="width: 170px;" readonly="readonly"/>
		             </td>
				</tr>
		          <tr>	 
		             <td class="form_label" align="right">
		                        票面利率(%):
		             </td>
		            <td colspan="1" >
						<input class="nui-textbox" name="firstGradeBond.enCouponRate" id="enCouponRate" 
							value="<b:write property="firstGradeBond/enCouponRate" />"   style="width: 170px;" readonly="readonly"/>
		             </td>
		             <td class="form_label" align="right">
		                        付息频率:
		             </td>
		             <td colspan="1">
		                 <input class="nui-dictcombobox" dictTypeId="ATS_CF_JY_FREQUENCY" name="firstGradeBond.vcFrequency" id="vcFrequency"
		                    value="<b:write property="firstGradeBond/vcFrequency" />" readonly="readonly"  style="width: 170px;" />
		             </td>
				  </tr>
		          <tr> 
		             <td class="form_label" align="right">
		                        还本方式:
		             </td>
		            <td colspan="1"  >
						<input class="nui-dictcombobox" dictTypeId="CF_JY_MODE_REPAYMENT" name="firstGradeBond.vcModeRepayment" id="vcModeRepayment" 
							value="<b:write property="firstGradeBond/vcModeRepayment" />" readonly="readonly"  style="width: 170px;" />
		             </td>
		             <td class="form_label" align="right" style="border-bottom: 1px solid #D3D3D3;">
		                        计息起始日:
		             </td>
		             <td colspan="1"  style="border-bottom: 1px solid #D3D3D3;">
		             <input class="nui-datepicker" name="firstGradeBond.lBegincalDate" id="lBegincalDate" 
							value="<b:write property="firstGradeBond/lBegincalDate" />" readonly="readonly"  style="width: 170px;" />
		             </td>
				  </tr>
		          <tr>
		             <td class="form_label" align="right" style="border-bottom: 1px solid #D3D3D3;">
		                                                    到期日:
		             </td>
		             <td colspan="3"  style="border-bottom: 1px solid #D3D3D3;">
		                 <input class="nui-datepicker" name="firstGradeBond.lEndincalDate" id="lEndincalDate"
		                    value="<b:write property="firstGradeBond/lEndincalDate" />" readonly="readonly"  style="width: 170px;"/>
		             </td>
		           </tr>
			   </table> --%>
			   
			   
			   <%-- <div class="nui-panel" title="收款账户信息"  style="width:100%;height: 28px;margin-top: 5px;" showToolbar="false" showFooter="true" >
			       </div>
	            <table style="width:100%;table-layout:fixed;" class="nui-form-table">
	                <tr>
	                    <td class="form_label" width="25%" align="right">
	                        缴款方式:    
	                    </td>
	                    <td colspan="1" width="25%">
	                        <input class="nui-dictcombobox" dictTypeId="ATS_FM_PAYMENT" id="vcTransactionType" name="firstGradeBond.vcTransactionType" width="170" 
	                        value="<b:write property="firstGradeBond/vcTransactionType" />" readonly/>
	                    </td>
	                    <td class="form_label" width="25%" align="right">
	                        收款人户名:
	                    </td>
	                    <td colspan="1" width="25%" >
	                        <input class="nui-textbox"id="vcBeneficiary" width="170" name="firstGradeBond.vcBeneficiary" value="<b:write property="firstGradeBond/vcBeneficiary" />" readonly/>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="form_label" width="25%" align="right">
	                        收款账号:    
	                    </td>
	                    <td colspan="1" width="25%">
	                        <input class="nui-textbox" name="firstGradeBond.vcCollectionAccount" value="<b:write property="firstGradeBond/vcCollectionAccount" />" width="170" readonly/>
	                    </td>
	                    <td class="form_label" width="25%" align="right">
	                        大额支付行号:
	                    </td>
	                    <td colspan="1" width="25%" >
	                        <input class="nui-textbox" id="bankLine" width="170" name="firstGradeBond.vcPayLine" value="<b:write property="firstGradeBond/vcPayLine" />" readonly/>
	                    </td>
	                </tr>
	                <tr>
	                   <td class="form_label" width="25%" align="right" style="border-bottom: 1px solid #D3D3D3;">
	                        备注:
	                    </td>
	                    <td colspan="3"  style="border-bottom: 1px solid #D3D3D3;">
	                        <input class="nui-textarea" id="receivableRemark" width="515" height="40" name="firstGradeBond.vcReceivableRemark" value="<b:write property="firstGradeBond/vcReceivableRemark" />" readonly/>
	                    </td>
	                </tr>
	            </table>  --%>
	            
	            
             </div> 
             
             
             
             <!-- 投资范围 -->
				<!-- 居右east，据左west -->
				<div  title="投资范围" region="east" width="275" showCloseButton="false" showSplitIcon="true">	
		    		<iframe src="<%=request.getContextPath() %>/fm/comm/ProductInvestmentRange.jsp?vcProductCode=<%=vcProductCode %>" width="100%" height="100%" scrolling="auto" frameborder="0"></iframe>
				</div>  
				
				
				
				
            </div> 
          </div>  
          
          
          
          
		<div title="审批内容">
		   <%@include file="/fm/instr/firstGradeDebt/processDone.jsp" %>
		</div>
		<div title="流程信息" url="com.cjhxfund.ats.fm.comm.processGraph.flow?processInstID=<%=processinstid %>&workItemID=<%=workItemID %>&bizId=<%=bizId %>"></div>
		<%-- <div title="产品投资范围" url="<%=request.getContextPath() %>/fm/comm/ProductInvestmentRange.jsp?vcProductCode=<%=vcProductCode %>"></div> --%>
   </div>
 </div>
   <script type="text/javascript">
     nui.parse();
     var form = new nui.Form("#dataform1");//将普通form转为nui的form
     //在线打开用印文档
     var file_grid = nui.get("file_grid");
     var contextPath = '<%=request.getContextPath() %>';
     var activityDefID = '<b:write property="workitem/activityDefID" />';     //获取环节活动定义ID
	 
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
        
        //登记机构改变事件
		function onVcPaymentPlace(){
			var place=nui.get("vcPaymentPlace").getValue();
			var vcStockType = nui.get("vcStockType").getValue();
			if("D"==vcStockType && "02" ==place){
				nui.get("vcTransactionType").setValue(3);
			}else if(place=="01"){
			  //中央结算公司cPayType
			  	nui.get("vcTransactionType").setValue(2);
			}else if(place=="02"){
			  //上海清算所
			  nui.get("vcTransactionType").setValue(1);
			}else{
			  nui.get("vcTransactionType").setValue(3);
			}
		}  
   </script>	
    <script src="<%=request.getContextPath() %>/fm/instr/processUtil/process.js" type="text/javascript"></script> 
   <script type="text/javascript">
     	var file_grid = nui.get("file_grid");   //附件列表对象
    	var form = new nui.Form("#dataform1");//将普通form转为nui的form
    	
    	//加载报量信息
		//var instReport_from = new nui.Form("instReport_from");
		var instReport = nui.get("instReport");
    	instReport.load();
    	
    	//债券类别为可转债时，显示股票名称，股票代码，抵押股票数量
		onAccountTypeChanged();
		
		if("ATS_FM_CZ_ZBFH" == activityDefID){
			//如果缴款方式有值，则不对缴款方式设默认值
			var transactionTypeValue = nui.get("vcTransactionType").getValue();
			if(null==transactionTypeValue || ""==transactionTypeValue){
				onVcPaymentPlace();//中标复核缴款方式与登记机构关联
			}
		}
		
		var dApplicationDateStr =  nui.get("dBidLimitTime").getValue();
		var dApplicationDate  = new Date(Date.parse(dApplicationDateStr.replace(/-/gi,  "/")));
		nui.get("dApplicationDate").setValue(dApplicationDate);
		nui.get("dApplicationTimeHH").setValue(dApplicationDate.getHours());
		nui.get("dApplicationTimeMM").setValue(dApplicationDate.getMinutes());
		
		
		//初始化产品净值规模(万元)和已投资该发行主体债券存量(万元)的三位一逗
		formatNumberCommon("fsumamount",4);
		formatNumberCommon("enNetScale",4);
    	
    	//附件列表查询
    	var file_grid = nui.get("file_grid");
		var file_Form = new nui.Form("#file_Form").getData(false,false);
		file_grid.load(file_Form);
	
		//缴款面值
		 function payFaceValueFun(){
		    formatNumberCommon("payFaceValue",4);
		 }
		 
		 //缴款金额(万元)
	     function paymentMoneyFun(){
	         formatNumberCommon("paymentMoney",4);
	     }
	     
		function inIt(){
			//缴款面值加千分位
			payFaceValueFun();
			//缴款金额(万元)加千分位
			paymentMoneyFun();
			//中签数量加入千分位
			formatNumberCommon("vcBallotNumber",4);  
			
			//获取参数
      		var resaleRight = "<b:write property="firstGradeBond/cIsHaveSaleback" />";          //是否具有回售权
	  		var redemptionRight = "<b:write property="firstGradeBond/cIsHaveBuyback" />";  //是否具有赎回权

			if(resaleRight == 1){
				document.getElementById("resaleYear").style.display = "block";
			}
			if(redemptionRight == "1"){
				
				document.getElementById("redemptionYear").style.display = "block";
			}
		}
		//初始化调用
		//inIt();
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