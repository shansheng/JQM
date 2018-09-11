<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" %>
<%@ page import="com.eos.foundation.eoscommon.CacheUtil" %>
<%@ page import="commonj.sdo.DataObject" %>
<%@ page import="com.eos.foundation.data.DataObjectUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="/common.jsp" %>
<!-- 
  - Author(s): 吴艳飞
  - Date: 2016-09-13 13:58:47
  - Description:
-->
<head>
<title>上交所固收平台</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <style type="text/css">
    	.nui-textbox {
		    width:100%;
		 } 
		#complete_instruction  span{
		 	color:red;
		 }
		 body{
		 	width:100%;
		 	height:100%;
		 }
    	.mini-buttonedit-border{
    		padding-right:1px;
    	}
    	.instructTable tr{
		 	height:32px;
		 }
		 .submitDiv{
		 	padding-top: 18px;
		 }
		 .submitDiv a{
		 	margin-right:5px;
		 }
    </style>
    
</head>
<body>
	<div style="height:auto; width:100%;" >
		<div id="complete_instruction">
			<!-- 下单操作类型:0-新建指令 1-修改指令 -->
			<input class="nui-hidden" name="operatorType" id="operatorType" value="0"/>
			<!-- 业务类别:2-银行间二级市场业务 A –开放式基金B-存款业务C-网下申购D-债券一级市场 E-交易所大宗交易，I-上交所固定收益平台 -->
			<input class="nui-hidden" name="businClass" id="businClass" value="I"/>
			<!-- 交易市场：OTC-场外（银行间）SS-上交所，SZ-深交所； -->
			<input id="exdestination" name="exdestination" class="nui-hidden" value="SS"/>
			<!-- 投资类型：交易所，1-可交易；2-持有到期；3-可供出售；回购业务投资类型为1-可交易，不传投资类型会根据系统数决定取组合的投资类型或缺省为1-可交易，具体取值和O3保持一致。 -->
			<input id="vcInvestType" name="vcInvestType" class="nui-hidden" value="1"/>
			<!-- 证券控制类型:1-金额控 、2-数量控、缺省按2-数量控 -->
			<input id="ordtype" name="ordtype" class="nui-hidden" value="2"/>
			<!-- 结算方式（首次结算方式）：1-见款付券\2- 见券付款\3-券款对付\4-纯券过户-->
			<input id="vcFirstSettleMode" name="vcFirstSettleMode" class="nui-hidden" value="3"/>
			<!-- 指令/建议有效模式，默认为0-Day：0 – Day，当日有效；1 – GTC，一直有效，直到完成或撤销；6 – GTD，到指定日前有效  -->
			<input id="timeinforce" name="timeinforce" class="nui-hidden" value="6"/>
			<!-- 判断可用：0-不判；1-判  -->
			<input id="judgeavailable" name="judgeavailable" class="nui-hidden" value="1"/>
			<!-- 判断风控：0-不判；1-判   -->
			<input id="judgerisk" name="judgerisk" class="nui-hidden" value="1"/>
			<!--业务类型 1:银行间二级交易 2:上海大宗交易 3: 上海固收平台 4:深圳综合协议平台  -->
			<input class="nui-hidden" name="vcBizType" id="vcBizType" value="3"/>
			<!--币种 人民币:CNY  -->
			<input class="nui-hidden" name="vcCurrency" id="vcCurrency"   value="CNY"/>
			<!--插表交易市场 1-上交所;2-深交所;5-银行间;6-场外;7-中金所 -->
			<input class="nui-hidden" name="vcMarket" id="vcMarket"   value="1"/>
			<!--收益率类型：1-到期收益率，2-行权收益率  -->
			<input class="nui-hidden" name="vcYieldType" id="vcYieldType"   value="1"/>
			<input name="lPlanId" class="nui-hidden"/>
			<table id="instrcutInfo" class="instructTable" border="0" style="width: 100%;">
				<tr>
					<td style="width: 15.38%;" align="right" ><span>*</span>产品名称:</td>
					<td style="width: 30%;" align="left">
	                  	<input name="lProductId" class="nui-hidden"/>
	                   <div name="vcProductCode" class="mini-autocomplete" pinyinField="ID" id="vcProductCode"
		                             textField="TEXT" valueField="ID"
		                             searchField="productCode"
		                             url="com.cjhxfund.commonUtil.applyInstUtil.QueryTAtsProductInfoMatchSort.biz.ext"
		                             showNullItem="false"
		                             allowInput="true"
		                             emptyText="请输入产品代码或产品名称..."
		                             nullItemText="请输入产品代码或产品名称..."
		                             valueFromSelect="true"
		                             showClose="true"
		                             onvaluechanged="selectFunds"
		                             oncloseclick="onCloseClick"
		                             popupWidth="300"
		                             style="width: 125px"
		                             required="true">
		                            <div property="columns">
		                                <div header="产品代码" field="ID" width="40px"></div>
		                                <div header="产品名称" field="TEXT"></div>
		                            </div>
		                        </div> 
		                 <div class="nui-hidden" type="hidden" id="lProductId" name="lProductId" />   
					</td>
					<td style="width: 19.32%;" align="right" ><span>*</span>净价/全价:</td>
					<td style="width: 35%;" align="left">
						<span><input class="nui-textbox" id="enNetPrice" name="enNetPrice" required="true" style="width: 63px" onvalidation="numberCheck" onblur="netPriceFun" /></span>
						<label>/</label> 
						<span><input class="nui-textbox" id="enFullPrice" name="enFullPrice" required="true" style="width: 63px" onvalidation="numberCheck" onblur="fullPriceFun"/></span>
						<input id="autoCalc" name="autoCalc"  class="nui-checkbox" onvaluechanged="autoCalcChecked" checked="true" text="联动"/>
						</td>
	
					</tr>
					<tr>
						<td align="right" ><span>*</span>组合名称:</td>
						<td>
							<input name="vcCombiCode" class="nui-combobox" id="vcCombiCode"
	                           textField="TEXT" valueField="ID"
	                           dataField="data"
	                           showNullItem="false"
	                           allowInput="false"
	                           required="true"
	                           emptyText="请选择..."
	                           nullItemText="请选择..."
	                           style="width: 125px"
		                       onitemclick="onCombiLinkage"
		                       showClose="true"
		                       oncloseclick="onCloseClick"/>
					</td>
					<td align="right" id="MaturityLab"><span>*</span>到期/行权收益率:</td>
					<td align="left"  id="MaturityField">
						<span><input class="nui-textbox" id="enMaturityYield" name="enMaturityYield" style="width: 63px" enabled="false" onvalidation="numberCheck" required="true"   onblur="interestRateFun"/></span> 
						<label id="MaturityLabSplit">/</label> 
						<span><input class="nui-textbox" id="enOptionYield"  name="enOptionYield" style="width: 63px" enabled="false" onvalidation="numberCheck" required="true"   onblur="enOptionInterestRateFun"/></span>
					</td>
					
				</tr>
				<tr>
					<td align="right" ><span>*</span>债券代码:</td>
					<td>
						<div name="vcStockCode" class="mini-autocomplete" id="vcStockCode"
                             textField="stockCode" valueField="stockCode"
                             searchField="stockCode"
                             url="com.cjhxfund.ats.sm.comm.TBondBaseInfoManager.querySHBondCode.biz.ext"
                             allowInput="true"
                             emptyText="请选择..."
                             nullItemText="请选择..."
                             valueFromSelect="true"
                             dataField="bondList"
                             multiSelect="false"
                             style="width: 125px;float:left;"
                             required="true"
                             popupWidth="300"
                             onvalidation="onO32ExistValidation"
                             onvaluechanged="onActionRenderer">
	                    	<div property="columns">
	                            <div header="债券代码" field="stockCode" width="40px"></div>
	                            <div header="债券名称" field="stockName"></div>
	                    	</div>
	            		</div>
	            		<a class="mini-button" plain="true" style="float:left;height:19px;" iconCls="icon-search" onclick="showHoldingPage('inquiryShFixedIncomeHolding.jsp')" tooltip="添加新债券"></a>
	            	</td>
	            	<td align="right" ><span>*</span>债券名称:</td>
					<td>
						<input id="vcStockName" class="nui-textbox" name="vcStockName"  style="width: 140px" required="true"  enabled="false"/>
						<input id="vcInterCode" class="nui-hidden"name="vcInterCode"/>
					</td>
					
				</tr>
				<tr>
					<td align="right" red="red"><span>*</span>委托方向:</td>
					<td><input id="vcEntrustDirection" class="nui-radiobuttonlist" name="vcEntrustDirection" onitemclick="changeToRed"
						data="[{id: '3', text: '买入'}, {id: '4', text: '卖出'}]" required="true"/>
					</td>
					
	            	<td align="right" ><span>*</span>交易日期:</td>
					<td>
						<input id="tradeDate" class="nui-datepicker" name="tradeDate" required="true"  style="width: 140px" allowInput="false"  onvaluechanged="whetherTradeDate" 
									showClearButton="false" data-options='{dateType:"00"}' onvalidation="isTradeDate"/>
					</td>
					
				</tr>
				<tr>
					<td align="right" ><span>*</span>清算速度:</td>
					<td><input  class="nui-radiobuttonlist"  id="vcSettleSpeed" name="vcSettleSpeed" required="true"  enabled="false" onitemclick="whetherTradeDate"
						data="[{id: 0, text: 'T+0'}, {id: 1, text: 'T+1'}]" />
					</td>
					<td align="right" ><span>*</span>结算日期:</td>
					<td>
						<input id="firstSettleDate" class="nui-datepicker" name="firstSettleDate" required="true" style="width: 140px"onvalidation="lDelistingVali" readonly="readonly"/>
					</td>
					
				</tr>
				<tr>
					<td align="right" ><span>*</span>券面金额:</td>
					<td><input class="nui-textbox" style="width: 125px;" id="enFaceAmount" name="enFaceAmount" 
					 required="true"  onvalidation="faceAmountCheck" onblur="calculateNetPrice" /><span style="margin-left:3px;">万元</span></td>
					<td align="right"  money="money"><span>*</span>净价金额:</td>
					<td align="left">
						<input class="nui-textbox"  id="enNetPriceAmount" style="width: 140px" name="enNetPriceAmount"  required="true"  enabled="false"/> 
					</td>
				</tr>
				<tr>
					<td align="right"><span>*</span>对方交易员:</td>
					<td>
						<input id="vcCounterpartyTrader" class="nui-textbox" style="width: 125px;"  vtype="maxLength:64" 
						  onblur="ChangeTraderName(this)" onvalidation="traderCheck" name="vcCounterpartyTrader" required="true"/><!-- 对方交易员代码 -->
					</td>
					<td align="right" ><span>*</span>交易对手:</td>
					<td>
						<div name="vcCounterpartyId" class="mini-autocomplete" id="vcCounterpartyId"
	                         textField="vcName" valueField="vcRivalCode"
	                         onvalidation="vcCounterpartyCheck"
	                         searchField="vcPinyin"
	                         url="com.cjhxfund.ats.sm.comm.TraderivalManager.QueryTraderByPinyin.biz.ext"
	                         popupEmptyText="全部"
	                         nullItemText="全部"
	                         loadingText="加载中"
	                         dataField="traders"
	                         required="true" 
	                         multiSelect="false"
	                         style="width: 140px"
	                         popupWidth="300"
	                         onvaluechanged="setIssueOrgan">
	                        <div property="columns">
	                            <div header="对手代码" field="vcRivalCode" width="20"></div>
	                            <div header="对手名称" field="vcName"></div>
	    					</div>
	    				</div>
					</td>
				</tr>
				<tr>
					<td align="right" id="vcAgreemtCodeTexts"><span>*</span>约定号:</td>
					<td><input  class="nui-textbox" id="vcAgreemtCodeValue" style="width: 125px" name="vcAgreemtCode" onvalidation="digitCheck" required="true"/></td>
					<td align="right" >对手主体机构:</td>
					<td><input class="nui-textbox" showClose="true" id="vcCounterpartyOrgan"  style="width: 140px" name="vcCounterpartyOrgan"/></td>
				</tr>
				<tr>
					<td align="right" >询价交易员:</td>
					<td><input id="lInquiryTrader"  class="nui-textbox" name="lInquiryTrader" /></td>
					<td align="right" >实际对手方:</td>
					<td><input class="nui-textbox"  id="lActuallyCounterParty" name="lActuallyCounterParty"  style="width: 140px"/></td>
				</tr>
				<tr style="height:64px">
					<td align="right" style="vertical-align: text-top;">备注:</td>
					<td colspan="3"><input  class="nui-textarea" vtype="maxLength:1024"  id="vcRemark" 
					name="vcRemark" style="width: 420px;height: 64px;"/></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="nui-fit">
		<div align="center" class="submitDiv">
			<a class="nui-button"  iconCls="icon-tip" plain="true"  id="exactrisk" onclick="riskControlTrial(this)">风控试算</a>
			<a class="nui-button"  iconCls="icon-save" plain="true"  id="exactCommit" onclick="saveInquiryZqmm(this,1)">保存</a> 
			<a class="nui-button" plain="true" iconCls="icon-ok" id="exactCommitGoOn" plain="true" onclick="commit(this,1)">提交</a> 
			<a class="nui-button" plain="true" iconCls="icon-cancel" plain="true"  onclick="onCancel()">取消</a>
		</div> 
	</div>
	<script type="text/javascript">
    	nui.parse();
    	$(function(){
    		//初始化改变债券代码选择提示语句
    		$("#vcStockCode>span>input").attr("placeholder","请输入债券代码...");
    		$("#vcCounterpartyId>span>input").attr("placeholder","对手中文或首位拼音...");
    		nui.get("tradeDate").setValue(new Date());
    		nui.get("vcSettleSpeed").setValue("1");
			$("#vcEntrustDirection  label:first").css({
					"color":"red"
			});
			$("#vcEntrustDirection  label:last").css({
					"color":"green"
			});
			//限制交易日
			limitTradeDate("tradeDate");
		});
		var ATS_SUCCESS = "<%= com.cjhxfund.commonUtil.Constants.ATS_SUCCESS %>";
	    var ATS_ERROR = "<%= com.cjhxfund.commonUtil.Constants.ATS_ERROR %>";
	    var ATS_ORDER_OVER_DEAL_TIME = "<%= com.cjhxfund.commonUtil.Constants.ATS_ORDER_OVER_DEAL_TIME %>";
	    var ATS_ORDER_USABLE_AMOUNT_INSUFFICIENT = "<%= com.cjhxfund.commonUtil.Constants.ATS_ORDER_USABLE_AMOUNT_INSUFFICIENT %>";
	    var ATS_ORDER_NO_RCV_FR_O32 = "<%= com.cjhxfund.commonUtil.Constants.ATS_ORDER_NO_RCV_FR_O32 %>";
	    var ATS_RISK_VIOLATE_FORBID_CTRL = "<%= com.cjhxfund.commonUtil.Constants.ATS_RISK_VIOLATE_FORBID_CTRL %>";
    	
		var sumFaceAmount = null;//当前债券代码所有没有成交的数量
		var enBondAsset = null; //当前债券的市值
		var bondPriceType = null;//判断债券是净价还是全价 1-净价，0-全价
		var lLeftDays = null;  //距到期日天数
		var instructionInfo = null;//修改指令/建议的所有传值
		var investProductInfoCommon = "";//投资产品信息全局变量（债券代码,债券名称,交易市场编号,证券内码）
		var hasSellback = true; //是否有回售条款
		var lDelistingDate = null; //摘牌日期
		var isO32Exist = null;
		var lPlanId = null;
		var lAssetId = null;
		var inquiryOperator = "";
		var inquirySaveOrSubmitType = "";
		var operatorType=0;//0-新建指令/建议 1-编辑指令/建议 2-复制增加
		var lResultId = "";
		
		var completeInstruction = new nui.Form("#complete_instruction");
		//根据债券计算清算速度并得出结算日期
		function countIiquidationVelocity(){
			var paramter = {};
			var vcStockCode = nui.get("vcStockCode").getValue();//债券代码
			var vcBizType = nui.get("vcBizType").getValue();//交易平台
			paramter["vcBizType"] = vcBizType;
			paramter["vcStockCode"] = vcStockCode;
			if(vcStockCode){
				if(vcBizType == "2"){//大宗清算速度交易规则
					nui.get("businClass").setValue("E");
					whetherTradeDate(); //根据清算速度和交易日期得出结算日期
				}else if(vcBizType == "3"){//固收清算速度交易规则
					nui.ajax({
		                url:"com.cjhxfund.ats.sm.comm.TBondBaseInfoManager.queryStockLiquidationVelocity.biz.ext",
		                type: 'POST',
		                data: {paramter:paramter},
		                cache: false,
		                contentType: 'text/json',
		                success: function (e) {
		                   	var returnJson = nui.decode(e);
							if(returnJson.exception == null){
								if(returnJson.stockInfo.length>0){
									var vcSpeed = returnJson.stockInfo[0].vcSpeed;
									if(vcSpeed == "-1"){
										vcSpeed = "0";
										nui.get("vcSettleSpeed").setValue(vcSpeed);
									}else{
										nui.get("vcSettleSpeed").setValue(vcSpeed);
									}
								}
								whetherTradeDate(); //根据清算速度和交易日期得出结算日期
							}else{
								window.parent.parentAlert("系统异常","系统提示");
							}
		                }
		            });
					nui.get("businClass").setValue("I");
				}
			}
		}
		
		function SetData(data,inquiryOperatorType) {
			//跨页面传递的数据对象，克隆后才可以安全使用
            data = nui.clone(data);
            if(inquiryOperatorType != undefined){
				inquiryOperator = inquiryOperatorType;
				if(inquiryOperator!="" && inquiryOperator !=null){
					operatorType = "1";
				}
			}
			if(inquiryOperator != "" && inquiryOperator == "updInquiryResult"){
				document.getElementById("exactCommit").style.display = "none";
			}
			changeRed(data.vcEntrustDirection);//根据委托方向改变对应字段颜色
			var vcStockCode = data.vcStockCode;
			var vcEntrustDirection = data["vcEntrustDirection"];
			nui.get("vcProductCode").setText(data["vcProductName"]);//产品名称
			nui.get("lInquiryTrader").setValue(data["lInquiryTrader"]);//对方交易员
			nui.get("lActuallyCounterParty").setValue(data["lActuallyCounterParty"]);//实际对手方
    		nui.get("vcProductCode").setValue(data["vcProductCode"]);//产品代码
    		nui.get("lProductId").setValue(data.lProductId);//产品Id
    		if(data["lPlanId"]!=null){
				lAssetId = data["lAssetId"];
				lPlanId = data["lPlanId"];
				nui.getbyName("lPlanId").setValue(lPlanId);
				nui.getbyName("lProductId").setValue(data["lProductId"]);
				nui.get("vcProductCode").setEnabled(false);
				nui.get("enFaceAmount").setValue(formatNumber(data["enFaceAmount"], 0, 1)); //券面金额
			}
    		selectFunds(data["vcCombiCode"]);
    		var vcAvailablequantityT0 = data["vcAvailablequantityT0"];//T+0可用数量
			if(vcAvailablequantityT0 && vcEntrustDirection == "4" && lPlanId==null){
				//券面金额：可用数量（先取T+0可用数量）*100
			 	var enFaceAmount = formatNumber(vcAvailablequantityT0/100,2,1);
				nui.get("enFaceAmount").setValue(enFaceAmount);
			}
			nui.get("vcStockCode").setValue(vcStockCode);
			nui.get("vcStockCode").setText(vcStockCode);//债券代码
			var vcSpecialText = data.vcSpecialText;
			if(vcSpecialText && (vcSpecialText.indexOf("回售条款")>=0 || vcSpecialText.indexOf("赎回条款")>=0)){
						$("#MaturityLab").html("<span>*</span>到期/行权收益率:");
						$("#enOptionYield").show();
						$("#MaturityLabSplit").show();
						hasSellback = true;
					}else{
						$("#MaturityLab").html("<span>*</span>到期收益率:");
						$("#enOptionYield").hide();
						$("#MaturityLabSplit").hide();
						hasSellback = false;
					}
			//获取摘牌日期
			lDelistingDate = data.lDelistingDate == null ? null : DateUtil.DstrToDate(data.lDelistingDate);
			nui.get("vcEntrustDirection").setValue(vcEntrustDirection);//委托方向
			nui.get("vcStockName").setValue(data["vcStockName"]);//债券名称
			nui.get("vcInterCode").setValue(data["vcInterCode"]);//O32债券内码
			nui.get("vcStockCode").doValueChanged();
			if(data["operatorType"] == "1" || data["operatorType"] == "2"){//复制指令/建议
			 	if(data["operatorType"] == "1"){
			    	//operatorType="3";	// 兼容回购，operatorType=3（修改）
			    	lResultId = data["lResultId"];
			    }else{
			    	operatorType="2";
			    }
        		nui.get("operatorType").setValue(data["operatorType"]);
        		nui.get("vcSettleSpeed").setValue(data["vcSettleSpeed"]);//清算速度
        		nui.get("vcCombiCode").setValue(data["vcCombiCode"]);//组合代码
        		var lTradeDate = data["lTradeDate"].toString();
        		var lFirstSettleDate = data["lFirstSettleDate"].toString();
        		nui.get("tradeDate").setValue(lTradeDate);//交易日期
        		nui.get("firstSettleDate").setValue(lFirstSettleDate);//结算日期
        		nui.get("enFaceAmount").setValue(formatNumber(data["enFaceAmount"],2,1));//券面金额
        		nui.get("enNetPrice").setValue(data["enNetPrice"]);//净价
        		nui.get("enFullPrice").setValue(data["enFullPrice"]);//全价
        		nui.get("enMaturityYield").setValue(data["enMaturityYield"]);//到期收益率
        		nui.get("enOptionYield").setValue(data["enOptionYield"]);//行权收益率
        		nui.get("enNetPriceAmount").setValue(formatNumber(data["enNetPriceAmount"],2,1));//净价金额
        		//nui.get("enFullPriceAmount").setValue(formatNumber(data["enFullPriceAmount"],2,1));//净价金额
        		nui.get("vcAgreemtCodeValue").setValue(data["vcAgreemtCode"]);//约定号
        		nui.get("vcCounterpartyId").setText(data["vcCounterpartyName"]);//交易对手
				nui.get("vcCounterpartyId").setValue(data["vcCounterpartyId"]);//交易对手编号
				if(!data.vcCounterpartyId){
					nui.get("vcCounterpartyId").setValue(data["vcCounterpartyName"]);//交易对手编号
				}
				nui.get("vcCounterpartyTrader").setValue(data["vcCounterpartyTrader"]);//对方交易员
				nui.get("vcCounterpartyOrgan").setValue(data["vcCounterpartyOrgan"]);//对手主体机构
				nui.get("vcRemark").setValue(data["vcRemark"]);//备注

        		instructionInfo = data;
        		//交易日期处理
				var todayStr=DateUtil.toNumStr(new Date());
			    var today=DateUtil.numStrToDate(todayStr,"yyyy-MM-dd");
			    lTradeDate=DateUtil.numStrToDate(lTradeDate);
			    if(lTradeDate<today){
			    	//判断交易日期是不是今天之前的日期，如果是，则把交易日期置为今天,并重新计算相关数据
			    	var lTradeDateCo=nui.get("tradeDate");
			    	lTradeDateCo.setValue(today);
			    	lTradeDateCo.doValueChanged();
			    }
        	}else{
        		countIiquidationVelocity(); //根据债券计算清算速度并得出结算日期
        	}
        	isO32Exist = true;
        	onActionRenderer(null);
        	if(inquiryOperatorType == "updInquiryResult"){
				//禁用不可修改项目
			    nui.get("vcProductCode").disable();
			    nui.get("vcCombiCode").disable();
			    nui.get("vcStockCode").disable();
			    nui.get("vcStockName").disable();
			    nui.get("vcEntrustDirection").disable();
			}
        	//countIiquidationVelocity(); //根据债券计算清算速度并得出结算日期
    		//getBondType();//根据债券代码判断是净价还是全价
			//originalInstructionInfo = completeInstruction.getData(false,false);
		}
		
       	function commit(e,doClose) {
			//验证表单
    		completeInstruction.validate();
			if(completeInstruction.isValid()==false){
				return;
			} 
			var parameter = capsulationInstructParameter();
		    if(!parameter){
		        return false;
		    }
			nui.ajax({
        		data:parameter,
        		url:"com.cjhxfund.ats.sm.comm.InstructionManager.instructionDateConfirm.biz.ext",
        		success:function(resp){
        			var returnJson = nui.decode(resp);
					if(returnJson.exception == null){//客户下达指令/建议时间>产品参数配置时间
						 if(returnJson.rtnCode == "<%=com.cjhxfund.commonUtil.Constants.ATS_ORDER_OVER_DEAL_TIME%>"){ 
							window.parent.parentConfirm("该询价结果下达时间过晚，无法完全保证交易达成，是否继续？", "提示",
					            function (action) {
					                if (action == "ok") {
					                   instructSub(parameter, doClose);
					                }
					            }
					        );
						}else if(returnJson.rtnCode =="<%=com.cjhxfund.commonUtil.Constants.ATS_ERROR%>"){
						    window.parent.parentAlert("系统异常,请稍后再试","提示");
						}else{
							instructSub(parameter, doClose);
						}
					}else{
						window.parent.parentAlert("系统异常","系统提示");
					}
	            }
		    });
		}
		//保存指令
		function saveInquiryZqmm(e,doClose){
			var param = combiSaveParam();
		    if(!param){
		        return false;
		    }
		    var a = nui.loading("正在处理中,请稍等...","提示");
		    var url = "com.cjhxfund.ats.sm.inquiry.inquiryInstruction.insertInquiryResult.biz.ext";
		    if(inquiryOperator == "updSaveInquiryResult"){
		    	url = "com.cjhxfund.ats.sm.inquiry.inquiryInstruction.submitInquiryResult_zqmm.biz.ext";
		    }
		    nui.ajax({
			    url: url,
			    type: 'POST',
			    data: param,
			    cache: false,
			    contentType: 'text/json',
			    success: function (e) {
			    	nui.hideMessageBox(a);
			       	var returnJson = nui.decode(e);
					if(returnJson.exception == null){
						if(returnJson.rtnCode == ATS_SUCCESS){
							nui.alert("询价结果保存成功！","提示",function(){
								window.parent.closewindow("ok");
			                });
			    		}else if(returnJson.rtnCode == ATS_ERROR) {
			    			nui.alert("询价结果保存失败！</br>"+returnJson.rtnMsg,"提示");
			            }
					}else{
						nui.alert("系统异常","系统提示");
					}
			    }
			});
		}
		
		/**风控管理开始**/
		function subData(riskReturn, instructJson){
			checkEditToRisk(riskReturn);
        	var riskFlag = showRiskInfo(riskReturn, instructJson, "1");
        	riskControl(riskFlag, instructJson);
        }
        function riskControl(riskFlag, instructJson){
        	riskFlagParam = riskFlag;
        	lResultIdParam = instructJson.instructParameter.lResultId;
        	lRiskmgrIdParam = instructJson.instructParameter.lRiskmgrId;
        	if(riskFlag=='-1'){
        		return;
        	}else if(riskFlag=='1'){
        		formalInstructionEntry(instructJson, doCloseParam);
        	}else if(riskFlag=='2'){
        		formalInstructionEntry(instructJson, doCloseParam);
        	}
        }
        function formalInstructionEntryFinish(){
        	if(riskFlagParam=='2'){
        		startRiskProcessInstruct(lResultIdParam, lRiskmgrIdParam);
        	}
        	if(inquiryOperator == "updInquiryResult"){	//指令修改
				updateRiskStatus("", "", instructionInfo.lResultId, "4");
			}
        	window.parent.closewindow("ok");
        }
        /**风控管理结束**/
		
		//检查更新字段 判断是否重新走关联风控
		function checkEditToRisk(returnJson){
			var param = capsulationInstructParameter();
			var lResultId = "";
			if(!param.srcInstruct||!param.srcInstruct.cRiskStatus||param.srcInstruct.cRiskStatus=='0' || param.srcInstruct.cRiskStatus=='1'){
				if(param.instructParameter.lResultId){
					lResultId = param.instructParameter.lResultId;
				} else {
					return returnJson;
				}
			} else {
				lResultId = param.srcInstruct.lResultId;
			}
			
			var isFilter = false;//是否过滤交易关联 
			var rtnCode = returnJson.rtnCode;
			//查询原指令数据是否有修改金额及交易对手
			nui.ajax({
			 	url: "com.cjhxfund.ats.sm.inquiry.inquiryInstruction.getInstructInfo.biz.ext",
		        type: 'POST',
		        data: {lResultId: lResultId},
		        cache: false,
		        async: false,
		        contentType: 'text/json',
		        success: function (text) {
		        	if(text.instructionInfo.length==0||text.isCheck==false){//未通过
		        		isFilter = false//不过滤关联交易
		        	} else {//通过，则判断是否修改关键字段，过滤关联交易
			        	var vcCounterpartyName = param.instructParameter.vcCounterpartyName;
			        	var enPrice = param.instructParameter.enPrice;
			        	if(vcCounterpartyName==text.instructionInfo[0].vcCounterpartyName&&enPrice==text.instructionInfo[0].enPrice){
			        		isFilter = true;
			        	}
		        	}
		        }
			});
			
			//没有则检查风控内容是否有触发关联交易审批
			if(isFilter&&returnJson.riskMsg.resultDetail){
				var riskDetail = returnJson.riskMsg.resultDetail;
				var newRiskDetail = new Array();
				for(var i=0,j=0;i<riskDetail.length;i++){
					//去除关联交易
					if(!(riskDetail[i].cRiskOperation==3&&riskDetail[i].vcInsApproveFlow==1)){
						newRiskDetail[j]=riskDetail[i];
						j++;
					}
				}
				//处理rtnCode
				if(rtnCode==204&&newRiskDetail.length==0){
					rtnCode=0;
				}else if(rtnCode==301&&newRiskDetail.length==0){
					rtnCode=201;
				}
				
				returnJson.riskMsg.resultDetail = newRiskDetail;
				returnJson.rtnCode = rtnCode;
			}
		
			return returnJson;
		}
		
		
		//指令/建议下达或修改start
 		function instructionAvailIssue(param,doClose){
 			 var tooltip = nui.loading("正在处理中,请稍等...","提示");
 			 nui.ajax({
 				url: "com.cjhxfund.ats.sm.inquiry.inquiryInstruction.submitRiskTrail.biz.ext",
	            type: 'POST',
	            data: param,
	            cache: false,
	            contentType: 'text/json',
	            success: function (text) {
	            	nui.hideMessageBox(tooltip);
	            	var returnJson = nui.decode(text);
	            	if(returnJson.exception == null){
		        		if(returnJson.rtnCode == ATS_SUCCESS){
		        			nui.alert("询价结果提交成功！","提示",function(){
		        				window.parent.closewindow("ok");
		                    });
		        		}else if(returnJson.rtnCode == ATS_ERROR){
		        			nui.alert(returnJson.rtnMsg,"系统提示");
		        		}else if(returnJson.rtnCode == "302"){//可用不足,继续下单先校验风控
		        			window.parent.parentConfirm(returnJson.rtnMsg+"</br>是否继续下单？","提示", function(action){
		                		if(action == "ok") {
		                			formalInstructionEntry(param);
		                        }
		                	});
		        		}else if(returnJson.rtnCode == ATS_ORDER_USABLE_AMOUNT_INSUFFICIENT){
		        			
	        				window.parent.parentConfirm(returnJson.rtnMsg+"</br>是否继续下单？","提示", function(action){
	                    		if(action == "ok") {
	                    			formalInstructionEntry(param);
	                            }
	                    	});
		        		}else if(returnJson.rtnCode == "301"){
		        			var riskInfo = returnJson.riskMsg;
		        			riskInfo["alertMsg"]=returnJson.rtnMsg;
		        			nui.open({
		                        url: nui.context + "/fix/riskControlDetailList.jsp",
		                        title: "风险提示",
		                        width: 800,
		                        height: 422,
		                        onload: function(){
		                            var iframe = this.getIFrameEl();
		                            if(param.instructParameter["vcEntrustDirection"]=="5"){
		                            	iframe.contentWindow.SetData(riskInfo,2);
		                            }else{
		                            	iframe.contentWindow.SetData(riskInfo,1);
		                            }
		                        },
		                        ondestroy: function (action) {
		                        	if (action == "ok") {
		                                formalInstructionEntry(param);
		                            }
		                        }
		                    });
		        		}else{//触发风控，弹出风险提示框，展示风险信息
		        			var riskInfo = returnJson.riskMsg;
		        			nui.open({
		                        url: nui.context + "/fix/riskControlDetailList.jsp",
		                        title: "风险提示",
		                        width: 800,
		                        height: 380,
		                        onload: function() {
		                            var iframe = this.getIFrameEl();
		                            iframe.contentWindow.SetData(riskInfo,1);
		                        },
		                        ondestroy: function (action) {
		                            if (action == "ok") {
		                                formalInstructionEntry(param);
		                            }
		                        }
		                    });
		        		}
		        	}else{
		        		nui.alert("系统异常","系统提示");
	        		}
	        	}
			});
		}
		//正式修改指令/建议信息
   	 	function formalInstructionEntry(param){
			var a = nui.loading("正在处理中,请稍等...","提示");
			var url = "com.cjhxfund.ats.sm.inquiry.inquiryInstruction.insertInquiryResult.biz.ext";
			if(inquiryOperator == "updInquiryResult"){
				url = "com.cjhxfund.ats.sm.comm.InstructionManager.insertAndUpdateInstruct.biz.ext";
			}else if(inquiryOperator == "updSaveInquiryResult"){
				url = "com.cjhxfund.ats.sm.inquiry.inquiryInstruction.submitInquiryResult_zqmm.biz.ext";
			}
			nui.ajax({
			    url: url,
			    type: 'POST',
			    data: param,
			    cache: false,
			    contentType: 'text/json',
			    success: function (e) {
			    	nui.hideMessageBox(a);
			       	var returnJson = nui.decode(e);
					if(returnJson.exception == null){
						if(returnJson.rtnCode == ATS_SUCCESS){
							nui.alert("询价结果提交成功！","提示",function(){
								formalInstructionEntryFinish();
			                });
			    		}else if(returnJson.rtnCode == ATS_ERROR) {
			    			nui.alert("询价结果提交失败！</br>"+returnJson.rtnMsg,"提示");
			            }
					}else{
						nui.alert("系统异常","系统提示");
					}
			    }
			});
		}
		//封装指令/建议参数
	 	function capsulationInstructParameter(){
	   	 	var tradeDate = nui.formatDate(nui.get("tradeDate").value, "yyyyMMdd");
			var firstSettleDate = nui.formatDate(nui.get("firstSettleDate").value, "yyyyMMdd");
			var parameter = null;
			var bondInfo = null;
			bondInfo = window.parent.getBondInfo();//仅用作给后台传参用
			parameter = completeInstruction.getData(false, false);
			//仅插入数据库用，start
			var funds = nui.get("vcProductCode").getData();
			for(var i = 0,len = funds.length; i < len;i++){
				if(funds[i].ID==nui.get("vcProductCode").getValue()){
		    		parameter["lProductId"] = funds[i].L_PRODUCT_ID;
		    	}
			}
			//仅插入数据库用，start
			parameter["vcProductName"] = nui.get("vcProductCode").getText();//产品名称
			var combis = nui.get("vcCombiCode").getData();
			for(var i = 0,len = combis.length; i < len;i++){
				var asset = combis[i];
				if(asset.ID==nui.get("vcCombiCode").getValue()){
		    		parameter["lAssetId"] = asset.L_ASSET_ID;
		    		parameter["vcAssetCode"] = asset.VC_ASSET_NO;
		    		parameter["vcAssetName"] = asset.VC_ASSET_NAME;
		    		parameter["lCombiId"] = asset.L_COMBI_ID;
		    	}
			}

			if(nui.get("operatorType").getValue() == "1" && (instructionInfo.cIsValid=="0" || instructionInfo.cIsValid=="1")){//修改指令/建议
				if(instructionInfo.cIsValid=="0"){
					parameter["operatorType"] = 3; //修改
					parameter["lResultId"] = lResultId;
				}
				var enface_amount=instructionInfo.enFaceAmount==null?0:instructionInfo.enFaceAmount;
				var tradeQty = enface_amount==0?enface_amount:parseInt(enface_amount.toString().replace(/,/g,''))*100;
				if(instructionInfo.vcEntrustDirection=="01" || instructionInfo.vcEntrustDirection=="3"){//买入
					if(parameter["vcAssetCode"] == instructionInfo.vcAssetCode){
						var now =  nui.formatDate(new Date(),"yyyyMMdd");//当日
						var now1 = nui.formatDate(new Date(new Date().getTime()+24*60*60*1000),"yyyyMMdd"); //修改指令/建议的可以金额校验需要
			    		//原指令/建议的交易日为今天的指令/建议或者交易日为明天的t+0指令/建议在需改时需要将资金加回
						if(instructionInfo.lTradeDate == now || (instructionInfo.lTradeDate == now1 && instructionInfo.vcSettleSpeed == "0")){
    						var enfullprice=instructionInfo.enFullPrice==null?0:instructionInfo.enFullPrice;
    						var fullPrice = enfullprice==0?enfullprice:parseFloat(enfullprice.toString().replace(/,/g,''));
							tradeQty = tradeQty*fullPrice;
							parameter["tradeQty"] = tradeQty;
    					}
					}
				}else{//卖出
					if(nui.get("vcStockCode").getValue() == instructionInfo.vcStockCode && nui.get("vcCombiCode").getValue()==instructionInfo.vcCombiCode){
						parameter["tradeQty"] = tradeQty;
					}
				}
			}
			parameter["lTradeDate"] = tradeDate;		//交易日期
			parameter["lFirstSettleDate"] = firstSettleDate;//结算日期
			parameter["lLeftDays"] = lLeftDays;		//距到期日天数
			parameter["vcCombiName"] = nui.get("vcCombiCode").getText();		//组合名称
			parameter["vcOrgRating"] = bondInfo["vcIssueAppraise"];					//主体评级
			parameter["vcBondRating"] =bondInfo["vcBondAppraise"];					//债项评级
			parameter["enDuration"] =bondInfo["enCzValueMduration"];			 //中证估价修正久期(推荐)
			parameter["vcCounterpartyName"] = nui.get("vcCounterpartyId").getText(); //交易对手编号
			//仅插入数据库用，end
			if(parameter["vcBizType"]==null || parameter["vcBizType"]==""){
				if(parameter["businClass"]=="E"){
					parameter["vcBizType"]="2";
				}else{
					parameter["vcBizType"]="3";
				}
			}
			var enNetPrice = parameter.enNetPrice.replace(/,/g,'');		//净价
			var enFaceAmount = parameter.enFaceAmount.replace(/,/g,'');
			var enFullPrice = parameter.enFullPrice.replace(/,/g,'');//全价
			//净价金额的计算,净价价格*券面金额（万元）*100,全价金额计算方式一致
			var enNetPriceAmount = enNetPrice*enFaceAmount*100; 
			var enFullPriceAmount = enFullPrice*enFaceAmount*100; 
			parameter["enNetPriceAmount"] = enNetPriceAmount	;		//净价金额
			parameter["enFullPriceAmount"] = enFullPriceAmount;		//全价金额
			
			if(bondPriceType == "1"){
				parameter["vcPrice"] = enNetPrice;									//作为O32传入价格
				parameter["enPrice"] = enNetPrice;									//作为O32传入价格
			}else{
				parameter["vcPrice"] = enFullPrice;				//作为O32传入价格
				parameter["enPrice"] = enFullPrice;				//作为O32传入价格
			}
			//判断交易对手是否是自己手动输入
			if(parameter["vcCounterpartyId"] == parameter["vcCounterpartyName"]){
				parameter["vcCounterpartyId"] = "";
			}
			parameter["enNetPrice"] = enNetPrice;				//净价
			parameter["enFullPrice"] = enFullPrice;				//全价
			//行权收益率校验
			if(parameter["enMaturityYield"]){
				parameter["enMaturityYield"] = parameter["enMaturityYield"].replace(/,/g, '');
			}
			if(parameter["enOptionYield"]){
				parameter["enOptionYield"] = parameter["enOptionYield"].replace(/,/g, '');
			}
			parameter["enFaceAmount"] = enFaceAmount;			//券面金额
			parameter["vcInstructType"] = "2"; 			 //用来传给流程判断1、完整指令/建议  2、询价指令/建议
			parameter["vcProcessStatus"] = "-1";			//流程状态
			parameter["lFixValidStatus"] = "0";//用于判断指令/建议是否发送O32以及发送结果：0-未发送,1-修改后未发送,2-发送中,3-发送成功,4-发送失败
		    parameter["cIsValid"] = "1"; //有效状态
			if(inquiryOperator == "updInquiryResult"){
				return {instructParameter:parameter, inquiryResultType:1, inquiryOperator:inquiryOperator, srcInstruct:instructionInfo};
			}else{
				return {instructParameter:parameter, inquiryResultType:1, inquiryOperator:inquiryOperator};
			}
	   	 }
   	 	// 保存询价结果
   	 	function combiSaveParam(){
			inquirySaveOrSubmitType = "save";
   	 		// 去掉非空判断
   	 		debugger;
   	 		nui.get("vcStockCode").required = false;
   	 		nui.get("vcStockName").required = false;
   	 		nui.get("vcEntrustDirection").required = false;
   	 		nui.get("tradeDate").required = false;
   	 		nui.get("vcSettleSpeed").required = false;
   	 		nui.get("firstSettleDate").required = false;
   	 		nui.get("enFaceAmount").required = false;
   	 		nui.get("vcCounterpartyId").required = false;
   	 		
   	 		nui.get("enNetPrice").required = false;
   	 		nui.get("enFullPrice").required = false;
   	 		nui.get("enOptionYield").required = false;
   	 		nui.get("enMaturityYield").required = false;
   	 		nui.get("vcCounterpartyTrader").required = false;
   	 		nui.get("enNetPriceAmount").required = false;
   	 		nui.get("vcAgreemtCodeValue").required = false;
			//验证表单
			var form = new nui.Form("#complete_instruction");
    		form.validate();
			if(form.isValid()==false){
				return;
			} 
            var tradeDate = nui.formatDate(nui.get("tradeDate").value, "yyyyMMdd");
			var firstSettleDate = nui.formatDate(nui.get("firstSettleDate").value, "yyyyMMdd");
			var parameter = null;
			var bondInfo = null;
			bondInfo = window.parent.getBondInfo();//仅用作给后台传参用
			parameter = completeInstruction.getData(false, false);
			//仅插入数据库用，start
			var funds = nui.get("vcProductCode").getData();
			for(var i = 0,len = funds.length; i < len;i++){
				if(funds[i].ID==nui.get("vcProductCode").getValue()){
		    		parameter["lProductId"] = funds[i].L_PRODUCT_ID;
		    	}
			}
			//仅插入数据库用，start
			parameter["vcProductName"] = nui.get("vcProductCode").getText();//产品名称
			var combis = nui.get("vcCombiCode").getData();
			for(var i = 0,len = combis.length; i < len;i++){
				var asset = combis[i];
				if(asset.ID==nui.get("vcCombiCode").getValue()){
		    		parameter["lAssetId"] = asset.L_ASSET_ID;
		    		parameter["vcAssetCode"] = asset.VC_ASSET_NO;
		    		parameter["vcAssetName"] = asset.VC_ASSET_NAME;
		    		parameter["lCombiId"] = asset.L_COMBI_ID;
		    	}
			}
			if(nui.get("operatorType").getValue() == "1" && instructionInfo.cIsValid=="0"){//修改指令/建议
				parameter["lResultId"] = lResultId;
				var enface_amount=instructionInfo.enFaceAmount==null?0:instructionInfo.enFaceAmount;
				var tradeQty =enface_amount==0?enface_amount :parseInt(enface_amount.toString().replace(/,/g,''))*100;
				if(instructionInfo.vcEntrustDirection=="01" || instructionInfo.vcEntrustDirection=="3"){//买入
					if(parameter["vcAssetCode"] == instructionInfo.vcAssetCode){
						var now =  nui.formatDate(new Date(),"yyyyMMdd");//当日
						var now1 = nui.formatDate(new Date(new Date().getTime()+24*60*60*1000),"yyyyMMdd"); //修改指令/建议的可以金额校验需要
			    		//原指令/建议的交易日为今天的指令/建议或者交易日为明天的t+0指令/建议在需改时需要将资金加回
						if(instructionInfo.lTradeDate == now || (instructionInfo.lTradeDate == now1 && instructionInfo.vcSettleSpeed == "0")){
    						var enfullprice=instructionInfo.enFullPrice==null?0:instructionInfo.enFullPrice;
    						var fullPrice =enfullprice==0?enfullprice: parseFloat(enfullprice.toString().replace(/,/g,''));
							tradeQty = tradeQty*fullPrice;
							parameter["tradeQty"] = tradeQty;
    					}
					}
				}else{//卖出
					if(nui.get("vcStockCode").getValue() == instructionInfo.vcStockCode && nui.get("vcCombiCode").getValue()==instructionInfo.vcCombiCode){
						parameter["tradeQty"] = tradeQty;
					}
				}
			}
			parameter["lTradeDate"] = tradeDate;		//交易日期
			parameter["lFirstSettleDate"] = firstSettleDate;//结算日期
			parameter["lLeftDays"] = lLeftDays;		//距到期日天数
			parameter["vcCombiName"] = nui.get("vcCombiCode").getText();		//组合名称
			parameter["vcOrgRating"] = bondInfo["vcIssueAppraise"];					//主体评级
			parameter["vcBondRating"] =bondInfo["vcBondAppraise"];					//债项评级
			parameter["enDuration"] =bondInfo["enCzValueMduration"];			 //中证估价修正久期(推荐)
			parameter["vcCounterpartyName"] = nui.get("vcCounterpartyId").getText(); //交易对手编号
			//仅插入数据库用，end
			if(parameter["vcBizType"]==null || parameter["vcBizType"]==""){
				if(parameter["businClass"]=="E"){
					parameter["vcBizType"]="2";
				}else{
					parameter["vcBizType"]="3";
				}
			}
			var enNetPrice = parameter.enNetPrice.replace(/,/g,'');		//净价
			var enFaceAmount = parameter.enFaceAmount.replace(/,/g,'');
			var enFullPrice = parameter.enFullPrice.replace(/,/g,'');//全价
			//净价金额的计算,净价价格*券面金额（万元）*100,全价金额计算方式一致
			var enNetPriceAmount = enNetPrice*enFaceAmount*100; 
			var enFullPriceAmount = enFullPrice*enFaceAmount*100; 
			parameter["enNetPriceAmount"] = enNetPriceAmount	;		//净价金额
			parameter["enFullPriceAmount"] = enFullPriceAmount;		//全价金额
			
			if(bondPriceType == "1"){
				parameter["vcPrice"] = enNetPrice;									//作为O32传入价格
				parameter["enPrice"] = enNetPrice;									//作为O32传入价格
			}else{
				parameter["vcPrice"] = enFullPrice;				//作为O32传入价格
				parameter["enPrice"] = enFullPrice;				//作为O32传入价格
			}
			//判断交易对手是否是自己手动输入
			if(parameter["vcCounterpartyId"] == parameter["vcCounterpartyName"]){
				parameter["vcCounterpartyId"] = "";
			}
			parameter["enNetPrice"] = enNetPrice;				//净价
			parameter["enFullPrice"] = enFullPrice;				//全价
			//行权收益率校验
			if(parameter["enMaturityYield"]){
				parameter["enMaturityYield"] = parameter["enMaturityYield"].replace(/,/g, '');
			}
			if(parameter["enOptionYield"]){
				parameter["enOptionYield"] = parameter["enOptionYield"].replace(/,/g, '');
			}
			parameter["enFaceAmount"] = enFaceAmount;			//券面金额
			parameter["vcInstructType"] = "2"; 			 //用来传给流程判断1、完整指令/建议  2、询价指令/建议
			parameter["vcProcessStatus"] = "-2";			//流程状态
			parameter["lFixValidStatus"] = "0";//用于判断指令/建议是否发送O32以及发送结果：0-未发送,1-修改后未发送,2-发送中,3-发送成功,4-发送失败
			parameter["cIsValid"] = "0"; //有效状态
			return {instructParameter:parameter, inquiryResultType:1, inquiryOperator:inquiryOperator};
		}
		//位数校验
		function digitCheck(e){
			if(inquirySaveOrSubmitType != "save"){
			    var reg = /^\d+(\.\d+)?$/;//正则
			    if (!reg.test(e.value)) {
			    	e.errorText = "必须为数字！";
				    e.isValid = false;
			        return false;
			    }
				var vcBizType = nui.get("vcBizType").getValue();
				var name = e.sender.name;
				var value = e.sender.value;
				if(vcBizType == "2"){//大宗
	            	if(name == "vcRivalSeat"){//对手席位
	            		if(value.length != 5){
							e.errorText = "必须为5位";
							e.isValid = false;
							nui.getbyName(name).setValue("");
						}
	            	}else{//约定号
	            		if(value.length != 6){
							e.errorText = "必须为6位";
							e.isValid = false;
							nui.getbyName(name).setValue("");
						}
	            	}
	            }else{//固收
	            	if(name == "vcAgreemtCode"){//约定号
	            		if(value.length != 3){
							e.errorText = "必须为3位";
							e.isValid = false;
							nui.getbyName(name).setValue("");
						}
					}
	            }
			}
		}
		function traderCheck(e){
			if(inquirySaveOrSubmitType != "save"){
				var reg = /[Z]\d{5}(?!\d)/;//正则
			    if (!reg.test(e.value)) {
			    	e.errorText = "必须以Z开头，并以五位数字结尾。";
				    e.isValid = false;
			        return false;
			    }
			}
		}
		//风控试算
        function riskControlTrial(e){
        	//验证表单
    		completeInstruction.validate();
			if(completeInstruction.isValid()==false){
				return;
			} 
        	var parameter = capsulationInstructParameter();
        	parameter.instructParameter["callRiskType"] = "1";//调风控类型：1-风控试算，2-投资/建议下达
        	//var json = null;
        	//json = {instructParameter:parameter};
        	//风控试算start
        	var a = nui.loading("正在处理中,请稍等...","提示");
	        nui.ajax({
        	 	url: "com.cjhxfund.ats.sm.comm.InstructionManager.checkInstructAvail.biz.ext",
	            type: 'POST',
	            data: parameter,
	            cache: false,
	            contentType: 'text/json',
	            success: function (text) {
	            	nui.hideMessageBox(a);
	            	var returnJson = nui.decode(text);
					if(returnJson.exception == null){
		                var riskInfo = returnJson.riskMsg;
		                //可用不足或风控校验失败
		                if(returnJson.rtnCode == "<%=com.cjhxfund.commonUtil.Constants.ATS_ORDER_USABLE_AMOUNT_INSUFFICIENT%>"){
		                	window.parent.parentAlert(returnJson.rtnMsg,"投资指令/建议风险提示");//可用不足
		                }else if(returnJson.rtnCode == "203"){
		                	window.parent.parentAlert(returnJson.rtnMsg,"系统提示");//风控校验失败
		                }else if (returnJson.rtnCode == "<%=com.cjhxfund.commonUtil.Constants.ATS_SUCCESS%>") {
		                    if(returnJson.rtnMsg!=null){
		                    	window.parent.parentAlert(returnJson.rtnMsg,"系统提示");
		                    }else{
		                    	window.parent.parentAlert("风控试算通过!","系统提示");
		                    }
		                }else if(returnJson.rtnCode == "301"){
		                	//风险提示框start
		                	riskInfo["alertMsg"]=returnJson.rtnMsg;
		                    nui.open({
		                        url: "<%=request.getContextPath()%>/fix/riskControlDetailList.jsp",
		                        title: "投资指令/建议风险提示",
		                        width: 800,
		                        height: 422,
		                        onload: function () {
		                            var iframe = this.getIFrameEl();
		                            iframe.contentWindow.SetData(riskInfo,3);
		                        }
		                    });
		                    //window.parent.parentAlert(returnJson.rtnMsg,"系统提示");
		                    //风险提示框end
		                }else{
		                    //风险提示框start
		                    nui.open({
		                        url: "<%=request.getContextPath()%>/fix/riskControlDetailList.jsp",
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
						window.parent.parentAlert("系统异常","系统提示");
					}
	            }
        	 });
	        //风控试算end
        }
      	
   	 	//页面X的删除功能
		function onCloseClick(e) {
		    var obj = e.sender;
		    obj.setText(null);
		    obj.setValue(null);
		    obj.doValueChanged();
		}
		//校验交易日期是否为交易日
		function isTradeDate(e){
			if(inquirySaveOrSubmitType != "save"){
				if(!remindTradeDate(e,"交易日期不是交易日，还需要继续吗？")){
			    	e.errorText = "交易日期不是交易日！";
			        e.isValid = false;
			    }
			}
		}
		
		//选择交易对手的时候，将对手主体机构带出
		function setIssueOrgan(e){
			if(inquirySaveOrSubmitType != "save"){
				var vcIssuerName = e.selected ? e.selected.vcIssuerName : "";
				nui.get("vcCounterpartyOrgan").setValue(vcIssuerName);
			}
		}
		 //校验券面金额
		function faceAmountCheck(e){
			if(inquirySaveOrSubmitType != "save"){
				var reg= /^([1-9][0-9]{0,11}(\.[0-9]{2})?)$/;;
	        	var value = e.sender.value;
	        	if(!reg.test(value.replace(/,/g,''))){
	        		e.sender.setValue("");
	        		e.errorText = "请输入1~12位正整数";
	        	 	e.isValid = false;
	        	 	return true;
	        	}
			}	
		}
		
		function autoCalcChecked(e){
			if(e.value === "true"){
				nui.get("enFullPrice").disable();
				nui.get("enMaturityYield").disable();
				nui.get("enOptionYield").disable();
				
			}else{
				nui.get("enFullPrice").enable();
				nui.get("enMaturityYield").enable();
				nui.get("enOptionYield").enable();
			}
			var calc = nui.get("autoCalc").getValue();
			if(calc=="true"){
				enNetPriceMet();
			}
		}
		
		//行权收益率
        function enOptionInterestRateFun(e){
    		if(numberCheck(e)){//判断参数是否为数字
        		return;
        	}
			setPriceFunCommon("enMaturityYield");
			setPriceFunCommon("enOptionYield");
        	//净价、全价、收益率，可以必填其一，选填其他，输入一个另外两个数据可以系统自动算出来
        	var enMaturityYield = nui.get("enMaturityYield").getValue();//到期收益率
			var enOptionYield = nui.get("enOptionYield").getValue();//行权收益率
			var enNetPrice = nui.get("enNetPrice").getValue();//净价
			var enFullPrice = nui.get("enFullPrice").getValue();//全价
			if(enOptionYield){
				if(linkageResultInfo != null && linkageResultInfo[3] == enOptionYield && enNetPrice && enFullPrice && enMaturityYield){
            		return;
            	}
			}
        	setBondPriceCommon(null, null, enOptionYield, "02");
        }

    </script>
    <script type="text/javascript" src="<%= request.getContextPath() %>/JQMHistory/common/common.js"></script>
    <script type="text/javascript" src="<%= request.getContextPath() %>/inquiry/inquiryResultManage/inquiryResultEntering/transaction/inquiryInput_zqmm/js/shBlockTrade.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/inquiry/inquiryResultManage/inquiryResultEntering/transaction/transactionInquiryComJs.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/scripts/com.cjhxfund.js.base/utils/DateUtil.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/riskMgr/js/riskMgrComm.js"></script>
</body>
</html>