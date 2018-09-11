<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="/common/js/commscripts.jsp" %>

<!-- 
  - Author(s): 黄燕
  - Date: 2016-11-07 13:34:54
  - Description:
-->
<head>
<title>待导出到O32系统新债数据表查询</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    
</head>
<body style="width:100%;height:100%;overflow: hidden; margin: 0px;">
					<div class="search-condition">
					  <div class="list">
			            <div id="form1" class="nui-form"  align="center" style="height:10%" >
			                <!-- 排序字段 -->
			                <form id="queryForm" action="">
			                
			                <input type="hidden" class="nui-hidden" id="excelData" name="excelData" />
			                <input type="hidden" class="nui-hidden" id="count" name="count" />
			                <input type="hidden" class="nui-hidden" id="cStatus" name="map/cStatus" value="2"/>
			                <table id="table1" border="0" cellpadding="1" cellspacing="1" style="width:100%;table-layout:fixed;">
			                    <tr>
			                        <td style="width:60px" align="right">
			                            	债券代码:
			                        </td>
			                        <td style="width:25%" align="left">
			                            <input class="nui-textbox" id="processDate" name="map/vcStockCode"  width="100%"/>
			                        </td>
			                        <td style="width:80px" align="right">
			                        	债券简称:
			                        </td>
			                        <td style="width:25%" align="left">
			                         	<input class="nui-textbox" id="processDate" name="map/vcStockName" width="100%"/>
			                        </td>
			                        <td style="width:80px" align="right">
			                        	登记托管机构:
			                        </td>
			                        <td style="width:25%" align="left">
			                            <input class="nui-dictcombobox" 
					                         dictTypeId="CF_JY_DJTGCS" valueField="dictID" textField="dictName"
					                        name="map/vcPaymentPlace" showClose="true" oncloseclick="onCloseClickValueEmpty" 
					                         id="vcPaymentPlace" width="100%"/>
			                        </td>
			                        <td style="width:60px" align="right">
			                                                                                                   债券类别:
			                        </td>
			                        <td style="width:25%" align="left">
			                              <!-- <input class="nui-dictcombobox" id="vcStockType" name="map/vcStockType" showClose="true" oncloseclick="onCloseClickValueEmpty"  
			                              showNullItem="false"  valueField="ID" textField="TEXT"  width="100%"
			                              url="com.cjhxfund.ats.fm.instr.StockIssueInfoBiz.loadStockType.biz.ext?type=1"/> -->
			                              <input style="width: 100%;" id="vcStockType" name="map/vcStockType" class="mini-treeselect"  multiSelect="true" 
									        textField="text" valueField="id" parentField="pid" checkRecursive="false"  showFolderCheckBox="false"
									        url="com.cjhxfund.ats.fm.instr.StockIssueInfoBiz.loadStockType.biz.ext" emptyText="全部" nullItemText="全部"
									        showFolderCheckBox="true"   expandOnLoad="true" showTreeIcon="false" showClose="true" 
									        oncloseclick="onCloseClickValueEmpty" />
			                        </td>
			                       
			                   </tr>
			                   <tr>
			                   		 <td align="right">
			                            	发行主体:
			                        </td>
			                        <td align="left">
			                           <input class="nui-textbox" name="map/vcIssuerNameFull" width="100%"/>
			                        </td>
			                        <td align="right">
			                            	导出时间:
			                        </td>
			                        <td  align="left" style="width:25%">
			                            <input class="nui-datepicker" id="dExportTime" format="yyyy-MM-dd" name="map/dExportTime"  style="width:100%"/>
			                        </td>
			                        <td align="right">
			                            	导出状态:
			                        </td>
			                        <td  align="left" style="width:25%">
			                            <input class="nui-dictcombobox" 
					                         dictTypeId="exportStatus" valueField="dictID" textField="dictName" multiSelect="true" value="1,2,4"
					                        name="map/Status" showClose="true" oncloseclick="onCloseClickValueEmpty" 
					                         id="exportStatus" width="100%"/>
			                        </td>
			                        <td align="right">
				                       
								            <a class='nui-button' plain='false' iconCls="icon-search"  onclick="search()">
								                	查询
								            </a>
								     </td> 
								     <td align="left">
								            <a class='nui-button' plain='false' iconCls="icon-reload"  onclick="reset()">
								                	重置
								            </a>
			                        </td>
			                    </tr>
			                </table>
			               </form>
			            </div>
			          </div>  
			        </div>
			        <div class="nui-toolbar" style="border-bottom:0;padding:0px">
			                <table style="width:100%;height:20px;">
			                    <tr>
			                        <td style="width:100%;">
			                        	<privilege:operation sourceId="ATS_XZCX_O32DC" sid="o32exportExcel" clazz="nui-button" onClick="o32exportExcel()" lableName="手工导出到O32"  iconCls="icon-download" ></privilege:operation>
			                        	<privilege:operation sourceId="ATS_XZCX_O32DDC" sid="O32waitExport" clazz="nui-button" onClick="O32waitExport()" lableName="置为待导出"  iconCls="icon-edit" ></privilege:operation>
			                        	<privilege:operation sourceId="ATS_XZCX_O32ZDDC" sid="o32exportByWait" clazz="nui-button" onClick="o32exportByWait()" lableName="自动导出到O32"  iconCls="icon-download" ></privilege:operation>
			                        	<privilege:operation sourceId="ATS_XZCX_O32YDC" sid="O32finishExport" clazz="nui-button" onClick="O32finishExport()" lableName="置为已导出"  iconCls="icon-edit" ></privilege:operation>
			                        </td>
			                    </tr>
			                </table>
			         </div>
			         <div id="layout1" class="mini-layout" style="width:100%; height:87.5%;"  borderStyle="border:solid 1px #aaa;">       
	                 <div title="center" region="center"  >
			         <div class="nui-fit" >  
			         	<div  id="datagrid1"
			                        class="nui-datagrid"
			                        style="width:100%;height:100%;"
			                        url="com.cjhxfund.ats.fm.baseinfo.intfStockInfoQueryManager.queryIntfStockInfo.biz.ext?type=2"
			                        pageSize="20"
			                        onShowRowDetail="onShowRowDetailList"
			                        showPageInfo="true"
			                        multiSelect="true"
			                        sortField="lStockIssueId" sortOrder="desc">
			                        
			                    <div property="columns">
			                        <div type="indexcolumn"></div>
			                        <div type="checkcolumn"></div>
			                        <div field="lStockIssueId" headerAlign="center" allowSort="true" visible=false>业务序号</div>
			                        <div field="lBizId" headerAlign="center" allowSort="true" visible=false>流程序号</div>
			                        <div field="lStockInvestNo" headerAlign="center" allowSort="true" visible=false>债券投资编号</div>
			                        
			                        <div field="tmpstatus" headerAlign="center" allowSort="true" renderer="exportStatus" width="60px">导出状态</div>
			                        
			                        <div field="dExportTime" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="120px">导出时间</div>
			                        
			                        <div field="vcPaymentPlace" headerAlign="center" allowSort="true" renderer="vcPaymentPlaceRenderer">登记托管机构</div>
			                          
			                        <div field="vcStockCode" headerAlign="center" allowSort="true" >债券代码</div>
			                        
			                        <div field="vcStockName" headerAlign="center" allowSort="true" >债券简称</div>
			                        
			                        <div field="vcStockNameFull" headerAlign="center" allowSort="true" >债券全称</div>
			                        
			                        <div field="cMarketNo" headerAlign="center"  visible=false>交易市场编码</div>
				
			    					<div field="vcMarketName" headerAlign="center" allowSort="true" visible=false>交易市场</div>
			                        
			                        <div field="vcStockType" headerAlign="center" allowSort="true" visible=false>债券类别编码</div>
			                        <div field="typeName" headerAlign="center" allowSort="true" >债券类别</div>
			                        
			                        
			                         <div field="cStatus" headerAlign="center" allowSort="true" renderer="cStatusRenderer" visible=false>流程状态</div>
			                         
			                         <div field="lValidStatus" headerAlign="center" allowSort="true" renderer="lValidStatusRenderer" visible=false>指令/建议单状态</div>
			                         
			                        
			                        <div field="enExistLimite" headerAlign="center" allowSort="true"  align="right" width="80px">发行期限(年)</div>
			                        
			                        <div field="enIssueBalance" headerAlign="center" allowSort="true"  align="right" width="80px" >发行规模(亿)</div>
			                        
			                        <div field="cBondAppraise" headerAlign="center"   renderer="onBondAppraiseRenderer" width="60px" >债券评级</div>
			                        
			                        <div field="vcBondAppraiseOrgan" headerAlign="center" width="150px" allowSort="true"  renderer="onBondAppraiseOrganRenderer">债券评级机构</div>
			                        
			                        <div field="vcIssueProperty" headerAlign="center"   allowSort="true"   renderer="issuePropertyRenderer">
			                            	主体类型
			                        </div>
			                        <div field="vcIssuerNameFull" headerAlign="center" width="150px" allowSort="true" >
			                            	发行主体
			                        </div>
			                        <div field="cIssueAppraise" headerAlign="center" width="80px"   allowSort="true"   renderer="creditRatingRenderer">
			                            	主体评级
			                        </div>
			                        <div field="vcIssueAppraiseOrgan" headerAlign="center" allowSort="true"  renderer="outRatingOrganRenderer">
			                            	主体评级机构
			                        </div>
			                        
			                        <div field="vcIndustry" headerAlign="center" allowSort="true" visible="false">所属行业</div>
			                        <div field="vcIndustryName" headerAlign="center" allowSort="true">所属行业</div>
				
				                    <div field="vcProvince" headerAlign="center" allowSort="true">所属省份</div>
				                    
			                        <div field="vcGuarantorName" headerAlign="center" allowSort="true" >
			                            	担保人名称
			                        </div>
				                    <div field="cAssureType" headerAlign="center" allowSort="true" renderer="cAssureTypeRenderer">
			                            	担保方式
			                        </div>
			                        
			                        <div field="vcGuarantorSummary" headerAlign="center" allowSort="true">担保人简介</div>
			                        
			                        <div field="lIssuePostDate" headerAlign="center" align="right" allowSort="true" >
			                            	公告日期
			                        </div>
			                        <div field="lIssueBeginDate" headerAlign="center" align="right" allowSort="true" >
			                            	发行日期
			                        </div>
			                        <div field="dBidLimitTime" headerAlign="center" align="right" align="center" allowSort="true" renderer="formatDate" >
			                           	            投标截止时间
			                        </div>			
			                        <div field="lPayDate" headerAlign="center" align="right" allowSort="true" >
			                            	缴款日期
			                        </div>
			                        <div field="lPublishDate" headerAlign="center" align="right" allowSort="true" >
			                            	上市日期
			                        </div>
			                        <div field="lBegincalDate" headerAlign="center" align="right" allowSort="true" >
			                            	起息日期
			                        </div>
			                        
			                        <div field="lEndincalDate" headerAlign="center" align="right" allowSort="true"  >
			                            	到期日期
			                        </div>
			                        
			                        <div field="cInterestType" renderer="rendererRateType" headerAlign="center"allowSort="true" >利率类型</div>
				
									<div field="cPayInterestType" renderer="rendererPayInterstType" headerAlign="center"allowSort="true" >息票品种</div>
									
									<div field="enPayInteval" headerAlign="center" renderer="rendererEnPayInteval" allowSort="true" >付息频率</div>
									
									<div field="enFaceRate" headerAlign="center" align="right"  allowSort="true" >票面利率(%)</div>
									
									<div field="cBidType" headerAlign="center" renderer="renderercBidType" allowSort="true" >招标方式</div>
									
									<div field="cPayType" headerAlign="center" allowSort="true" renderer="rendererPaymentType" >缴款方式</div>
									
									<div field="vcSpecialText" headerAlign="center" allowSort="true" renderer="rendererSpecialText">特殊条款</div>
				
			                        <div field="vcMainUnderwriter" headerAlign="center"  allowSort="true"  >
			                            	主承销商
			                        </div>
			                        <div field="vcDeputyUnderwriter" headerAlign="center"  allowSort="true"  >
			                            	副主承销商
			                        </div>
			                        
			                        <div field="cUnderwriteType" headerAlign="center"  allowSort="true"  renderer="underwriteTypeRenderer">
			                            	承销方式
			                        </div>
			                        
			                        <div field="vcGroupUnderwriter" headerAlign="center" allowSort="true" >承销团</div>
			                        		                        
			                        <div field="lBondIssueFile" headerAlign="center"   allowSort="true" visible=false >
			                           	            债券发行公告
			                        </div>
			                         
			                         <div field=lRaiseInstFile headerAlign="center"  allowSort="true" visible=false >
			                           	            募集说明书
			                        </div>
			                        
			                         <div field="lRateReportFile" headerAlign="center"   allowSort="true" visible=false >
			                           	            信用评级报告
			                        </div>
  
			                        <div field="lAttchCount" headerAlign="center" align="right" allowSort="true" visible=false>
			                           	            附件个数
			                        </div>
			                        
			                        <div field="vcUserId" headerAlign="center" allowSort="true" visible=false>
			                           	            用户名
			                        </div>
			                        			                        			                     			                        
			                        <div field="enCategoryMoney" headerAlign="center" width="130px" align="right" allowSort="true" visible=false>
			                           	            已投资该发行主体发行证券存量(亿)
			                        </div>
			                        <div field="cIsHaveSaleback" headerAlign="center" allowSort="true" renderer="isRenderer">
			                           	             是否具有回售权
			                        </div> 

			                        <div field="cIsHaveBuyback" headerAlign="center" allowSort="true" renderer="isRenderer">
			                           	            是否具有赎回权
			                        </div>
			                         
			                        <div field="lNextExerciseDate" headerAlign="center" align="right" allowSort="true"  >
			                           	            下一行权日
			                        </div>
			                        	
			                        <div field="lOperatorNo" headerAlign="center"   allowSort="true" visible=false>
			                           	           操作员
			                        </div>
			                        
			                         <div field="lCreditAnalyzeNo" headerAlign="center"  allowSort="true" visible=false>
			                           	            信用分析人员
			                        </div>
			                        
			                        <div field="vcCreditAnalyze" headerAlign="center"   allowSort="true" >
			                           	           信用分析
			                        </div>
			                        			                        	
			                        		                        			                         
		                            <div field="cSource" headerAlign="center"  allowSort="true" >
			                           	            数据来源
			                        </div>			                         
			                        <div field="lProcessInstId" headerAlign="center" align="right" allowSort="true" visible=false>
			                           	          流程id
			                        </div>			                        
			                        <div field="lDate" headerAlign="center" allowSort="true"  align="right"  renderer="lDateRender">录入日期</div>		
			                        <div field="vcExistLimiteDesc" headerAlign="center"allowSort="true" >发行规模描述</div>
									<div field="vcIssueBeginDateDesc" headerAlign="center"allowSort="true" >发行日期描述</div>
									<div field="vcTenderInterval" headerAlign="center"allowSort="true" >投标区间</div>
									<div field="vcUnderwriterInfo" headerAlign="center"allowSort="true" >承销商联系人信息</div>	
									<div field="vcIssueAppraiseCsrc" headerAlign="center"allowSort="true" visible="false">所属行业(证监会二级)</div>
									<div field="vcIssueAppraiseCsrcName" headerAlign="center"allowSort="true" >所属行业(证监会二级)</div>
									<div field="vcMortStockName" headerAlign="center"allowSort="true" >股票名称</div>
									<div field="vcMortStockAmount" headerAlign="center"allowSort="true" >股票抵押数量(万股)</div>
									<div field="vcMortStockCode" headerAlign="center"allowSort="true" >股票代码</div>
									<div field="enIssuerNetValue" headerAlign="center"allowSort="true" >公司净资产</div>
									<div field="vcCityLevel" headerAlign="center"allowSort="true" renderer="vcCityLevelRender">城投行政级别</div>
									<div field="lNInterestRateJumpPoints" headerAlign="center"allowSort="true" >下一利率跳升点数</div>                       
			                        <div field="vcInterCode" headerAlign="center" allowSort="true" visible=false>债券内码_Wind</div>
                                    <div field="vcStockCodeWind" headerAlign="center" align="center" allowSort="true" visible=false>
			                           	    债券代码_Wind
			                        </div>			                        			   			                       			                        
			                        <div field="lIssuerId" headerAlign="center" align="right"  allowSort="true" >发行主体编号</div>
			                        <div field="lGuarantorId" headerAlign="center" align="right" allowSort="true">担保人序号</div>
			                    </div>
			                 </div>
			               </div>
			               </div>
			               <div title="导出到O32新债详细信息" region="south" showSplit="false" showHeader="true" height="260" showSplitIcon="true" >
						        <div id="editForm1" style="margin-right:15px">
						            <input class="mini-hidden" name="id"/>
						             <table border="0" cellpadding="1" cellspacing="1" style="width:100%;table-layout:fixed;">
 
							                  <tr>
										           <td align="right">登记托管机构:</td>
												   <td align="left"><input id="vcPaymentPlace" width="100%"
														class="nui-dictcombobox" dictTypeId="CF_JY_DJTGCS"
														name="vcPaymentPlace" 
														readonly="true" inputStyle="background-color:#f0f0f0;" /></td>
												    <td  align="right">债券代码:</td>
										            <td  align="left">
										            	<input align="left" width="100%" id="vcStockCode" name="vcStockCode" class="mini-textbox" readonly="true"  inputStyle="background-color:#f0f0f0;"/>
										            </td>
										            <td  align="right">债券简称:</td>
										            <td  align="left">
										            	<input align="left" width="100%" id="vcStockName" name="vcStockName" class="mini-textbox" readonly="true"  inputStyle="background-color:#f0f0f0;"/>
										            </td>
										            <td   align="right">债券全称:</td>
										            <td  align="left">
										            	<input align="left" width="100%" name="vcStockNameFull" class="mini-textbox"  readonly="true"  inputStyle="background-color:#f0f0f0;"/>
										            </td>
										            <td   align="right">债券类别:</td>
										            <td   align="left">
										            	<input align="left" width="100%" name="typeName" name="typeName" class="mini-textbox"   readonly="true"  inputStyle="background-color:#f0f0f0;"/>
										            </td>
										        </tr>
										        <tr>
										            <td align="right">发行期限(年):</td>
										            <td align="left">
										            	<input id="enExistLimite" width="100%" name="enExistLimite" class="mini-textbox"  readonly="true"  inputStyle="background-color:#f0f0f0;"/>
										            </td>
										            <td align="right">发行规模(亿):</td>
										            <td align="left">
										            	<input id="enIssueBalance" width="100%" name="enIssueBalance" class="mini-textbox" readonly="true"  inputStyle="background-color:#f0f0f0;"/>
										            </td>
										         	<td align="right">债券评级:</td>
										            <td align="left">
										            	<input id="cBondAppraise" width="100%" name="cBondAppraise" class="nui-dictcombobox" dictTypeId="creditRating" readonly="true"  inputStyle="background-color:#f0f0f0;"/>
										            </td>
										            
										            <td align="right" style="width:100px;">债券评级机构:</td>
										            <td align="left" style="width:160px;">
										            	<input id="vcBondAppraiseOrgan" width="100%" name="vcBondAppraiseOrgan" class="nui-dictcombobox" dictTypeId="outRatingOrgan" readonly="true"  inputStyle="background-color:#f0f0f0;"/>
										            </td>
										            <td align="right">主体评级:</td>
										            <td align="left">
										            	<input id="cIssueAppraise" width="100%" name="cIssueAppraise" class="nui-dictcombobox" dictTypeId="issuerRating" readonly="true"  inputStyle="background-color:#f0f0f0;"/>
										            </td>
										        </tr>
												<tr>
													<td align="right">主体类型:</td>
												    <td align="left">
												    	<input id="vcIssueProperty" width="100%" name="vcIssueProperty" class="nui-dictcombobox"  dictTypeId="ATS_FM_ISSUE_PROPERTY" readonly="true"  inputStyle="background-color:#f0f0f0;"/>
												    </td>
												    <td align="right">发行主体:</td>
												    <td align="left">
												    	<input id="vcIssuerNameFull" width="100%" name="vcIssuerNameFull" class="mini-textbox"  readonly="true"  inputStyle="background-color:#f0f0f0;"/>
												    </td>
												    <td align="right">主体评级机构:</td>
												    <td align="left">
												    	<input id="vcIssueAppraiseOrgan" width="100%" name="vcIssueAppraiseOrgan" class="nui-dictcombobox" dictTypeId="outRatingOrgan" readonly="true"  inputStyle="background-color:#f0f0f0;"/>
												    </td>
												    <td align="right">所属行业:</td>
												    <td align="left"><input id="vcIndustryName" width="100%"
														name="vcIndustryName" class="mini-textbox" readonly="true"
														inputStyle="background-color:#f0f0f0;" /></td>
													<td align="right">所属省份:</td>
													<td align="left"><input id="vcProvince" width="100%"
														name="vcProvince" class="mini-textbox" readonly="true"
														inputStyle="background-color:#f0f0f0;" /></td>		
												</tr>
												<tr>
												    <td align="right">公告日期:</td>
												    <td align="left">
												    	<input id="lIssuePostDate" width="100%" name="lIssuePostDate" class="mini-textbox" readonly="true"  inputStyle="background-color:#f0f0f0;"/>
												    </td>
												     <td align="right">发行日期:</td>
												    <td align="left">
												    	<input id="lIssueBeginDate" width="100%" name="lIssueBeginDate" class="mini-textbox"  readonly="true"  inputStyle="background-color:#f0f0f0;"/>
												    </td>
												    <td align="right" style="width:90px;">投标截止时间:</td>
													<td align="left"><input id="dBidLimitTime" width="100%"
														name="dBidLimitTime" class="nui-datepicker" format="yyyy-MM-dd hh:mm:ss"
														readonly="true" inputStyle="background-color:#f0f0f0;" /></td>
												    <td align="right">缴款日期:</td>
												    <td align="left">
												    	<input id="lPayDate" width="100%" name="lPayDate" class="mini-textbox"  readonly="true"  inputStyle="background-color:#f0f0f0;"/>
												    </td>
												    <td align="right">上市日期:</td>
												    <td align="left">
												    	<input id="lPublishDate" width="100%" name="lPublishDate" class="mini-textbox"  readonly="true"   inputStyle="background-color:#f0f0f0;"/>
												    </td>
												</tr>
																	                
												 <tr>
												    <td align="right">利率类型:</td>
													<td align="left"><input id="cInterestType" width="100%"
														name="cInterestType" class="nui-dictcombobox" dictTypeId="rateType" readonly="true"
														inputStyle="background-color:#f0f0f0;" /></td>
													<td align="right">息票品种:</td>
													<td align="left"><input id="cPayInterestType" width="100%"
														name="cPayInterestType" readonly="true"
														class="nui-dictcombobox" dictTypeId="payInterestType"
														inputStyle="background-color:#f0f0f0;" /></td>
													<td align="right">付息频率:</td>
													<td align="left"><input id="enPayInteval" width="100%"
														name="enPayInteval"class="nui-dictcombobox" dictTypeId="ATS_CF_JY_FREQUENCY" readonly="true"
														inputStyle="background-color:#f0f0f0;" /></td>
												   	<td align="right">票面利率(%):</td>
													<td align="left"><input id="enFaceRate" width="100%"
														name="enFaceRate" class="mini-textbox" readonly="true"
														inputStyle="background-color:#f0f0f0;" /></td>
													<td align="right">缴款方式:</td>
													<td align="left"><input id="cPayType" width="100%"
														name="cPayType" class="nui-dictcombobox" dictTypeId="ATS_FM_PAYMENT" readonly="true"
														inputStyle="background-color:#f0f0f0;" /></td>				                    
												</tr>
																	                
												<tr>
												    <td align="right">主承销商:</td>
												    <td align="left">
												    	<input id="vcMainUnderwriter" width="100%" name="vcMainUnderwriter" class="mini-textbox"  readonly="true"  inputStyle="background-color:#f0f0f0;"/>
												    </td>
												    <td align="right">副主承销商:</td>
												    <td align="left">
												    	<input id="vcDeputyUnderwriter" width="100%" name="vcDeputyUnderwriter" class="mini-textbox"  readonly="true"  inputStyle="background-color:#f0f0f0;"/>
												    </td>
												    <td align="right">承销方式:</td>
												    <td align="left">
												    	<input id="cUnderwriteType" width="100%" name="cUnderwriteType" class="nui-dictcombobox"  dictTypeId="underwriteType" readonly="true"  inputStyle="background-color:#f0f0f0;"/>
												    </td>
												    <td align="right">承销团:</td>
													<td align="left"><input id="vcGroupUnderwriter" width="100%"
														name="vcGroupUnderwriter" class="mini-textbox"
														readonly="true" inputStyle="background-color:#f0f0f0;" /></td>
													<td align="right">特殊条款:</td>
													<td align="left"><input id="vcSpecialText" width="100%"
														name="vcSpecialText" class="nui-dictcombobox" dictTypeId="specialText" readonly="true"
														inputStyle="background-color:#f0f0f0;" /></td>	
												 </tr>
																	                
										    	  <tr>
											 		   <td  align="right">招标方式:</td>
													   <td  align="left"><input id="cBidType" width="100%"
															 name="cBidType" class="nui-dictcombobox" dictTypeId="tenderType" readonly="true"
															 inputStyle="background-color:#f0f0f0;" /></td>
																								
													    <td align="right">起息日期:</td>
														<td align="left"><input id="lBegincalDate" width="100%"
															name="lBegincalDate" class="mini-textbox" readonly="true"
															inputStyle="background-color:#f0f0f0;" /></td>
													    <td align="right">到期日期:</td>
											            <td align="left">
											            	<input id="lEndincalDate" width="100%" name="lEndincalDate" class="mini-textbox"  readonly="true"  inputStyle="background-color:#f0f0f0;"/>
											            </td>
											            <td align="right">担保人名称:</td>
											            <td align="left">
											            	<input id="vcGuarantorName" width="100%" name="vcGuarantorName" class="mini-textbox" readonly="true"  inputStyle="background-color:#f0f0f0;"/>
											            </td>
											            <td align="right">信用分析:</td>
														<td align="left"><input id="vcCreditAnalyze" width="100%"
															name="vcCreditAnalyze" class="mini-textbox"
															readonly="true" inputStyle="background-color:#f0f0f0;" /></td>
													</tr>
																		                
											        <tr>
														<td align="right">担保方式:</td>
														<td align="left"><input id="cAssuerType" width="100%"
															name="cAssureType" class="nui-dictcombobox" dictTypeId="ATS_FM_ASSUER_TYPE" readonly="true"
															inputStyle="background-color:#f0f0f0;" /></td>
											            <td align="right">下一行权日:</td>
														<td align="left"><input id="lNextExerciseDate" width="100%"
															name="lNextExerciseDate" class="mini-textbox" readonly="true"
															inputStyle="background-color:#f0f0f0;" /></td>
														<td align="right">是否具有回售权:</td>
											            <td align="left">
											            	<input id="cIsHaveSaleback" width="100%" name="cIsHaveSaleback" class="mini-combobox"  data="[{ id: 1, text: '是' }, { id: 0, text: '否'}]" readonly="true"  inputStyle="background-color:#f0f0f0;"/>
											            </td>
											            <td align="right">是否具有赎回权:</td>
														<td align="left"><input id="cIsHaveBuyback" width="100%"
															name="cIsHaveBuyback" class="mini-combobox"  data="[{ id: 1, text: '是' }, { id: 0, text: '否'}]"
															readonly="true" inputStyle="background-color:#f0f0f0;" /></td>	
											        	<td align="right">发行方式:</td>
									                    <td align="left">
									                    	<input id="vcIssueType" width="100%" name="vcIssueType" class="nui-dictcombobox" dictTypeId="issueType"  readonly="true"  inputStyle="background-color:#f0f0f0;"/>
									                    </td>		
									                </tr>
									                <tr>
									                	<td align="right">特殊期限:</td>
									                    <td align="left">
									                    	<input id="vcSpecialLimite" width="100%" name="vcSpecialLimite" class="mini-textbox"  readonly="true"  inputStyle="background-color:#f0f0f0;"/>
									                    </td>
									                    <td align="right">发行规模描述:</td>
									                    <td align="left">
									                    	<input id="vcExistLimiteDesc" width="100%" name="vcExistLimiteDesc" class="mini-textbox" readonly="true"  inputStyle="background-color:#f0f0f0;"/>
									                    </td>
									                    <td align="right">发行日期描述:</td>
									                    <td align="left">
									                    	<input id="vcIssueBeginDateDesc" width="100%" name="vcIssueBeginDateDesc" class="mini-textbox" readonly="true"  inputStyle="background-color:#f0f0f0;"/>
									                    </td>
									                    <td align="right">投标区间:</td>
									                    <td align="left">
									                    	<input id="vcTenderInterval" width="100%" name="vcTenderInterval" class="mini-textbox" readonly="true"  inputStyle="background-color:#f0f0f0;"/>
									                    </td>
									                    <td align="right">承销商联系人信息:</td>
									                    <td align="left">
									                    	<input id="vcUnderwriterInfo" width="100%" name="vcUnderwriterInfo" class="mini-textbox" readonly="true"  inputStyle="background-color:#f0f0f0;"/>
									                    </td>
									                </tr>
							            </table>
							            </div>
							            </div>
						    </div>
