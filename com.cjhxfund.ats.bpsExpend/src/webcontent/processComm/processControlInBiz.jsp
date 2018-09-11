<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	 <style type="text/css">
	     .mini-grid-cell2{
	     	text-align: center;
	     	color: red;
	     	font-size: 12pt;
	     }
	     #processTable td{
	     	vertical-align: middle;
	     }
	     .comm-comments-text-ellipsis .mini-grid-rows-content table,
	     .comm-comments-text-ellipsis .mini-grid-rows-content tbody,
	     .comm-comments-text-ellipsis .mini-grid-rows-content tr,
	     .comm-comments-text-ellipsis .mini-grid-rows-content td{
	     	    display: block; 
	     } 
	     .comm-comments-text-ellipsis .mini-grid-rows-content,
	     .comm-comments-text-ellipsis .mini-listbox-view{
	     		overflow: hidden;
	     }
	     .comm-comments-text-ellipsis .mini-grid-rows-content tr .mini-listbox-checkbox{
	     	    display: none; 
	     } 
	</style>
	<script type="text/javascript" src="<%= request.getContextPath() %>/JQMHistory/common/common.js"></script>
	<div title="流程信息" id="processInfo" class="nui-panel" iconCls="icon-edit" style="width:100%;" showCollapseButton="true" collapseOnTitleClick="true">
		<div id="processForm" style="padding-top: 5px;" >
	  		<!-- 流程缓存属性开始 -->
	        <input type="hidden" class="nui-hidden" name="workitem.workItemID" />
	        <input type="hidden" class="nui-hidden" name="workitem.processInstID" />
	        <input type="hidden" class="nui-hidden" name="workitem.activityInstID" />
	        <input type="hidden" class="nui-hidden" name="workitem.activityInstName" />
	        <input type="hidden" class="nui-hidden" name="workitem.activityDefID" />
	        <input type="hidden" class="nui-hidden" name="workitem.processInstName" />
	        <input type="hidden" class="nui-hidden" name="workitem.rootProcInstID" />
	        <input type="hidden" class="nui-hidden" name="workitem.processDefID" />
	        <!-- 流程缓存属性结束 -->
	
	        
	        	<table id="processTable"  style="width: 98%;  table-layout: fixed;" class="nui-form-table">
				   <tr id="subjectTR" style="display:none">
						<th class="nui-form-label"  style="width: 13%">主题：</th>
						<td colspan="1"	style="vertical-align: middle;" id="subjectTd">
						    <font style="width: 100%" id="subjectText"></font>
						</td>
						<th class="nui-form-label"  style="width: 13%"></th>
						<td style="vertical-align: top;">
						    <font style="width: 100%"></font>
						</td>
					</tr>
					<tr id="currentPartTR">
						<th class="nui-form-label"  style="width: 13%">当前参与者：</th>
						<td colspan="1"	style="vertical-align: middle;" id="nextActorTd">
						    <font style="width: 100%" id="nextActorText"></font>
						</td>
						<th class="nui-form-label"  style="width: 13%">上一参与者：</th>
						<td id="lastActorTd" style="vertical-align: top;">
						    <font style="width: 100%" id="lastActorText"></font>
						</td>
					</tr>
					<!-- 流程操作控制 -->
					<tr  class="odd" id="operateTypeTr">
						<th class="nui-form-label">操作：</th>
						<td colspan="3" class="radio-border-top-none">
								<input name="bpsParam.operateType" id="operateType" class="nui-radiobuttonlist" onitemclick="operateCheck(this)" />
								<input id="bpsAuth_vetoAuth" class="nui-hidden" name="bpsAuth.vetoAuth"/>
								<input class="nui-hidden" name="bpsParam.sendMailAuth"/>
						</td>						
					</tr>
					
					<!-- 流程退办控制 -->
					<tr id="backActivity_tr" style="display: none;">
						<th class="nui-form-label" style="width:13%">退办：</th>
						<td colspan="1"  style="width:30%">
	    					<span id="noActivitySpan" style="display: none;color: blue;">无可退办环节</span>
	    					<input id="backActivity" name="bpsParam.backActivity" class="nui-combobox" 
	    					textField="activityinstname" valueField="activitydefid"  
	    					onvaluechanged="backActivityChanged" style="width:100%">
						</td>
						<td colspan="2" style="width:57%" >
	    					<div  id="isReAudit" name="bpsParam.isReAudit" class="nui-radiobuttonlist" 
	    					style="display: none;width:100%" 
	    					data="[{id: '0', text: '驳回后流程重新流转'},{id: '1', text: '驳回的节点通过后直接回到本人'}]" ></div>
						</td>
					</tr>
					
					<!-- 流程转办 -->
					<tr id="handlerActor_tr" style="display: none;">
	                        <th class="nui-form-label" id="handlerActor_td">
	                        <font style="color: red;">*</font><span id="handlerActorTitle">请选择转办人员</span>：
	                        </th>
	                        <td colspan="3" align="left" style="padding-left: 5px;">
	                          <input class="nui-buttonedit" id="handlerActor"  name="bpsParam.handlerActor" onclick="selectSingleEmp" style="width:30%">
	                        </td>
	                </tr>
	                
	                <!-- 流程征求意见-->
					<tr id="helpActor_tr" style="display: none;">
	                        <th class="nui-form-label" id="helpActor_td">
	                        <font style="color: red;">*</font><span id="helpActorTitle">请选择征求意见人员</span>：
	                        </th>
	                        <td colspan="3" align="left" style="padding-left: 5px;">
	                          <input class="nui-buttonedit" id="helpActor"  name="bpsParam.helpActor" onclick="selectMutiEmp" style="width:30%">
	                        </td>
	                </tr>
	                
	                <!-- 流程分支控制 -->
                 	<tr id="yn_tr" >
                        <th class="nui-form-label" id="yn_td">
                        <font style="color: red;">*</font><span id="ynTitle"><b:write property="bpsAuth/ynTitle"/></span>
                        </th>
                        <td colspan="3" class="radio-border-top-none">
                        	<input id="yn" name="bpsParam.yn" class="nui-radiobuttonlist"  onitemclick="setCommentBySelect('yn','ynTitle')" data="[{id: 'Y', text: '是'}, {id: 'N', text: '否'}]"/>
                        </td>
                    </tr>
	                 
	               <!-- 流程选择参与者控制 -->  
                    <tr id="participant_tr" >
                        <th class="nui-form-label" id="participant_td">
                        <font style="color: red;">*</font><span id="participantTitle"><b:write property="bpsAuth/participantTitle"/></span>：
                        <input class="nui-hidden"  id="selectUserName" name="bpsParam.selectUserName"  >
                        </th>
                        <td colspan="3">
                          	<input class="nui-buttonedit"  id="selectUser2"  name="bpsParam.selectUser"  onclick="selectEmpByFlag" style="width:300px"/>
                          	<input class="nui-hidden"  id="empsName"  value="${empsName}"/>
                          	<input class="nui-hidden"  id="empsValue"  value="${bpsParam.selectUser}"/>
                        </td>
                    </tr>
	                
	                
	                <!-- 流程抄送人员控制 -->
                	<tr id="send_tr" >    
                        <th class="nui-form-label" id="masterid" >
                        	抄送方式：
                        </th>
                    	<td colspan="1">
                    		<div id="cbl1" class="nui-checkboxlist"name="bpsParam.sendType" onvaluechanged="showHideSend"data="[{text:'系统通知',id:'notice'},{text:'邮件',id:'mail'},{text:'传真',id:'fix'}]" style="width:100%"/>
                    	</td>  
                    </tr>
                	<!-- 邮件信息 -->
					<tr id="send_info_tr1" >
						<th class="nui-form-label" id="masterid" >邮件主题：</th>
						<td colspan="1">
							<input class="nui-textbox" name="bpsParam.mailTitle" id="mailTitle" width="80%" value=""/>
						</td>
						<th class="nui-form-label" id="masterid" ><label style="color: red;">*</label>邮件主送:</th>
						<td colspan="1">
							<input class="nui-textbox" name="bpsParam.to" id="mailTo"  width="80%"/>
						</td>
					</tr>
					<tr id="send_info_tr2" >
						<th class="nui-form-label" id="masterid">邮件抄送：</th>
						<td colspan="1">
							<input class="nui-textbox" name="bpsParam.cc" id="mailCc" width="80%" />
						</td>
					</tr>
					<tr id="send_info_tr3" >
						<th class="nui-form-label" id="masterid">邮件正文：</th>
						<td colspan="3">
							<input class="nui-textarea" name="bpsParam.mailContent" id="mailContent" width="80%" height="60px"/>
						</td>
					</tr>
	                <!-- 流程信息其它特殊的控制 -->
	          </table>
		      <table id="processTable"  style="width: 98%;  table-layout: fixed;" class="nui-form-table">
	                <tr>
						<th class="nui-form-label" style="width: 13%" >处理意见：</th>
						<td colspan="3">
							常用意见：<input class="nui-combobox" id="comm_comments" name="comm_comments" 
								dataField="result" textField="dictName" valueField="dictName" 
								emptyText="请选择..."  showNullItem="true" nullItemText="请选择..."
								onvaluechanged="changeCommentBySelect(this)" specialClass="comm-comments-text-ellipsis"
								url="com.cjhxfund.fpm.bpsExpend.comment.queryCommComments.biz.ext" >  <a class="nui-button" plain="true" iconCls="icon-add" onclick="addComment()" >自定义</a>
							  <input id="vcComments" onvaluechanged="cleanTheSpace" class="nui-textarea" style="width: 100%; height: 70px" maxLength="512" name="pmprcaprvinfo.vcComments"/>
						</td>
					</tr>
												
	                <tr>
				        <th class="nui-form-label" style="vertical-align: top;"> 附件： </th>
			            <td colspan="3">
    						<iframe id="prodIfm" name="prodIfm" width="100%" height="130px"  frameborder="no" border="0" marginwidth="0" marginheight="0"  src="" ></iframe>  
						</td>
		            </tr>
	        </table> 
	        
	        <table id="chargeTable"  style="width: 98%;  table-layout: fixed;" class="nui-form-table">  
	        	<tr  class="odd" id="printTr" style="display: none;">
						<th class="nui-form-label" style="width: 13%"><span style="color:red">*</span>是否用印：</th>
						<td colspan="3" class="radio-border-top-none">
								<input name="bpsParam.isPrint" id="isPrint" 
								class="nui-radiobuttonlist"
								data="[{id:'1',text:'是'},{id:'0',text:'否'}]"/>
						</td>						
					</tr>
					
					<tr  id="chargeCapitalTr" style="display: none;">
						<th class="nui-form-label" style="width: 13%"><span style="color:red">*</span>本次已冲销金额（万元）：</th>
						<td colspan="3">
								<input name="chargeMoney.chargeCapital" id="chargeCapital"
								class="nui-textbox" onblur="numTrans('chargeCapital')" onvalidation="fixRateCheck"/>
						</td>						
					</tr>
					
					<tr  id="chargeArrangeTr" style="display: none;">
						<th class="nui-form-label" style="width: 13%"><span style="color:red">*</span>收付款安排：</th>
						<td colspan="3" class="radio-border-top-none">
								<input name="chargeMoney.chargeArrange" id="chargeArrange" 
								class="nui-radiobuttonlist" onValueChanged="chargeArClick(this)" 
								data="[{id:'1',text:'线下出款'},{id:'2',text:'线下收款'},{id:'3',text:'无收付款'}]"/>
						</td>						
					</tr>
					
					<tr  id="chargePayTr" style="display: none;">
						<th class="nui-form-label" style="width: 13%"><span style="color:red">*</span>出款金额（万元）：</th>
						<td colspan="2">
								<input name="chargeMoney.payAmout" id="payAmout" 
								class="nui-textbox" onblur="numTrans('payAmout')" onvalidation="fixRateCheck"/>
						</td>
						<th class="nui-form-label" style="width: 13%"><span style="color:red">*</span>对方收款账户名：</th>
						<td colspan="3">
								<input name="chargeMoney.payName" id="payName" 
								class="nui-textbox"/>
						</td>
						<th class="nui-form-label" style="width: 13%"><span style="color:red">*</span>对方收款账号：</th>
						<td colspan="3">
								<input name="chargeMoney.payNo" id="payNo" 
								class="nui-textbox"/>
						</td>						
					</tr>
					
					<tr  id="chargeIncomeTr" style="display: none;">
						<th class="nui-form-label" style="width: 13%"><span style="color:red">*</span>收款金额（万元）：</th>
						<td colspan="3">
								<input name="chargeMoney.incomeAmout" id="incomeAmout" 
								class="nui-textbox" onblur="numTrans('incomeAmout')" onvalidation="fixRateCheck"/>
						</td>						
					</tr>
	        </table> 
	        
			 <table style="width: 98%; table-layout: fixed; border-collapse: collapse; " >
				<tr >
	           		<th class="nui-form-label" style="vertical-align: top;width:13%;">审批意见：</th>
	           		<td colspan="3" style="padding: 5px 12px 5px 12px;">
	           		</td>           		
	           	</tr>
	           	<tr>         	
	           		<td colspan="5"  style="padding-left: 38px">
	           			<div id="processGrid" class="nui-datagrid" dataField="pmprcaprvinfos" style="width: 99%; min-height:150px; max-height:270px;" height="270px"
	           				url="com.cjhxfund.fpm.bpsExpend.aprvInfo.queryAprvInfo.biz.ext"
							multiSelect="true" allowSortColumn="false" showPager="false" allowCellSelect="true"
							allowResizeColumn="false"  allowCellWrap="true">						
							<div style="overflow:auto;" property="columns" >
								<div field="vcWorkItemName" headerAlign="center" allowSort="true" width="13%"		visible="true">任务项</div>
								<div field="vcUserName" name="userName" headerAlign="center"  width="7%"	allowSort="true" visible="true">参与者</div>
								<div field="vcOperateType" headerAlign="center" allowSort="true" renderer="onOperateType"  width="7%">操作</div>
								<div field="vcOperatePeople" headerAlign="center" allowSort="true"  width="10%">转办/征求接收人</div>
								<div field="vcComments" headerAlign="center" allowSort="true" width="33%"	 	visible="true">处理意见</div>
								<div field="dStartTime" headerAlign="center" allowSort="true" width="13%"		visible="true" dateFormat="yyyy-MM-dd HH:mm:ss ">开始时间</div>
								<div field="dEndTime" headerAlign="center" allowSort="true" width="13%"	visible="true" dateFormat="yyyy-MM-dd HH:mm:ss ">结束时间</div>
							</div>						
						</div>  
	           		</td>           		
	           	</tr>
	           	<tr style="height: 50px"><td ></td></tr>
			</table>
			<!-- !!!!!!!!!!!!!!!!!!!!!!! -->
			<div class="nui-toolbar" style="width:99%; border-bottom:2;padding:0px;position: fixed;bottom: 0px; z-index: 99;">
	                <table  style="width:100%; table-layout:fixed;">
	                    <tr>
	                        <td id="excute" style="text-align:center;" colspan="6">
	                        	<a class="nui-button" id="saveBtn" iconCls="icon-ok" onclick="saveData()">保存</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            <a class="nui-button" id="processSubBtn" iconCls="icon-ok" onclick="processBizSubmit()">提交</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            <a class="nui-button" id="closeBtn" iconCls="icon-ok" onclick="closeBiz()">关闭</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                        </td>
	                    </tr>
	                </table>
	        </div>
       </div>
	</div>