</body>
	<script type="text/javascript">
    	nui.parse();
    	var grid = nui.get("datagrid1");
    	var form = new nui.Form("#form1");
    	var msg;
    	
    	var renders = [{ id: "1", text: '是' }, { id: "0", text: '否'}];
    	
    	var formData = form.getData(false,false);
		grid.load(formData);
		 $("#editForm1 .mini-buttonedit-buttons").remove();
		 $("#editForm1 .mini-buttonedit-border").css("background-color","#f0f0f0");
		
		function reset(){
			form.reset();
		}
		
		 
         //利率类型
    	function rendererRateType(e){
    		return nui.getDictText("rateType", e.row.cInterestType);
    	}
    	
    	//息票品种
    	function rendererPayInterstType(e){
    		return nui.getDictText("payInterestType", e.row.cPayInterestType);
    	}
    	
    	//付息频率
    	function rendererEnPayInteval(e){
    		//return nui.getDictText("ATS_CF_JY_FREQUENCY", e.row.enPayInteval);
    		var enPay = nui.getDictText("ATS_CF_JY_FREQUENCY", e.row.enPayInteval);
    		if(enPay!=null&&enPay!=""){
    			return enPay;
    		}else{
    			return e.row.enPayInteval;
    		}
    	}
    	//招标方式
    	function renderercBidType(e){
    		return nui.getDictText("tenderType", e.row.cBidType);
    	}
    	
    	//缴款方式
    	function rendererPaymentType(e){
    		return nui.getDictText("ATS_FM_PAYMENT", e.row.cPayType);
    	}
    	
    	  //债券评级机构
        function onBondAppraiseRenderer(e){
        	return nui.getDictText("creditRating",e.row.cBondAppraise);
        }
        
         //债券评级机构
        function onBondAppraiseOrganRenderer(e){
        	return nui.getDictText("outRatingOrgan",e.row.vcBondAppraiseOrgan);
        }
        
        function issuePropertyRenderer(e){
        	return nui.getDictText("ATS_FM_ISSUE_PROPERTY",e.row.vcIssueProperty);
        }
        function cAssureTypeRenderer(e){
        	return nui.getDictText("ATS_FM_ASSUER_TYPE",e.row.cAssureType);
        }
        
        function creditRatingRenderer(e){
        	return nui.getDictText("issuerRating",e.row.cIssueAppraise);
        }
        //rendererSpecialText
        function rendererSpecialText(e){
        		return nui.getDictText("specialText",e.row.vcSpecialText);
        }
        function outRatingOrganRenderer(e){
        	return nui.getDictText("outRatingOrgan",e.row.vcIssueAppraiseOrgan);
        }
        
        function underwriteTypeRenderer(e){
        	return nui.getDictText("underwriteType",e.row.cUnderwriteType);
        }
        
		function isRenderer(e) {
            for (var i = 0, l = renders.length; i < l; i++) {
                var g = renders[i];
                if (g.id == e.value) {
                  return g.text;
                }else{
                  return "否";
                }
            }
        }
        function lDateRender(e){
        	var tempDate = e.row.lDate;
        	return dateTemp(tempDate);
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
        function vcCityLevelRender(e){
        	return nui.getDictText("cityLevel",e.row.vcCityLevel);
        }
        function cStatusRenderer(e){
			return nui.getDictText("newstockStatus",e.row.cStatus);
		}	
		
		 function vcPaymentPlaceRenderer(e){
        		return nui.getDictText("CF_JY_DJTGCS",e.row.vcPaymentPlace);
        }
		function exportStatus(e){
			return nui.getDictText("exportStatus",e.row.tmpstatus);
		}
		       //更改日期格式
	 	 function renderDataTemp(e){
			if(e.value == "0" || e.value == null){
			  return "";
	        }
			return dataTemp(e.value);
		}  
	  	 function dataTemp(oldData){
			oldData = oldData+"";
			if(oldData=="0" || oldData=="" || oldData=="null" || oldData==null || oldData=="1"){
				return "";
			}
			var yy = oldData.substr(0,4);
			var mm = oldData.substr(4,2);
			var dd = oldData.substr(6,2);
			return yy+"-"+mm+"-"+dd;
		} 
		
        //查询
        function search(){        	
        	var data = form.getData(false,false);      //获取表单多个控件的数据
        	var editForm1 = new nui.Form("#editForm1");
        	editForm1.reset();
            grid.load(data);
        }
        
        function o32exportExcel(){
       		var frm = document.getElementById("queryForm");
       		var rows = grid.getSelecteds();
       		var ids = new Array();
            if (rows.length > 0) {
                for(var i=0;i<rows.length;i++){
                	ids.push(rows[i].lStockIssueId);
                }
                var data = ids.join(',');
                 nui.get("excelData").setValue(data);
                 nui.get("count").setValue(rows.length);
				frm.action = "com.cjhxfund.ats.fm.baseinfo.o32Export.flow";
				frm.submit();
            } else {
            	nui.alert("请选中一条记录", "提示 ", function(){});
                return false;
            }
       		 
       }
       
       function O32finishExport(){
       		var rows = grid.getSelecteds();
       		var ids = new Array();
            if (rows.length > 0) {
                for(var i=0;i<rows.length;i++){
                	ids.push(rows[i].lStockIssueId);
                }
                var data = ids.join(',');
                 
                nui.ajax({
	            url: "com.cjhxfund.ats.fm.baseinfo.intfStockInfoQueryManager.updateStockTempStatus.biz.ext",
	            type: "post",
	            contentType:'text/json',
	            data: nui.encode({stockIssueIds:data,type:1}),
	            success: function (text) {
	              var returnJson = nui.decode(text);
        			if(returnJson.exception == null){
        				nui.alert("操作成功", "系统提示", function(action){
                        		if(action == "ok" || action == "close"){
                            		grid.reload();
                        		}
                    		});
        			}
	            }
	          });
				
            } else {
            	nui.alert("请选中一条记录", "提示 ", function(){});
                return false;
            }
       		 
       }
       
       //置为待导出到 O32
       function O32waitExport(){
       		var rows = grid.getSelecteds();
       		var ids = new Array();
            if (rows.length > 0) {
                for(var i=0;i<rows.length;i++){
                	ids.push(rows[i].lStockIssueId);
                }
                var data = ids.join(',');
                 
                nui.ajax({
	            url: "com.cjhxfund.ats.fm.baseinfo.intfStockInfoQueryManager.updateStockTempStatus.biz.ext",
	            type: "post",
	            contentType:'text/json',
	            data: nui.encode({stockIssueIds:data,type:2}),
	            success: function (text) {
	              var returnJson = nui.decode(text);
        			if(returnJson.exception == null){
        				nui.alert("操作成功", "系统提示", function(action){
                        		if(action == "ok" || action == "close"){
                            		grid.reload();
                        		}
                    		});
        			}
	            }
	          });
				
            } else {
            	nui.alert("请选中一条记录", "提示 ", function(){});
                return false;
            }
       }
      //导出待导出的到O32
      function o32exportByWait(){
      	nui.ajax({
				    url: "com.cjhxfund.ats.fm.baseinfo.DebtIssueManager.exportByWait.biz.ext",
				    type: "post",
				    dataType:"json",
				    success: function (text) {
				    	var ret = nui.decode(text);
				    	if(ret.errType==1){
				    		nui.alert("不在合法 9:30-17:30时间范围内 ！");
				    	}else if(ret.errType==2){
				    		nui.alert("存在正在导出的新债信息，请等待转换机处理 ！ ");
				    	}else if(ret.errType==3){
				    		nui.alert("系统处理错误 ，请联系管理员  ！ ");
				    	}else if(ret.errType==4){
				    		nui.alert("不存在需要导出的新债信息，请先推送 ！ ");
				    	}else if(ret.errType==5){
				    		nui.alert("11:30-13:00、17:00-18:00为转换机工作时间，不支持此时间段内推送新债");
				    	}else if(ret.errType==0){
				    		nui.alert("成功导出新债信息，请等待转换机处理 ！ ");
				    	}
			    		grid.reload();
				    }
		});
      }
      
       /*  function clearStockType(e){
        	if(e.source.value==null || e.source.value==""){
		   			//清空债券类型
		   			var vcStockType = nui.get("vcStockType");
			        vcStockType.setValue("");
		            var url = "com.cjhxfund.ats.fm.instr.StockIssueInfoBiz.loadStockType.biz.ext?type=1";
		            vcStockType.setUrl(url);
		   		}
        } */
        loadStockTypeAll();
             //加载所有的债券信息
             function loadStockTypeAll(){
             	
             	nui.ajax({
				    url: "com.cjhxfund.ats.fm.instr.StockIssueInfoBiz.loadStockType.biz.ext",
				    type: "post",
				    dataType:"json",
				    success: function (text) {
				    	nui.get("vcStockType").loadList(text.data);
				    }
				});
             	
             }
        
        function commonLoading(msg,title){
			return nui.loading(msg,title);
			}
		
		 function commonHideMessageBox(messageid){
		    nui.hideMessageBox(messageid);
		 }
       function formatDate(e){
        	var date = e.row.dBidLimitTime;
        	if(date==null || date==""){
        		return "";
        	}else{
	        	var y = date.getFullYear();  
			    var m = date.getMonth() + 1;  
			    m = m < 10 ? ('0' + m) : m;  
			    var d = date.getDate();  
			    d = d < 10 ? ('0' + d) : d;  
			    var h = date.getHours();  
			    var minute = date.getMinutes();  
			    minute = minute < 10 ? ('0' + minute) : minute;  
			    return y + '-' + m + '-' + d+' '+h+':'+minute;  
        	}
        }
        //行单击时重新设置tabs页面参数
	grid.on("rowclick", function (e) {
		var form = new nui.Form("#editForm1");//将普通form转为nui的form
		form.setData(e.row);
		//处理付息频率，值满足数据字典则直接显示数据字典中对应值，否则直接显示值
		if(nui.get("enPayInteval").getText()=="" || nui.get("enPayInteval").getText()==null){
			nui.get("enPayInteval").setText(e.row.enPayInteval);
		}				
    });
    </script>
</html>