<script type="text/javascript">
	var processForm = new nui.Form("#processForm"); 
	
	var backActivityDefaultValue = "";	
	
	var processInstID = '${param.processInstID}';
	var activityInstID = '';
	var activityDefID = '';
	var activityInstName = '';
	var processDefName = '';
	var processInstName = '';
	var workItemID = '${param.workItemID}';
	var selectUserFlag = "";//1单选 2多选
	var bpsAuth = {};
	var workitem = {};
	var helpState = 0;
	

	
	
	/*--------------------业务页面调用方法-------------------------------*/
	
	//获取是否展示废弃权限
	var resultCheck=null;
	
	//获取操作选项	
	function getOperateType(){
		return nui.get("operateType").getValue();
	}	
	//获取征求意见状态
	function getIsHelpState(){
		//是否处于征求意见状态
		return helpState;
	}	
	
	//判断是否需要保存
	function saveBizBtn(){
		if(pageType == "edit"){
			nui.get("saveBtn").show();
		} else {
			nui.get("saveBtn").hide();
		}
	}
	
	//流程提交方法
	function processBizSubmit(){
		if(typeof processSubmit === 'function'){
			processSubmit();
		} else {
			processBaseSubmit();
		}
	}
	
	//纯流程提交
	function processBaseSubmit(){
		var processData = getProcessFormData();
		//流程js验证
		if(checkProcessForm()==false) return false;
		
		var json = nui.encode(processData);
		var urlStr = "com.cjhxfund.fpm.bpsExpend.task.submitTask.biz.ext";
    		nui.ajax({
    			type:"post",
    			url:urlStr,
    			data:json,
    			cache:false,
    			async:false,
    			contentType:'text/json',
    			success:function(text){
    				var returnJson = nui.decode(text);
	              	if(returnJson.exception == null){
	                 	nui.alert("流程提交成功","系统提示",function(action){
                 	 		if (window.parent.opener && window.parent.opener.search){
		                    	window.parent.opener.search();
			                }
                 	 		window.parent.close();
	               		});
	                 
	              	}else{
	                 	nui.alert("流程提交失败。", "系统提示", function(action){
	                    	if(action == "ok" || action == "close"){
	                    	}
	                  	});
	               	}
		      	}
    		});
	
	}
	
	//获取流程表单数据
	function getProcessFormData(){
		processForm.setChanged(false);  
		//获取表单数据
		var data = processForm.getData(false,true);
		data.bpsParam.isHelp = helpState;
		//获取附件ID	    	
		//data.fileIds = getProcessFileIds();
		return data;
	}
	
	//初始化
	function initProcessBiz(){
	
	debugger;
	console.log(processInstID);
	
		var jsonstr;
		var thisProcessInstID = processInstID;
		if(processInstID == null){
			thisProcessInstID = wProcessInstID;
		}
		//审批意见
		var processGrid = nui.get("processGrid");
    	jsonstr = {processinstid:thisProcessInstID};
    	processGrid.load(jsonstr);   
    	saveBizBtn();
		//初始化流程参数
		initProcessParam();
		//设置默认人员
		setDefaultEmp();
		//初始化操作权限
    	loadAuditOprate();
		//初始化参与者显示
		reSetActor();
		//初始化通知模块
		showHideSend();
		//初始化页面信息
		showHideHtml();
	}
	
	/*设置操作权限
	 * 权限说明：-1,不可退办；0，正常权限，不可废弃；1,废弃权限
	 * 
	 */
	function loadAuditOprate(){
		var operateRight = nui.get("bpsAuth_vetoAuth").value;
		var operateType = nui.get("operateType");
		var operateData = [];
		var agreeVeto = {id:'1',text:'同意'};
		var backVeto = {id:'2',text:'退办'};
		var delegVeto = {id:'3',text:'转办'};
		var helpVeto = {id:'4',text:'征求意见'};
		var rejectVeto = {id:'5',text:'废弃'};
		var disAgreeVeto = {id:'6',text:'不同意'};
		var orAgreeVeto = {id:'7',text:'有条件通过'};
		var suspendVeto = {id:'8',text:'暂缓'};
		//挂起   拟同意 	同意 	退办 	转办	 征求意见 废弃 不同意   (按钮显隐按数字相加值设置)
		//128  64   32  16  8    4    2   1
		if((operateRight&64)==64){//拟同意
			operateData.push(orAgreeVeto);
		}
		if((operateRight&32)==32){//同意
			operateData.push(agreeVeto);
		}
		if((operateRight&16)==16){//退办
			operateData.push(backVeto);
		}
		if((operateRight&8)==8){//转办
			operateData.push(delegVeto);
		}
		if((operateRight&4)==4){//征求意见
			operateData.push(helpVeto);
		}
		if((operateRight&128)==128){//挂起
			operateData.push(suspendVeto);
		}
		if((operateRight&2)==2){//废弃
			operateData.push(rejectVeto);
		}
		if((operateRight&1)==1){//不同意
			operateData.push(disAgreeVeto);
		}
		
		if(operateData==null||operateData==""){
			operateData.push(agreeVeto);//同意
			operateData.push(backVeto);//退办
			operateData.push(delegVeto);//转办
			operateData.push(helpVeto);//征求意见
		} else if (operateData.length==1&&operateData[0].id==1){
			$("#operateTypeTr").css("display","none");//只有同意按钮时隐藏操作行
		}
		operateType.load(operateData);
	}

	//取回退的活动实例
	function loadActivities(){
		//避免多次调用
		if(nui.get(backActivity).getValue()==null){
			var urlStr = contextPath + "/com.cjhxfund.fpm.bpsExpend.rollback.getRollBackActivitys.biz.ext";
	    	var json = nui.encode({processInstID:processInstID,currentActivityInstID:activityInstID});
	    	$.ajax({
	            url:urlStr,
	            data:json,
	            type:'POST',
	            contentType:'text/json',
	            cache:false,
	            async:false,
	            success:function(d){
	            	if(d && d.activitys) {
	            		var data = d.activitys;
	            		var backActivityCombo = nui.get("backActivity");
	                	backActivityCombo.load(data);
	                	if(data && data.length > 0){
	                		backActivityDefaultValue = data[0].activitydefid;
	                		backActivityDefaultName = data[0].activityinstname;
	                		nui.get("backActivity").setValue(backActivityDefaultValue);
	                		nui.get("isReAudit").show();
	                		nui.get("isReAudit").setValue("0");
	                		var backComments = "退办：" + "\"" + backActivityDefaultName + "\"" + "环节";
	                		nui.get("vcComments").setValue(backComments);
	                	}
	            	}else{
	            		jQuery("#noActivitySpan").show();
	            		nui.get("isReAudit").hide();	
	            		nui.get("backActivity").hide();
	            	}
	            }
	            
	       });
       }
	}
	
	//初始化流程参数
	function initProcessParam(){
		var data = {};
		if(workItemID){
			var url1 = "com.cjhxfund.fpm.bpsExpend.process.getProcessInfos.biz.ext";
			var json = nui.encode({workitemID:workItemID});
			//common/commonUtil.js 通用方法
			var d1 = pm_ajax(json,url1,false);	
			data = {workitem:d1.workitem,bpsParam:d1.bpsParam,pmprcaprvinfo:{vcComments:"同意"},bpsAuth:d1.bpsAuth};
			if(data.bpsParam)data.bpsParam.operateType = 1;
			else data.bpsParam = {operateType:1};
			processForm.setData(data);
			bpsAuth = d1.bpsAuth;
			workitem = d1.workitem;
			activityDefID = d1.activityDefID;
			activityInstID = workitem.activityInstID;
			processDefName = workitem.processDefName;
			processInstName = workitem.processInstName;
			helpState = workitem.helpState;
			$("#nextActorText").text(d1.nextActor);//加载当前参与者
			$("#lastActorText").text(d1.lastActor);//加载上一参与者
			if(bpsAuth&&bpsAuth.ynAuth==1&&workitem.helpState==0){//流程分支显隐
            	$("#again_tr").show();
            	$("#ynTitle").text(bpsAuth.ynTitle);
            } else {
            	$("#yn_tr").hide();
            }
            if(bpsAuth&&bpsAuth.participantAuth==1&&workitem.helpState==0){//征求意见选择人显隐
            	$("#participant_tr").show();
            	$("#participantTitle").text(bpsAuth.participantTitle);
            } else {
            	$("#participant_tr").hide();
            }
            if(bpsAuth&&bpsAuth.sendAuth==1&&workitem.helpState==0){//抄送选择人显隐
            	$("#send_tr").show();
            } else {
            	$("#send_tr").hide();
            }
		} else {
			data = {bpsParam:{operateType:1},bpsAuth:{vetoAuth:"32"},pmprcaprvinfo:{vcComments:"同意"}};
			$("#yn_tr").hide();
			$("#participant_tr").hide();
			$("#send_tr").hide();
		}
		//加载表单信息
		processForm.setData(data);
		//控制主题显隐
		//if(processDefName == "com.cjhxfund.ats.instruction.InterestSwap.openInterestSwap"){
			//$("#subjectTR").show();
			///$("#subjectText").text(processInstName);			
		//}
	}
	
	function refreshFile(){}
	
	//初始化流程附件
	function initProcessFile(){
		var busIfr = window.parent.getBusTabIframe();  
		if(busIfr!=null&&busIfr.contentWindow!=null){
			var thisProcessInstID = processInstID;
			if(processInstID == null||processInstID == ""){
				thisProcessInstID = wProcessInstID;
			}
			if(busIfr.contentWindow.getBizId!=null){
				bizId = busIfr.contentWindow.getBizId();
			}
			if(busIfr.contentWindow.getBizCode!=null){
				bizCode = busIfr.contentWindow.getBizCode();
			}
			if(bizId!=null&&bizId!=""){
				loadProcessFileFrmSrc(bizId,bizCode,thisProcessInstID,activityDefID);
				
			}
		}
	}
	
   //检查表单
	function checkProcessForm() {
		var flag = true;
		var operateType = nui.getbyName("bpsParam.operateType").getValue();
		
		if(operateType==2){//退办
			if(nui.get("backActivity").getValue()==null || nui.get("backActivity").getValue()==""){
				alert("无可退办节点");
				flag = false;
			}
		}
		
	  	if(operateType==3){//转办
	       var size=nui.getbyName("bpsParam.handlerActor").getValue();
	     	if(size.length<=0){
	        	alert("请选择转办人员");
	       		flag = false;
	        }	
		}
		
		if(operateType==4){//征求意见
	       var size=nui.getbyName("bpsParam.helpActor").getValue();
	     	if(size.length<=0){
	        	alert("请选择征求意见人员");
	        	flag = false;
	        }	
		}
		
		if(operateType==5){//废弃
		     	if(!confirm("确认要废弃该流程？")){
		        	flag = false;
		        }	
			}
		
		if(operateType==6){//不同意
		       var size=nui.get("vcComments").getValue();
		     	if(size.length<=0){
		        	alert("请填写不同意的理由");
		        	flag = false;
		        }	
			}
		
		if(operateType==7){//拟同意
		       var size=nui.get("vcComments").getValue();
		     	if(size.length<=0){
		        	alert("请填写 有条件通过 的理由");
		        	flag = false;
		        }	
			}
		
		if(bpsAuth&&bpsAuth.participantAuth==1&&operateType==1){//流程参与者不为空且同意时才验证
			var size = nui.getbyName("bpsParam.selectUser").getValue();
			var participantTitle = document.getElementById("participantTitle").innerHTML;
			var isAgainFlag = size.length<=0?true:false;
	     	if(isAgainFlag){
	     		alert("请选择"+participantTitle);
	        	flag = false;
	        }
		}
		
		if(bpsAuth&&bpsAuth.ynAuth==1&&operateType==1){//流程选择不为空且同意时才验证
			var size = nui.getbyName("bpsParam.yn").getValue();
			var ynTitle = document.getElementById("ynTitle").innerHTML;
			var isYNFlag = size.length<=0?true:false;
	     	if(isYNFlag){
	        alert("请选择"+ynTitle);
	        	flag = false;
	        }
		}
		if(nui.get("sendUser")&&nui.get("sendUser").getValue()!=null&&nui.get("sendUser").getValue()!=""&&operateType==1){//选择抄送人员后验证选择抄送方法
			var size = nui.getbyName("bpsParam.sendType").getValue();
	     	if(size.length<=0){
	        alert("请选择抄送方式");
	        	flag = false;
	        }
		}
		
		return flag;
	}
	
	//废弃功能
    //将localType参数，改为pageType参数，杨志文，20161020
    function abandonPro(processInstID,pageType,parTabId){
        var isRunOper=1;
        var urlStr="com.cjhxfund.fpm.bpsExpend.abandon.checkAbandonProcessInst.biz.ext";
        var json = nui.encode({processInstID:processInstID});
        resultCheck = pm_ajax(json,urlStr,false);
        if(resultCheck!=null && resultCheck.procFlag=="Y"){
                isRunOper=0;
        }else{
           // 过虑产品名称变更子流程不能废弃
           if(resultCheck!=null && resultCheck.processType=="12"){
                isRunOper=1;
           }else{
                isRunOper=0;
           }
           
        }
        if(isRunOper==0){
	    	if(confirm("是否确定废弃该流程？")){
	    		var urlStr = "com.cjhxfund.fpm.bpsExpend.abandon.abandonProcessInstByProcessInstID.biz.ext";
	    		var json = nui.encode({processInstID:processInstID});
	    		nui.ajax({
	    			type:"post",
	    			url:urlStr,
	    			data:json,
	    			cache:false,
	    			async:false,
	    			contentType:'text/json',
	    			success:function(text){
	    				//关闭tab页面或返回我的任务
	                    removeTabOrBackMyTasks('processNew',parTabId);
	    			}
	    		});
	    	 }else{
	    		 return false;
	    	 }
	     }else{
	         nui.alert("子流程不能被废弃","提示");
	     } 
      }
	
	/*
		*流程处理公共方法
		*/
		function operateCheck(ck) {
			var operateType = ck.value;
			//清除自动设置值
			changeOperateCleanStr();
			var vcComments = nui.get("vcComments").getValue();
			commentsVal = vcComments.substring(0,2);
			 if(operateType == 1){//同意
				if(commentsVal==null || commentsVal=="退办" || commentsVal=="否决" || commentsVal=="转办" || commentsVal=="征求意见" || commentsVal=="废弃"|| commentsVal=="不同意"|| commentsVal==""){
					nui.get("vcComments").setValue("同意");
				}
				jQuery("#allot").show();
			    jQuery("#handlerActor_tr").hide();
			    jQuery("#backActivity_tr").hide();
			    jQuery("#helpActor_tr").hide();
			    
			    if(bpsAuth.participantAuth==1){
		        	jQuery("#participant_tr").show();	
		        }
		        if(bpsAuth.sendAuth==1){
		        	jQuery("#send_tr").show();	
		        }
		        if(bpsAuth.ynAuth==1){
		        	jQuery("#yn_tr").show();	
		        }
			    
			 }else if (operateType == 2){//退办
				//设置默认选中
				if(nui.get("backActivity").getValue()==null&& backActivityDefaultValue!=""){
					nui.get("backActivity").setValue(backActivityDefaultValue);
					nui.get("isReAudit").setValue("0");
				} else {
					setTimeout(loadActivities,100);	
				}
				if(commentsVal==null || commentsVal=="同意" || commentsVal=="否决" || commentsVal=="转办" || commentsVal=="征求意见" || commentsVal=="废弃"|| commentsVal=="不同意"|| commentsVal==""){ 
					//nui.get("vcComments").setValue("退办");				
					var activityinstname = nui.get("backActivity").getText();
 					var backComments = "退办：" + "\"" + activityinstname + "\"" + "环节";
	    			nui.get("vcComments").setValue(backComments);
				}
				 jQuery("#allot").hide();
		        jQuery("#backActivity_tr").show();
		        jQuery("#handlerActor_tr").hide();
		        jQuery("#helpActor_tr").hide();
		        
		        if(!bpsAuth.participantAuth){
		        	jQuery("#participant_tr").hide();	
		        }
		        if(!bpsAuth.sendAuth){
		        	jQuery("#send_tr").hide();	
		        }
		        if(!bpsAuth.ynAuth){
		        	jQuery("#yn_tr").hide();	
		        }
		        
			} else if (operateType == 3) {//转办
				if(commentsVal==null || commentsVal=="退办" || commentsVal=="同意" || commentsVal=="征求意见" || commentsVal=="废弃"|| commentsVal=="不同意"|| commentsVal==""){
					nui.get("vcComments").setValue("转办");
				}
				jQuery("#allot").hide();
			    jQuery("#handlerActor_tr").show();
			    jQuery("#backActivity_tr").hide();
			    jQuery("#helpActor_tr").hide();
			    
			    document.getElementById("handlerActorTitle").innerHTML="请选择转办人员";	
			    if(!bpsAuth.participantAuth){
		        	jQuery("#participant_tr").hide();	
		        }
		        if(!bpsAuth.sendAuth){
		        	jQuery("#send_tr").hide();	
		        }
		        if(!bpsAuth.ynAuth){
		        	jQuery("#yn_tr").hide();	
		        }
			    
			} else if (operateType == 4) {//征求意见
				if(commentsVal==null || commentsVal=="退办" || commentsVal=="转办" || commentsVal=="同意" || commentsVal=="废弃"|| commentsVal=="不同意"|| commentsVal==""){
					nui.get("vcComments").setValue("征求意见");
				}
				jQuery("#allot").hide();
			  	jQuery("#backActivity_tr").hide();
			  	jQuery("#handlerActor_tr").hide();
			  	jQuery("#helpActor_tr").show();
			  	
			  	document.getElementById("helpActorTitle").innerHTML="请选择征求意见人员";
			  	if(!bpsAuth.participantAuth){
		        	jQuery("#participant_tr").hide();	
		        }
		        if(!bpsAuth.sendAuth){
		        	jQuery("#send_tr").hide();	
		        }
		        if(!bpsAuth.ynAuth){
		        	jQuery("#yn_tr").hide();	
		        }
			  
			}else if (operateType == 5) {//废弃
				if(commentsVal==null || commentsVal=="退办" || commentsVal=="转办" || commentsVal=="征求意见" || commentsVal=="同意"|| commentsVal=="不同意"|| commentsVal==""){
					nui.get("vcComments").setValue("废弃");
				}
				jQuery("#allot").hide();
				jQuery("#handlerActor_tr").hide();
				jQuery("#backActivity_tr").hide();
				jQuery("#helpActor_tr").hide();
				
				if(!bpsAuth.participantAuth){
		        	jQuery("#participant_tr").hide();	
		        }
		        if(!bpsAuth.sendAuth){
		        	jQuery("#send_tr").hide();	
		        }
		        if(!bpsAuth.ynAuth){
		        	jQuery("#yn_tr").hide();	
		        }
				
			}else if(operateType==6){
				if(commentsVal==null || commentsVal=="同意" || commentsVal=="退办" || commentsVal=="转办" || commentsVal=="征求意见" || commentsVal=="废弃"|| commentsVal==""){
					nui.get("vcComments").setValue("不同意");
				}
				jQuery("#handlerActor_tr").hide();
			    jQuery("#backActivity_tr").hide();
			    jQuery("#helpActor_tr").hide();
			    
			    if(!bpsAuth.participantAuth){
		        	jQuery("#participant_tr").hide();	
		        }
		        if(!bpsAuth.sendAuth){
		        	jQuery("#send_tr").hide();	
		        }
		        if(!bpsAuth.ynAuth){
		        	jQuery("#yn_tr").hide();	
		        }
				
			}
			else if(operateType==9){//否决
				jQuery("#backActivity_tr").hide();
				if(commentsVal==null || commentsVal=="同意" || commentsVal=="退办" || commentsVal=="征求意见" || commentsVal=="废弃"|| commentsVal=="不同意"|| commentsVal==""){ 
					nui.get("vcComments").setValue("否决");
				}
			}
		}
		
		
       //根据分支选择框改变处理意见
		function setCommentBySelect(radioId,titleId){
			var title = $("#"+titleId).text().replace("：","");
			var newComment = "";
			var tempComment = "";
			var select = nui.get(radioId).getValue();//选择框的值（Y/N）
			var vcComments = nui.get("vcComments");//处理意见框
			var commentStr = vcComments.getValue();
			if(select=="Y"){
				newComment = title==null||title==""?"":" —— "+title.replace("是否","");
				tempComment = title==null||title==""?"":" —— "+title.replace("是否","不");
			}else if(select=="N"){
				newComment = title==null||title==""?"":" —— "+title.replace("是否","不");
				tempComment = title==null||title==""?"":" —— "+title.replace("是否","");
			}
			if(title!=null||title!=""){
				if(commentStr.indexOf(newComment)>-1) return;
				if(title.indexOf("助理协助")>-1){
					tempComment=tempComment==null||tempComment==""?"":tempComment.replace("不","无需");
					newComment=newComment==null||newComment==""?"":newComment.replace("不","无需");
				}
				if(commentStr.indexOf(tempComment)>-1) {
					var com = commentStr.replace(tempComment,newComment);
					vcComments.setValue(com);
				}else{
					var com = commentStr+newComment;
					vcComments.setValue(com);
				}
			}
		}
		//清除控制选择“评审/会签人员”时的“是否召开总办会”的自动设置值
		function cleanStr(titleId){
			var vcComments = nui.get("vcComments");//处理意见框
			var commentStr = vcComments.getValue();
			var title = $("#"+titleId).text().replace("：","");
			var yStr = title==null||title==""?"":" —— "+title.replace("是否","");
			var nStr = title==null||title==""?"":" —— "+title.replace("是否","不");
			if(commentStr.indexOf(yStr)>-1) {commentStr = commentStr.replace(yStr,"");}
			if(commentStr.indexOf(nStr)>-1) {commentStr = commentStr.replace(nStr,"");}
			vcComments.setValue(commentStr);
		}
		//改变操作时清除自动设置值
		function changeOperateCleanStr(){
			cleanStr("ynTitle");
		}
		
	  function selectEmpByFlag(e){
	  	if(selectUserFlag==1) selectSingleEmp(e);//单选
	  	else  selectMutiEmp(e);//多选
	  }
		
       //选择单人人员
      function selectSingleEmp(e){ 
               var btnEdit = this;
                nui.open({
                url: contextPath+ "/bpsExpend/empSelect/multselet_main.jsp",
                title: "员工列表",
                width: 650,
                height: 480,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var btnEditValue = btnEdit.getValue();
                    var data = [];
                    if(btnEditValue!=null&&btnEditValue!=""){
                    	var empArr = btnEditValue.split(";");
                    	if(empArr!=null&&empArr.length>0){
                    		for(var i=0;i<empArr.length;i++){
                    			var emp = empArr[i];
                    			if(emp!=null&&emp!=""){
                    				var eArr = emp.split(",");
                    				var json = {"empid":eArr[0],"username":eArr[1]};
                    				data.push(json);
                    			}
                    		}
                    		
                    	}
                    }
                    iframe.contentWindow.setData(data);
                },
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var emps = iframe.contentWindow.getData();
                        emps = nui.clone(emps);    //必须
                        if (emps&&emps.data&&emps.data.length>0) {
                            btnEdit.setValue(emps.data[0].empid+','+emps.data[0].username);
                            btnEdit.setText(emps.data[0].username);
                        }else{
                        	btnEdit.setValue("");
                            btnEdit.setText("");
                        }
                    }
                }
            });   			
      }
      
       //选择多人人员
      function selectMutiEmp(e){ 
               var btnEdit = this;
                nui.open({
                url: contextPath +"/bpsExpend/empSelect/multSeletSend.jsp",
                title: "员工列表",
                width: 650,
                height: 480,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var btnEditValue = btnEdit.getValue();
                    var data = [];
                    if(btnEditValue!=null&&btnEditValue!=""){
                    	var empArr = btnEditValue.split(";");
                    	if(empArr!=null&&empArr.length>0){
                    		for(var i=0;i<empArr.length;i++){
                    			var emp = empArr[i];
                    			if(emp!=null&&emp!=""){
                    				var eArr = emp.split(",");
                    				var json = {"empid":eArr[0],"username":eArr[1]};
                    				data.push(json);
                    			}
                    		}
                    		
                    	}
                    }
                    iframe.contentWindow.setData(data);
                },
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var emps = iframe.contentWindow.getData();
                        emps = nui.clone(emps); 
                        if (emps) {
                        	var empValue = "";
                        	 var empValueArr =	emps.value.split(",");
                             var empNameArr =	emps.name.split(","); 	
                        	for(var i=0;i<empValueArr.length;i++){
                        		if(empValueArr[i]!=""&&empValueArr[i]!="")
                        			empValue += empValueArr[i] +","+empNameArr[i];
                        		if(i<empValueArr.length-1){
                        			empValue += ";";
                        		}
                        	}
                            btnEdit.setValue(empValue);
                            btnEdit.setText(emps.name);
                        }
                    }
                }
            });   			
      }
      
      //设置默认人员
      function setDefaultEmp(){
    	  if(nui.get("empsName")&&nui.get("empsValue")){
	    	  var empsName = nui.get("empsName").getValue();
			  var empsValue  = nui.get("empsValue").getValue();
	    	  if(empsName){
	    		  var btnEdit = nui.get("selectUser");
	    		  btnEdit.setValue(empsValue);
	    		  btnEdit.setText(empsName);
	    	  }
    	  }
      }
      
      /**
  	 * 弹出提示框，在指定时间后自动消失
  	 * @params message 提示消息
  	 * @params title 提示标题，默认为"提示"
  	 * @params timeout 提示框多长时间后消失，单位毫秒，默认为500毫秒
  	 */
  	function alertTip(message, title, timeout) {
  		title = title || "提示";
  		timeout = timeout || 2000;
  		var messageid = nui.loading(message, title);
  		setTimeout(function() {
  			nui.hideMessageBox(messageid);
  		}, timeout);
  	}
  	
  	function onOperateType(e){
  		return nui.getDictText("ATS_OPERATE_TYPE", e.row.vcOperateType);
  	}  
  	
  	
    
    /*
	*调整文件的iframe窗口大小
	*/
	function setProcessFileFrmHeight(fileSize){
		document.getElementById("prodIfm").style.height = getFileFrameSize(fileSize) + "px";
	}
	
	//处理意见设值
	function cleanTheSpace(e){
		var newValue = e.value.trim();
		var thisId = e.sender.id;
		nui.get(thisId).setValue(newValue);
	}
	
	//选择抄送方式显隐模块
	function showHideSend(){
		var value = nui.get("cbl1").getValue();
		if(value&&value.indexOf("mail")>-1){//邮件模块
			$("#send_info_tr1").show();
			$("#send_info_tr2").show();
			$("#send_info_tr3").show();
		} else {
			$("#send_info_tr1").hide();
			$("#send_info_tr2").hide();
			$("#send_info_tr3").hide();
			nui.get("mailTitle").setValue("");
			nui.get("mailTo").setValue("");
			nui.get("mailCc").setValue("");
			nui.get("mailContent").setValue("");
		}
	}
	//根据有无发起流程显隐页面信息
	function showHideHtml(){
		if(!workItemID){
			$("#currentPartTR").hide();
		}
	}
	
	
	//重新设置下一参与者人员
	function reSetActor(){
		if(document.getElementById("nextActorText")!=null){
			var nextActor = document.getElementById("nextActorText").innerHTML;
			nextActor = nextActor.replaceAll("@","<br>");
			document.getElementById("nextActorText").innerHTML = nextActor;
		}
			//上一参与者
		if(document.getElementById("lastActorText")!=null){
			var nextActor = document.getElementById("lastActorText").innerHTML;
			if(nextActor.indexOf("@")!=-1){
			    nextActor = nextActor.replaceAll("@","<br>");
			}
			document.getElementById("lastActorText").innerHTML = nextActor;
		}
	}
	
	
	/*获取新增页面保存的审批意见*/
	function setApproveTemp(lTableId,vcProcessType){
		var json = nui.encode({lTableId:lTableId,vcProcessType:vcProcessType});
		var urlStr = "com.cjhxfund.fpm.bpsExpend.aprvInfo.getTempApproveInfo.biz.ext";
		nui.ajax({
			type:"post",
			url:urlStr,
			data:json,
			cache:false,
			async:false,
			contentType:'text/json',
			success:function(text){
				if(text.tempApproveInfo&&text.tempApproveInfo.vcComment){
					nui.get("vcComments").setValue(text.tempApproveInfo.vcComment);
				}
			}
		})
	}
	
	/*
	*联动常用处理意见
	*/
	function changeCommentBySelect(e) {
		//清除自动设置值
		changeOperateCleanStr();
		nui.get("vcComments").setValue(nui.get("comm_comments").getValue());
	}
	
	//增加审批语
	function addComment() {
		nui.open({
			url: contextPath+"/bpsExpend/processFunction/comment/ownSugguset.jsp",
			title: "自定义常用处理意见", width: 700, height: 500,
				onload:function(){
			},
			onload: function () {
			},
			ondestroy: function (action) {
				if (action=="ok"){
				    nui.get("comm_comments").load("com.cjhxfund.fpm.bpsExpend.comment.queryCommComments.biz.ext");
				}
			}
		});
			
	}
	
	//关闭
	function closeBiz(){
		nui.confirm("是否关闭页面？", "确定？",
            function (action) {            
                if (action == "ok") {
					window.parent.close();
                } else {
                   
                }
            }
        );
	}
	
	function numTrans(id){
 			var num = nui.get(id).getValue();
 			if(num == "" || num == null || num == undefined){}
 			else{
 				var numTrans = formatNumber(num, 4, 1);
 				nui.get(id).setValue(numTrans);
 			}
 		}
 		
 	function fixRateCheck(e){
			var reg= /^([0-9]([0-9,])*(\.[0-9]+)?)$/;
        	var value = e.sender.value;
        	if(!reg.test(value.replace(/,/g,''))){
        		e.errorText = "请输入正浮点数";
        	 	e.isValid = false;
        	 	return true;
        	}
        	
		}
 	
 	function backActivityChanged(e){
 		var activityinstname = e.selected.activityinstname;
 		var backComments = "退办：" + "\"" + activityinstname + "\"" + "环节";
	    nui.get("vcComments").setValue(backComments);
 	}
 	
</script>