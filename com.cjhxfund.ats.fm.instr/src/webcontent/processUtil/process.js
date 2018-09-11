	var msg;
	function inintProcess(type){
		//附件列表
		var file_grid = nui.get("file_grid");
		var file_Form = new nui.Form("#file_Form").getData(false,false);
		file_grid.load(file_Form);
	     
		//初始化回退环节
		loadActivities();
		//根据选项展示行权年与关联交易报备信息 
		if(type != "no"){ 
			if(resaleRight == 1){
				document.getElementById("resaleYear").style.display = "block";
			}
			if(redemptionRight == 1){
				document.getElementById("redemptionYear").style.display = "block";
			}
			if(isInquiry == 1){
				document.getElementById("associationRemark").style.display = "block";
			}
		}
	}
	
	function inintProcessView(){
		var jsonstr;
		var thisProcessInstID = processInstID;
		if(processInstID == null||processInstID==""){
			thisProcessInstID = wProcessInstID;
		}
		//审批意见
		var processGrid = nui.get("processGrid");
    	jsonstr = {processinstid:thisProcessInstID};
    	processGrid.load(jsonstr); 	
		//流程图
		var processGraphObj = nui.get("processgraph");
		processGraphObj.setProcInstID(thisProcessInstID);
		processGraphObj.load();
	}
	
	//取回退的活动实例
	function loadActivities(){
		var urlStr = contextPath + "/com.cjhxfund.ats.fm.comm.wf.getRollBackActivitys.biz.ext";
    	var json = nui.encode({processInstID:nui.get("processinstid").getValue(),workItemID:nui.get("workItemID").getValue()});
    	$.ajax({
            url:urlStr,
            data:json,
            type:'POST',
            contentType:'text/json',
            cache:false,
            success:function(d){
            	if(d && d.activitys) {
            		var data = d.activitys;
            		var backActivityCombo = nui.get("backActivity");
                	backActivityCombo.load(data);
            	}
            }
       });
	}
	
	//检查表单
	function checkForm() {
		var flag = true;
		var operateType = nui.getbyName("bpsParam.operateType").getValue();
		
		if(operateType == null){
			nui.alert("操作选项不能为空，请选择。","系统提示");
			flag = false;
		}
		
		if(operateType==2){//退办
			if(nui.get("backActivity").getValue()==null){
				nui.alert("无可退办节点","系统提示");
				flag = false;
			}
		}
		
	  	if(operateType==3){//转办
	       var size=nui.getbyName("bpsParam.handlerActor").getValue();
	     	if(size.length<=0){
	     		nui.alert("请选择转办人员","系统提示");
	       		flag = false;
	        }	
		}
		
		if(operateType==4){//征求意见
	       var size=nui.getbyName("bpsParam.handlerActor").getValue();
	     	if(size.length<=0){
	     		nui.alert("请选择征求意见人员","系统提示");
	        	flag = false;
	        }	
		}
		
		/*if(operateType==5){//否决
		     	if(!confirm("确认要否决该流程！")){
		        	flag = false;
		       }	
		}*/

		return flag;
	}
	
	
	/*
	*流程处理公共方法
	*/
	function operateCheck(ck) {
		var operateType = ck.value;
		var rollbackRemark=$("#rollbackRemark").val();
		if(operateType == 1){//同意
			nui.get("comments").setValue(ck.getSelected().text);
			jQuery("#handlerActor").hide();
			jQuery("#backActivity_tr").hide();
			jQuery("#handlerActorTitle").hide();
			if(rollbackRemark==null || rollbackRemark==""){
				jQuery("#rollBack_remark3").show();
				jQuery("#rollBack_remark4").show();
				jQuery("#rollBack_remark1").hide();
				jQuery("#rollBack_remark2").hide();
			}
		} else if (operateType == 2){//退办
			if(nui.get("backActivity").getText() == ""){
				nui.get("comments").setValue("退办");
			} else {
				nui.get("comments").setValue( "退办 : " + "'"+ nui.get("backActivity").getText() +"'环节");
			}
			jQuery("#rollBack_remark1").show();
			jQuery("#rollBack_remark2").show();
			jQuery("#rollBack_remark3").hide();
			jQuery("#rollBack_remark4").hide();
			jQuery("#backActivity_tr").show();
			jQuery("#handlerActor").hide();	
			jQuery("#handlerActorTitle").hide();
			if(document.getElementById("selectUser")!=null){
				jQuery("#selectUser").hide();	
			}
			if(document.getElementById("sendUser")!=null){
				jQuery("#sendUser").hide();	
			}
			if(document.getElementById("yn_tr")!=null){
				jQuery("#yn_tr").hide();	
			}
		} else if (operateType == 3) {//转办
			if(nui.get("handlerActor").getText() == ""){
				nui.get("comments").setValue("转办");
			} else {
				nui.get("comments").setValue("转办 : " + "'"+ nui.get("handlerActor").getText() +"'");
			}
			jQuery("#handlerActor").show();
			jQuery("#backActivity_tr").hide();
			jQuery("#handlerActorTitle").show();
			if(rollbackRemark==null || rollbackRemark==""){
				jQuery("#rollBack_remark3").show();
				jQuery("#rollBack_remark4").show();
				jQuery("#rollBack_remark1").hide();
				jQuery("#rollBack_remark2").hide();
			}
			document.getElementById("handlerActorTitle").innerHTML="请选择转办人员:";	
			if(document.getElementById("selectUser")!=null){
				jQuery("#selectUser").hide();	
			}	
			if(document.getElementById("sendUser")!=null){
				jQuery("#sendUser").hide();	
			}
			if(document.getElementById("yn_tr")!=null){
				jQuery("#yn_tr").hide();	
			}
		} else if (operateType == 4) {//征求意见
			if(nui.get("handlerActor").getText() == ""){
				nui.get("comments").setValue("征求意见");
			} else {
				nui.get("comments").setValue("征求意见 : " + "'"+ nui.get("handlerActor").getText() +"'");
			}
			jQuery("#handlerActor").show();
			jQuery("#backActivity_tr").hide();
			jQuery("#handlerActorTitle").show();
			if(rollbackRemark==null || rollbackRemark==""){
				jQuery("#rollBack_remark3").show();
				jQuery("#rollBack_remark4").show();
				jQuery("#rollBack_remark1").hide();
				jQuery("#rollBack_remark2").hide();
			}
			document.getElementById("handlerActorTitle").innerHTML="请选择征求意见人员:";
			if(document.getElementById("selectUser")!=null){
				jQuery("#selectUser").hide();	
			}
			if(document.getElementById("sendUser")!=null){
				jQuery("#sendUser").hide();	
			}
			if(document.getElementById("yn_tr")!=null){
				jQuery("#yn_tr").hide();	
			}
		} else if (operateType == 5) {//否决
			nui.get("comments").setValue("否决");
			jQuery("#handlerActor").hide();
			jQuery("#backActivity_tr").hide();
			jQuery("#handlerActorTitle").hide();
			if(rollbackRemark==null || rollbackRemark==""){
				jQuery("#rollBack_remark3").show();
				jQuery("#rollBack_remark4").show();
				jQuery("#rollBack_remark1").hide();
				jQuery("#rollBack_remark2").hide();
			}
			if(document.getElementById("selectUser")!=null){
				jQuery("#selectUser").hide();	
			}
			if(document.getElementById("sendUser")!=null){
				jQuery("#sendUser").hide();	
			}
			if(document.getElementById("yn_tr")!=null){
				jQuery("#yn_tr").hide();	
			}
		}
	}

	//选择人员
	function selectActor(e){ 
		var btnEdit = this;
		nui.open({
			url:  contextPath + "/fm/comm/util/multselet_main.jsp",
			title: "员工列表",
			width: 650,
			height: 480,
			ondestroy: function (action) {
				if(action == "ok") {
					var iframe = this.getIFrameEl();
					var emps = iframe.contentWindow.getData();
					emps = nui.clone(emps);    //必须
					if (emps) {
						btnEdit.setValue(emps.value+','+emps.name);
						btnEdit.setText(emps.name);
						var comments = nui.get("comments").getValue();
						nui.get("comments").setValue(comments.split(":")[0] + " : " + "'"+ emps.name +"'");
					}
				}
			}
		});   			
	}
      
	//选择抄送人员
	function selectSendUser(e){ 
		var btnEdit = this;
		nui.open({
			url: contextPath + "/fm/comm/util/multselet_main.jsp",
			title: "员工列表",
			width: 650,
			height: 480,
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
  		return nui.getDictText("PM_FLOW_OPERATE_TWO", e.row.operateType);
  	}  
         //返回我的代办页面
    function backSubmit(){
       	window.location.href="<%=request.getContextPath()%>/bps/wfclient/common/fpmMyTasks.jsp";
    }
    
	//获取子页面的fileid字符串
    function getProcessFileIds(){
    	var iframe = document.getElementById("processIframe").contentWindow;
    	var fileIds = iframe.getFileIds();
    	return fileIds;
    }
    
    //批量下载附件
    function fileDownload(){
    	var  datas = nui.get("employee_grid").getSelecteds();
    	var sysId = "";
    	for(var i = 0;i < datas.length;i++){
    		if(sysId == ""){
    			sysId = datas[i].lAttachId;
    		}else{
    			sysId = sysId + "," +datas[i].lAttachId;
    		}
    	nui.get("sysid").setValue(sysId);	
      }
    	if(sysId == ""){
    		nui.alert("请选择要下载的附件","系统提示");
    		return;
    	}
    	nui.confirm("确认要下载吗？","系统提示",function(action){
			if(action=="ok"){
				//nui.get("fileDownload").disable();//禁用“导出”按钮
				var form = document.getElementById("file_download");
				form.action = "com.cjhxfund.ats.fm.comm.fileDownload.flow";
		        form.submit();
		        //setTimeout("enableExportFun1()",15000);//启用“导出”按钮
			}
		});
    }
    
	//附件列表批量下载附件
	function fileDownload1(){
		var  datas = nui.get("file_grid").getSelecteds();   //获取选中的附件信息
    	
    	//组装附件编号
    	var sysId = "";
    	for(var i = 0;i < datas.length;i++){
    		if(sysId == ""){
    			sysId = datas[i].lAttachId;
    		}else{
    			sysId = sysId + "," +datas[i].lAttachId;
    		}
    	  nui.get("sysid").setValue(sysId);	
    	}
    	
    	if(sysId == ""){
    		nui.alert("请选择要下载的附件","系统提示");
    		return;
    	}
    	//下载附件
    	nui.confirm("确认要下载吗？","系统提示",function(action){
			if(action=="ok"){
				//nui.get("fileDownload").disable();//禁用“导出”按钮
				var form = document.getElementById("file_download");
				form.action = "com.cjhxfund.ats.fm.comm.fileDownload.flow";
		        form.submit();
		        //setTimeout("enableExportFun1()",15000);//启用“导出”按钮
			}
		});
    }
    
    //申购审批页word文档下载
    function wordDownload(){
    	var bizId = nui.get("lBizId").getValue();
    	nui.get("bizId").setValue(bizId);
    	if(activityDefID == "ATS_FM_CZ_ZBQR" || activityDefID == "ATS_FM_CZ_ZBFH" || activityDefID == "ATS_FM_CZ_XYFH1" || activityDefID == "ATS_FM_CZ_XYFH2" || activityDefID == "ATS_FM_CZ_XYYY1" || activityDefID == "ATS_FM_CZ_XYYY2" 
    		|| activityDefID == "ATS_FM_CZ_SCXY" || activityDefID == "ATS_FM_CZ_ZJQS" || activityDefID == "ATS_FM_CZ_SFFXYYY" || activityDefID == "ATS_FM_CZ_JYYFH2" || activityDefID == "ATS_FM_CZ_FXYYY"){
	    	nui.get("modeRepayment").setValue((undefined==typeof(nui.get("vcModeRepayment")))? "" :nui.get("vcModeRepayment").getValue());
	    	nui.get("deadlineInterest").setValue((undefined==typeof(nui.get("lEndincalDate")))? "" :nui.get("lEndincalDate").getValue());
	    	nui.get("couponRate").setValue((undefined==typeof(nui.get("enCouponRate")))? "" :nui.get("enCouponRate").getValue());
	    	nui.get("issuePrice").setValue((undefined==typeof(nui.get("enBallotPrice")))? "" :nui.get("enBallotPrice").getValue());
	    	nui.get("lBegincalDate1").setValue((undefined==typeof(nui.get("lBegincalDate")))? "" :nui.get("lBegincalDate").getValue());
    	}else{
    		nui.get("type").setValue(1);
    	}
    	//下载附件
    	nui.confirm("确认要下载吗？","系统提示",function(action){
			if(action=="ok"){
				var form = document.getElementById("word_download");
				form.action = "com.cjhxfund.foundation.task.wordDownload.flow";
		        form.submit();
			}
		});
    }
    //缴款审批页word文档下载
    function wordDownloadPayMent(){
    	var bizId = nui.get("lBizId").getValue();
    	nui.get("bizId").setValue(bizId);
    	nui.get("modeRepayment").setValue((undefined==typeof(nui.get("vcModeRepayment")))? "" :nui.get("vcModeRepayment").getValue());
    	nui.get("deadlineInterest").setValue((undefined==typeof(nui.get("lEndincalDate")))? "" :nui.get("lEndincalDate").getValue());
    	nui.get("couponRate").setValue((undefined==typeof(nui.get("enCouponRate")))? "" :nui.get("enCouponRate").getValue());
    	nui.get("issuePrice").setValue((undefined==typeof(nui.get("enBallotPrice")))? "" :nui.get("enBallotPrice").getValue());
    	nui.get("lBegincalDate1").setValue((undefined==typeof(nui.get("lBegincalDate")))? "" :nui.get("lBegincalDate").getValue());
    	//下载附件
    	nui.confirm("确认要下载吗？","系统提示",function(action){
			if(action=="ok"){
				var form = document.getElementById("word_download");
				form.action = "com.cjhxfund.foundation.task.wordDownload.flow";
		        form.submit();
			}
		});
    }
    
    //附件删除后重新加载附件列表
    function loademployeeGrid(gridName,fileName){
        //附件列表
	     var file_grid = nui.get(gridName);
	     var file_Form = new nui.Form("#file_Form").getData(false,false);
	     file_grid.load(file_Form);
     }
      
  //关闭窗口
    function CloseWindow(action) {
       if (window.CloseOwnerWindow)
          return window.CloseOwnerWindow(action);
       else window.close();
    }
    
    /**
     * 计算金额加入千分位
     */
   //发行规模(万元)
	function issueSizeFun(){
	   formatNumberCommon("issueSize",0);
	}
	
	//已投资该发行主体证券存量(万元)
	function categoryMoneyFun(){
	   formatNumberCommon("categorymoney",0);
	}
	
	//产品净值规模
	function netWorthScaleFun(){
	  formatNumberCommon("netWorthScale",0);
	}
	
	// 产品净值规模(万元)
    function netWorthScaleFun(){
        formatNumberCommon("netWorthScale",0);
    }
    //空判定
    if("undefined" != typeof file_grid){
	    //在线打开用印文档
	    file_grid.on("rowdblclick", function (e) {
	    	var type = 0;
	    	if(activityDefID == "ATS_FM_TBYY" || activityDefID == "ATS_FM_CZ_XYYY1" || activityDefID == "ATS_FM_CZ_XYYY2" || activityDefID == "ATS_FM_CZ_FXYYY" || activityDefID == "ATS_FM_XYYY1" || activityDefID == "ATS_FM_XYYY2" || activityDefID == "ATS_FM_FXYYY"){
	    		type = 1;
	    	}
	    	var record = e.record;
	    	var vcProductCode = nui.get("vcProductCode").getValue(); //产品编号
	    	var lBizId = nui.get("lBizId").getValue();  //业务ID
	    	var actionURL = contextPath + "/commonUtil/iWebOffice/Judgment_document_type.jsp?sysid="+record.lAttachId+"&fileName="+record.vcAttachName+"&type="+type+"&vcProductCode="+vcProductCode+"&bizId="+lBizId; //目标页面
	    	
			var tabs = nui.get("tabs"); 
			
			//add tab 
	        var tab = {title: record.vcAttachName,url:actionURL,showCloseButton:true};
	        tab = tabs.addTab(tab);            
	
	        //active tab  
	        tabs.activeTab(tab);
		});	
    }
   
    //打印功能
    function Print(){
    	/*var winFrm=document.PrintForm;
		winFrm.action=contextPath + "/com.cjhxfund.jy.process.FirstGradeBond.FirstGradeBond_print.flow";
		var newwin = window.open('about:blank', 'newWindow');
		winFrm.target = 'newWindow';//这一句是关键
		winFrm.submit();*/
    	var processinstid = nui.get("processinstid").getValue();
    	var workItemName = nui.get("workItemName").getValue();
    	window.open("com.cjhxfund.ats.fm.instr.FirstGradeBond_print.flow?processinstid="+processinstid+"&workItemName="+workItemName);
    }
    
    function commonLoading(msg,title){
    	return nui.loading(msg,title);
    }

    function commonHideMessageBox(messageid){
    	 nui.hideMessageBox(messageid);
    }
    
    //判断数据是否回撤
    function retracementJudgment(){
    	
    }
    
    function myBrowser(){
	    var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
	    var isOpera = userAgent.indexOf("Opera") > -1;
	    if (isOpera) {   	 //判断是否Opera浏览器
	        return "Opera";
	    };
	    if (userAgent.indexOf("Firefox") > -1) { //判断是否Firefox浏览器
	        return "FF";
	    } 
	    if (userAgent.indexOf("Chrome") > -1){
	    	return "Chrome";
	    }
	    if (userAgent.indexOf("Safari") > -1) { //判断是否Safari浏览器
	        return "Safari";
	    } 
	    if (userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera) {	//判断是否IE浏览器
	        return "IE";
	    }; 
	}
    
    
    /**风控管理开始**/
    var applyInstRiskParam;
	var riskFlagRiskParam;
	var lResultIdRiskParam;
	var lRiskmgrIdRiskParam;
	var dataRiskParam;
	var urlStrRiskParam;
	function subData(riskReturn){
    	var riskFlag = showRiskInfoApplyStock(riskReturn, applyInstRiskParam);
    	riskControl(riskFlag);
    }
    function riskControl(riskFlag, lResultId, lRiskmgrId){
    	riskFlagRiskParam = riskFlag;
    	lResultIdRiskParam = lResultId;
    	lRiskmgrIdRiskParam = lRiskmgrId;
    	if(riskFlag=='-1'){
    		return;
    	}else if(riskFlag=='1' || riskFlag=='2'){
    		applySubmitRisk();
    	}
    }
    function applySubmitRiskFinish(){
    	
    	var vcProcessType = nui.get("processType").getValue();
    	
    	var  cApplyInstType="";
    	if(vcProcessType=="1" ||vcProcessType=="5"){
    		cApplyInstType= "F1";
     	}else if(vcProcessType=="8"){
     		cApplyInstType= "F2";
     	} 
    	
    	if(riskFlagRiskParam=='2'){
    		startRiskProcessInstruct(lResultIdRiskParam, lRiskmgrIdRiskParam, "1",cApplyInstType);
    	}
    	try{
			if (!!window.ActiveXObject || "ActiveXObject" in window){//如果是IE浏览器
              	 window.opener.history.go(0);
              }else{
              	 window.opener.reloadData();
              }

		}catch(e){
		}
		//返回我的代办任务页面
		CloseWindow("confirmSuccess");
    }
    
    function applySubmitRisk(){
    
    	var workItemID = nui.get("workItemID").getValue();
    	var vcProcessType = nui.get("processType").getValue();
    	
    	var workJson = nui.encode({workItemID:workItemID});
    	$.ajax({
    		url:"com.cjhxfund.ats.fm.comm.wf.checkValue.biz.ext",
    		type:'POST',
    		data:workJson,
    		cache:false,
    		contentType:'text/json',
    		success:function(text){
    			var returnJson = nui.decode(text);
    			if(returnJson.returnValue == true){
			    	msg = commonLoading("流程正在处理。","系统提示");
			    	var json = nui.encode(dataRiskParam);
			    	$.ajax({
			    		url:urlStrRiskParam,
			    		type:'POST',
			    		data:json,
			    		cache:false,
			    		contentType:'text/json',
			    		success:function(text){
			    			var returnJson = nui.decode(text);
			    			commonHideMessageBox(msg);
			    			//当环节为中标复核时，判断Fix返回状态是否为undefined
			    			if(activityDefID == "ATS_FM_CZ_ZBFH"){
				    			if(returnJson.isSuccess == undefined && returnJson.returnValue == undefined){
				    				nui.alert("流程提交失败，返回结果异常。请联系管理员。","系统提示");
				    				return;
				    			}
			    			}
			    			if(returnJson.exception == null && (returnJson.returnValue == "yes" || returnJson.isSuccess == "3")){
			    				nui.alert("流程提交成功","系统提示",function(action){
			    					applySubmitRiskFinish();
			    				});     
			    			}else if(returnJson.exception == null && returnJson.returnValue == "subProEnd"){
			    				nui.alert("流程提交成功,主流程已恢复。","系统提示",function(action){
			    					applySubmitRiskFinish();
			    				}); 
			    			}else if(returnJson.returnValue == "no"){
			    					nui.alert("流程提交失败。", "系统提示", function(action){});
			    			}else{
			    				if(activityDefID == "ATS_FM_CZ_ZBFH"){
				    				if(returnJson.isSuccess == "4"){
				    	            	nui.alert(returnJson.failReason == null ? returnJson.text : returnJson.failReason,"系统提示",function(){});
				    	            }
			    				}
			    				if(returnJson.isSuccess == "2"){
			    					if(i == 0){
			    						nui.alert("还没有获取fix指令状态返回，请稍后再提交。","系统提示",function(action){
			    							i++;
			    						});
			    					}
			    					if(i >= 1){
				    					nui.confirm("没有获取到fix指令状态，是否要强制扭转到下一环节。","系统提示",function(action){
				    						if(action == "ok"){
				    							urlStr = contextPath + "/com.cjhxfund.ats.fm.instr.FirstGradeBond.firstGradeBondHandle.biz.ext";
				    							saveDataBackup(dataRiskParam, urlStrRiskParam);
				    						}else{
				    							return;
				    						}
				    					});
			    					}
			    				}else if(returnJson.isSuccess == "5"){
			    					nui.alert("发送Fix指令异常，请联系管理员。","系统提示");
			    					return;
			    				}
			    			}
			    			
			    		}
			    	});
    			}else{
    				if(returnJson.currentState == 8){
    					nui.alert("当前流程节点状态已挂起并在修改报量，不能提交。","系统提示");
    				}else{
    					nui.alert("待办任务已经被处理，无需再次处理。","系统提示");
    				}	
    				return;
    			}
    		}
    	});
    }
    /**风控管理结束**/
    
    var i = 0;
    function saveData(data,urlStr){
    	
    
    	debugger;
    	/**风控管理开始**/
    	dataRiskParam = data;
    	urlStrRiskParam = urlStr;
		if((data.applyInst.vcProcessType!=5 && data.bpsParam.activityDefID=="ATS_FM_TGFH")	//有债申购-投顾复核节点
				|| (data.applyInst.vcProcessType==5 && data.bpsParam.activityDefID=="ATS_FM_XXHD2")	//无债申购-交易员2节点
				|| (data.bpsParam.activityDefID=='ATS_FM_TBYY')){	//投标确认
			data.applyInst.vcCombiCode = data.applyInst.vcCombiNo;
			if(judgeRiskTest(null, data.applyInst)){	//判断是否接入风控管理	
				//序列化成JSON
				applyInstRiskParam = data.applyInst;
				//判断是否已经发起（获得风控信息）
				var riskInfo = getRiskInfo(applyInstRiskParam.lApplyInstId);
				if(data.bpsParam.activityDefID=="ATS_FM_XXHD2"){	//投标确认
					if(riskInfo!=null && riskInfo.cStatus!='2'){
						nui.alert("风控流程审批未通过，暂不能提交！");
						return;
					}else{
						applySubmitRisk();
					}
				}else if(riskInfo==null || riskInfo.cStatus=='0'){
					//校验风控
					var riskJson = mini.encode({applyInst:applyInstRiskParam}); 
					checkRiskInfoApplyStock(riskJson);
				}else if(riskInfo.cStatus=='2'){
					//风控审批通过，提交流程
					applySubmitRisk();
				}else{
					nui.confirm("风控流程未审批完成，是否继续提交？","系统提示",function(action){
						if(action=="ok"){
							applySubmitRisk();
						}
					});
				}
				return;
			}
		}
		if(data.bpsParam.activityDefID=='ATS_FM_TBYY'){
			
		}
		/**风控管理结束**/
		
		applySubmitRisk();
    	
	}
    
    
    //给出提示后，再次提交方法
    function saveDataBackup(data,urlStr){
    	msg = commonLoading("流程正在处理。","系统提示");
    	var json = nui.encode(data);

    	$.ajax({
    		url:urlStr,
    		type:'POST',
    		data:json,
    		cache:false,
    		contentType:'text/json',
    		success:function(text){
    			var returnJson = nui.decode(text);
    			commonHideMessageBox(msg);
    			if(returnJson.exception == null && (returnJson.returnValue == "yes" || returnJson.isSuccess == "3")){
    				nui.alert("流程提交成功","系统提示",function(action){
    					 if (!!window.ActiveXObject || "ActiveXObject" in window){//如果是IE浏览器
			              	 window.opener.history.go(0);
			              }else{
			              	 window.opener.reloadData();
			              }
    					//返回我的代办任务页面
    					CloseWindow("confirmSuccess");
    				});     
    			}else if(returnJson.returnValue == "no"){
    					nui.alert("流程提交失败。", "系统提示", function(action){});
    			}
    		}
    	});
    }
    
    
    function saveDataZBQR(data,urlStr){
    	var workItemID = nui.get("workItemID").getValue();
    	var workJson = nui.encode({workItemID:workItemID});
    	$.ajax({
    		url:"com.cjhxfund.ats.fm.comm.wf.checkValue.biz.ext",
    		type:'POST',
    		data:workJson,
    		cache:false,
    		contentType:'text/json',
    		success:function(text){
    			var returnJson = nui.decode(text);
    			if(returnJson.returnValue == true){
			    	msg = commonLoading("流程正在处理。","系统提示");
			    	var json = nui.encode(data);
			    	$.ajax({
			    		url:urlStr,
			    		type:'POST',
			    		data:json,
			    		cache:false,
			    		contentType:'text/json',
			    		success:function(text){
			    			var returnJson = nui.decode(text);
			    			commonHideMessageBox(msg);
			    			if(returnJson.returnValue == "yes" && returnJson.updateStatus == 1){
			    				nui.alert("流程提交成功","系统提示",function(action){
			    					 if (!!window.ActiveXObject || "ActiveXObject" in window){//如果是IE浏览器
						              	 window.opener.history.go(0);
						              }else{
						              	 window.opener.reloadData();
						              }
			    					//返回我的代办任务页面
			    					CloseWindow("confirmSuccess");
			    				});     
			    			}else if(returnJson.returnValue == "yes" && returnJson.updateStatus == 2){
			    			   nui.alert("报价修改子流程审批不通过并且缴款面值大于投标金额,不能提交流程。","系统提示",function(action){});
			    			}else if(returnJson.returnValue == "yes" && returnJson.updateStatus == 3){
			    			   nui.alert("报价修改子流程审批不通过并且票面利率大于投标利率,不能提交流程。","系统提示",function(action){});
			    			}else if(returnJson.returnValue == "yes" && returnJson.updateStatus == 4){
			    			   nui.alert("报价修改子流程正在审核中,不能提交流程。","系统提示",function(action){});
			    			}else if(returnJson.returnValue == "no"){
			    				nui.alert("流程提交失败。", "系统提示", function(action){});
			    			}
			    		}
			    	});
    			}else{
    				if(returnJson.currentState == 8){
    					nui.alert("当前流程节点状态已挂起并在修改报量，不能提交。","系统提示");
    				}else{
    					nui.alert("待办任务已经被处理，无需再次处理。","系统提示");
    				}	
    				return;
    			}
    		}
    	});
	}
    
	//获取选中的附件信息
    function FileSelecteds(gridName){
    	var  datas = nui.get("file_grid").getSelecteds();   //获取选中的附件信息
    	//组装附件编号
    	var sysId = "";
    	for(var i = 0;i < datas.length;i++){
    		if(sysId == ""){
    			sysId = datas[i].lAttachId;
    		}else{
    			sysId = sysId + "," +datas[i].lAttachId;
    		}
    	}
    	return sysId;
    }
    
    //发送传真
    function sendFaxes(){
    	var form = new nui.Form("#dataform1");   //获取表单对象
        //获取流程ID与业务ID
        var bizId = nui.get("lBizId").getValue();
        var processinstid = nui.get("processinstid").getValue();
        var  workItemID = nui.get("workItemID").getValue();
        //判断主题是否为空
        /*var theme = nui.get("theme").getValue();
        if(theme == ""){
        	nui.alert("传真主题不能为空,请重新输入.","系统提示");
        	return;
        }*/
        var bpsP=form.getData(false,true).bpsParam;
        bpsP.FaxNumber=nui.get("FaxNumber").getText();
        if(bpsP.FaxNumber=="" || bpsP.FaxNumber==null){
        	nui.alert("传真号码不能为空！","系统提示");
			return;
        }
        //设置校验规则
        var FaxNumber =nui.get("FaxNumber").getText().split(",");
    	var checkFax = /^((\d{3,4}-)?\d{7,8})(\d{7,8})?$/;
    	for(var i=0;i<FaxNumber.length;i++ ){
    	    if(!checkFax.test(FaxNumber[i])){
				nui.alert("传真格式为:XXX-12345678或XXXX-1234567或XXXX-12345678或12345678,多个传真号时，用英文逗号分隔","系统提示");
				return;
		     }
    	} 
		/*//判断接收人姓名是否为空
		var recvName = nui.get("recvName").getValue();
		if(recvName == ""){
			nui.alert("接收人姓名不能为空,请重新输入.");
			return;
		}*/
        
        //获取选中的附件信息
        var sysId = FileSelecteds();
        if(sysId == ""){
        	nui.alert("传真附件不能为空，请勾选需要传真的附件。","系统提示");
        	return;
        }
        
        var data = {bpsParam:bpsP,bizId:bizId,processinstid:processinstid,sysId:sysId,workItemID:workItemID};
        
        var json = nui.encode(data);
    	$.ajax({
    		url:"com.cjhxfund.ats.fm.comm.atsEastFaxBiz.sendFaxs.biz.ext",
    		type:'POST',
    		data:json,
    		cache:false,
    		contentType:'text/json',
    		success:function(text){
    			var returnJson = nui.decode(text);
    			if(returnJson.exception == null && returnJson.returnValue != "no"){
    				nui.alert("传真已发送，结果待确认","系统提示",function(action){});
	                 
    			}else{
    				nui.alert("传真发送失败。", "系统提示", function(action){});
    			}
    		}
    	});
    }
    
    
    function editorFile(){
    	var file_grid = nui.get("file_grid");    //获取附件列表对象
    	var rows = file_grid.getSelecteds();     //获取选中的记录
    	var type = 3;  //文档编辑类型
    	var vcProductCode = nui.get("vcProductCode").getValue(); //产品编号
    	var lBizId = nui.get("lBizId").getValue();  //业务ID
    	if(rows.length == 0){
    		nui.alert("请选择附件信息。","系统管理");
    		return;
    	}
    	for(var i = 0;i<rows.length;i++){
    		//encodeURI 可解决IE的url中文乱码问题
	    	var actionURL = encodeURI(contextPath + "/commonUtil/iWebOffice/Judgment_document_type.jsp?sysid="+rows[i].lAttachId+"&fileName="+rows[i].vcAttachName+"&type="+type+"&vcProductCode="+vcProductCode+"&bizId="+lBizId); //目标页面
	    	
			var tabs = nui.get("tabs"); 
			
			//add tab 
	        var tab = {title: rows[i].vcAttachName,url:actionURL,showCloseButton:true};
	        tab = tabs.addTab(tab);            
	
	        //active tab  
	        tabs.activeTab(tab);
    	}     
    }
    
    /** 
	* 将数值四舍五入后自动增加千分位. ----所有业务通用
	* @param cmpId 控件ID
	* @param cent 要保留的小数位(Number) 
	* @param isThousand 是否需要千分位 0:不需要,1:需要(数值类型); 
	* @return 格式的字符串,如'1,234,567.45' 
	* @type String 
	*/
	function formatNumberCommon(cmpId, cent, isThousand){
		try{
			cent = (cent==null||cent=="")&&cent!="0"?4:cent;//默认保留4位小数
			isThousand = isThousand==null||isThousand==""?1:isThousand;//默认需要千分位
			var oldVal = nui.get(cmpId).getValue();
			if(oldVal!=null && oldVal!=""){
				var newVal = formatNumber(oldVal,cent,isThousand);
				nui.get(cmpId).setValue(newVal);
			}
		}catch (e) {
			// TODO: handle exception
		}
	}
	
	/**
	    * 将数值四舍五入后格式化. 
	    * @param num 数值(Number或者String) 
	    * @param cent 要保留的小数位(Number) 
	    * @param isThousand 是否需要千分位 0:不需要,1:需要(数值类型); 
	    * @return 格式的字符串,如'1,234,567.45' 
	    * @type String 
	    * @author huangmizhi
	    */
	    function formatNumber(num,cent,isThousand) {
	    	num=num==null?"":num;
		    num = num.toString().replace(/\$|\,/g,'');
		    
		    // 检查传入数值为数值类型
		    if(isNaN(num))
		    num = "0";
		
		    // 获取符号(正/负数)  
		    sign = (num == (num = Math.abs(num)));
		
		    num = Math.floor(num*Math.pow(10,cent)+0.50000000001);  // 把指定的小数位先转换成整数.多余的小数位四舍五入
		    cents = num%Math.pow(10,cent);              // 求出小数位数值
		    num = Math.floor(num/Math.pow(10,cent)).toString();   // 求出整数位数值
		    cents = cents.toString();               // 把小数位转换成字符串,以便求小数位长度
		
		    // 补足小数位到指定的位数
		    while(cents.length<cent)
		    	cents = "0" + cents;
		
		    if(isThousand) {
		    // 对整数部分进行千分位格式化.
		    	for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
		    		num = num.substring(0,num.length-(4*i+3))+','+ num.substring(num.length-(4*i+3));  
		    }  
		
		    if (cent > 0)
		    	return (((sign)?'':'-') + num + '.' + cents);  
		    else
		    	return (((sign)?'':'-') + num);
	    }
	    
	
	//刷新附件列表
	function refreshFile(){
		//附件列表
		var file_grid = nui.get("file_grid");
		var file_Form = new nui.Form("#file_Form").getData(false,false);
		file_grid.load(file_Form);
	}
	//校验邮箱
	function checkEmail(str){
	    var re = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;;
	    if(re.test(str)){
	        return true;
	    }else{
	    	return false;
	    }
	}
	//获取选中的附件名称
    function FileSelectedsColumn(){
    	var  datas = nui.get("file_grid").getSelecteds();   //获取选中的附件信息
    	//组装附件名称
    	var sysId = "";
    	var vcAttachName= "";
    	var vcAttachAdd= "";
    	var lAttachId= "";
    	for(var i = 0;i < datas.length;i++){
    		if(i==0){
    			vcAttachName = datas[i].vcAttachName;//附件名称
    			vcAttachAdd = datas[i].vcAttachAdd;//附件路径
    			lAttachId = datas[i].lAttachId;//附件id
    		}else{
    			vcAttachName += "," +datas[i].vcAttachName;//附件名称
    			vcAttachAdd += "," +datas[i].vcAttachAdd;//附件路径
    			lAttachId += "," +datas[i].lAttachId;//附件id
    		}
    	}
    	//组装返回数据
    	sysId={'vcAttachName':vcAttachName,'vcAttachAdd':vcAttachAdd,'lAttachId':lAttachId};
    	return sysId;
    }
	//file_grid
	//发送邮件
	function sendmain(){
		nui.get("mailTo").setValue($.trim(nui.get("mailTo").getValue()));//去空格处理
	    nui.get("mailCc").setValue($.trim(nui.get("mailCc").getValue()));//去空格处理
		var emailAddress=nui.get("mailTo").getValue()+";"+nui.get("mailCc").getValue();//邮件收件人
		var emails = emailAddress.split(";");
		if(emailAddress==";" || emails.length<0){
			nui.alert("邮件不能为空，请确认.","系统提示");
			return;
		}
		for(var i=0;i<emails.length;i++){
			//校验邮箱地址
			if(emails[i]!="" && checkEmail(emails[i])==false){
				nui.alert("邮件格式不正确，请确认.","系统提示");
				return;
			}
		}
		var title = nui.get("title").getValue();//邮件主题
		var mailTo = nui.get("mailTo").getValue();
		var mailCc = nui.get("mailCc").getValue();
		var mailContext = nui.get("mailContext").getValue();
		//获取选中的附件信息
        var mailInfo = FileSelectedsColumn();
        var vcAttachNames = mailInfo.vcAttachName;//附件名称
        var vcAttachAdds = mailInfo.vcAttachAdd;//附件路径
        var lAttachId = mailInfo.lAttachId;//附件id
        
        if(vcAttachNames == "" || vcAttachAdds == "" || lAttachId==""){
        	nui.alert("邮件附件不能为空，请勾选需要传真的附件。","系统提示");
        	return;
        }
        var sendmail={vcTitle:title,
        			vcMailTo:mailTo,
			        vcMailCc:mailCc,
			        vcMailContext:mailContext,
			        lAttachId:lAttachId,
			        vcAttachFilePath:vcAttachAdds,
			        vcAttachFileName:vcAttachNames,
			        lBizId:nui.get("lBizId").getValue(),
			        lProcessInstId:nui.get("processinstid").getValue()};
             
        //发送邮件
		var json = nui.encode({sendmail:sendmail,mailContext:mailContext,title:title,mailTo:mailTo,mailCc:mailCc,vcAttachNames:vcAttachNames.split(","),vcAttachAdds:vcAttachAdds.split(",")});
    	$.ajax({
    		url:"com.cjhxfund.ats.fm.instr.FirstGradeBond.sendMail.biz.ext",
    		type:'POST',
    		data:json,
    		cache:false,
    		contentType:'text/json',
    		success:function(text){
    			var returnJson = nui.decode(text);
    			if(returnJson.exception == null && returnJson.returnValue != "no"){
    				nui.alert("邮件已发送。","系统提示",function(action){});
	                 
    			}else{
    				nui.alert("邮件发送失败。", "系统提示", function(action){});
    			}
    		}
    	});
	}
	
	
	function onAddClick(){
  	var url = "<%= request.getContextPath() %>/fm/baseinfo/issuerInfo/addIssuerInfo.jsp";
		var title = "新增发行主体";
		var width = "400";
		var height = "300";
		nui.open({
			url: url,
			title: title, width: width, height: height,
			onload: function () {//弹出页面加载完成
				
			},
			ondestroy: function (action) {//弹出页面关闭前,把新增的主体简称返回赋值给查询框
				keyText.setValue(action);
				onSearchClick();
			}
		});
  }
	
	//下单添加Fix
	function place(){
		form.loading();//加遮罩
		//当环节为投标复核时调用Fix接口向O32下达新增指令
		urlStr = contextPath + "/com.cjhxfund.ats.fm.instr.FirstGradeBond.addFix.biz.ext";
		//组装参数		
		data = {
			workItemID:nui.get("workItemID").getValue(),
			pmprcaprvinfo:form.getData(false,true).pmprcaprvinfo,
			bpsParam:form.getData(false,true).bpsParam,
			applyInst:form.getData(false,true).firstGradeBond
		};
				
		var lInvestNo = nui.get("lInvestNo").getValue();
		var lBizId = nui.get("lBizId").getValue();
		var dPaymentDate=nui.get("dPaymentDate").getValue();
		if(dPaymentDate=="" || dPaymentDate==null){
			nui.alert("缴款日期为空，请填写!");
    		return;
		}
		var json = nui.encode({lInvestNo:lInvestNo,lBizId:lBizId});
		//查询当前Fix指令状态
		$.ajax({
			url:"com.cjhxfund.ats.fm.instr.FirstGradeBond.getFixState.biz.ext",
			type:'POST',
			data:json,
			cache:false,
			contentType:'text/json',
			success:function(text){
				var myDate = (new Date());//获取当前日期
				//缴款时间比较采用当前用户填写的 - 20171214 蒋芳怡然确认
		    	//var date1=text.applyInst.dPaymentDate.split(" ")[0];//获取缴款日
				var date1 = dPaymentDate.split(" ")[0];//获取缴款日
		    	if(date1 == null || date1 == ""){
		    		nui.alert("缴款日期格式异常，请重新规范填写!");
		    		return;
		    	}
		    	if(myDate.getDate() != date1.split("-")[2] || myDate.getFullYear() != date1.split("-")[0] || myDate.getMonth()+1 != date1.split("-")[1]){
		    		form.unmask();//取消遮罩
		    		nui.alert("当前日期不是该债券的缴款日，不能推送到O32!");
		    		return;
		    	}
		    	
				if(text.applyInst.lFixValidStatus == 3){
					form.unmask();//取消遮罩
					nui.confirm("Fix指令下达成功，是否继续下达修改指令?","系统提示",function(action){
						if(action == "ok"){
							SaveDataPlace(data,urlStr);
						}
					});
				}else if(text.applyInst.lFixValidStatus == 2){
					form.unmask();//取消遮罩
					nui.confirm("Fix指令下达未拿到反馈信息，是否继续下达指令?","系统提示",function(action){
						if(action == "ok"){
							SaveDataPlace(data,urlStr);
					    }
					});
				}else{
					SaveDataPlace(data,urlStr);
				}	
			}				
		});
	 }
	
	//流程Fix下单功能开发
    function SaveDataPlace(data,urlStr){
    	msg = commonLoading("正在下单至O32。","系统提示");
    	var json = nui.encode(data);
    	$.ajax({
    		url:urlStr,
    		type:'POST',
    		data:json,
    		cache:false,
    		contentType:'text/json',
    		success:function(text){
    			var returnJson = nui.decode(text);
    			commonHideMessageBox(msg);
    			if(returnJson.isSuccess == "4"){
    				form.unmask();//取消遮罩
    	            nui.alert(returnJson.failReason == null ? returnJson.text : returnJson.failReason,"系统提示",function(){});
    	        }else if(returnJson.isSuccess == "2"){
					if(i == 0){
						form.unmask();//取消遮罩
						nui.alert("还没有获取fix指令状态返回，请稍后再提交。","系统提示",function(action){
							i++;
						});
					}
					if(i >= 1){
						form.unmask();//取消遮罩
    					nui.confirm("没有获取到fix指令状态，是否要强制扭转到下一环节。","系统提示",function(action){
    						if(action == "ok"){
    							urlStr = contextPath + "/com.cjhxfund.ats.fm.instr.FirstGradeBond.firstGradeBondHandle.biz.ext";
    							saveDataBackup(data, urlStr);
    						}else{
    							return;
    						}
    					});
					}
				}else if(returnJson.isSuccess == "5"){
					form.unmask();//取消遮罩
					nui.alert("发送Fix指令异常，请联系管理员。","系统提示");
					return;
				}else if(returnJson.isSuccess == "3"){
					form.unmask();//取消遮罩
					nui.alert("发送Fix指令成功.","系统提示");
					return;
				}else if(returnJson.isSuccess == "no"){
					form.unmask();//取消遮罩
					nui.alert("操作为同意时才能发送fix指令。","系统提示");
					return;
				}else{
					form.unmask();//取消遮罩
					nui.alert("发送Fix指令失败。","系统提示");
					return;
				}
    		}
    	});
    }
  //缴款流程交易员协议用印判定节点下单添加Fix
	function placePD(){
		form.loading();//加遮罩
		//当环节为投标复核时调用Fix接口向O32下达新增指令
		urlStr = contextPath + "/com.cjhxfund.ats.fm.instr.FirstGradeBond.addFix.biz.ext";
		var applyInst1=form.getData(false,true).applyInst;
		applyInst1.enPayFaceValue = nui.get("enPayFaceValue").getValue().replace(/,/gi,'');
		applyInst1.enBallotPrice = nui.get("enBallotPrice").getValue().replace(/,/gi,'');
		applyInst1.enPaymentMoney = nui.get("enPaymentMoney").getValue().replace(/,/gi,'');
		applyInst1.enNetScale = nui.get("enNetScale").getValue().replace(/,/gi,'');
		//组装参数		
		data = {
			workItemID:nui.get("workItemID").getValue(),
			pmprcaprvinfo:form.getData(false,true).pmprcaprvinfo,
			bpsParam:form.getData(false,true).bpsParam,
			applyInst:applyInst1
		};
				
		var lInvestNo = nui.get("lInvestNo").getValue();
		var lBizId = nui.get("lBizId").getValue();
		var json = nui.encode({lInvestNo:lInvestNo,lBizId:lBizId});
		//查询当前Fix指令状态
		$.ajax({
			url:"com.cjhxfund.ats.fm.instr.FirstGradeBond.getFixState.biz.ext",
			type:'POST',
			data:json,
			cache:false,
			contentType:'text/json',
			success:function(text){
				var myDate = (new Date());//获取当前日期
		    	var date1=text.applyInst.dPaymentDate.split(" ")[0];//获取缴款日
		    	if(date1 == null || date1 == ""){
		    		return;
		    	}
		    	if(myDate.getDate() != date1.split("-")[2] || myDate.getFullYear() != date1.split("-")[0] || myDate.getMonth()+1 != date1.split("-")[1]){
		    		form.unmask();//取消遮罩
		    		nui.alert("当前日期不是该债券的缴款日，不能推送到O32!");
		    		return;
		    	}
		    	
				if(text.applyInst.lFixValidStatus == 3){
					form.unmask();//取消遮罩
					nui.confirm("Fix指令下达成功，是否继续下达修改指令?","系统提示",function(action){
						if(action == "ok"){
							SaveDataPlace(data,urlStr);
						}
					});
				}else if(text.applyInst.lFixValidStatus == 2){
					form.unmask();//取消遮罩
					nui.confirm("Fix指令下达未拿到反馈信息，是否继续下达指令?","系统提示",function(action){
						if(action == "ok"){
							SaveDataPlace(data,urlStr);
					    }
					});
				}else{
					SaveDataPlace(data,urlStr);
				}	
			}				
		});
	 }
	
	   //缴款打印功能
    function paymentPrint(){
    	var processinstid = nui.get("processinstid").getValue();
    	var workItemName = nui.get("workItemName").getValue();
    	window.open("com.cjhxfund.ats.fm.instr.FirstGradeBond_print.flow?payment=true&processinstid="+processinstid+"&workItemName="+workItemName);
    }
    
    
    
  //判断产品是否需要提交时触发风控试算
    function judgeRiskTest(workItemID, instructParameter){
    	debugger;
    	var returnVal= false;
    	nui.ajax({
    		url : "com.cjhxfund.ats.riskMgr.comm.checkProductHaveRiskAuth.biz.ext",
    		type : 'POST',
    		data : {workItemID:workItemID, instructParameter:instructParameter},
    		cache : false,
    		async: false,
    		contentType : 'text/json',
    		success : function(text) {
    			returnVal = text.flag;
    		}
     	});
    	return returnVal;
    	
    }
    
    
    
    
    function getRiskInfo(lResultId){
    	var riskInfo = null;
    	nui.ajax({
    		url : "com.cjhxfund.ats.riskMgr.riskMgr.getRiskInfo.biz.ext",
    		type : 'POST',
    		data : {lResultId:lResultId},
    		cache : false,
    		async: false,
    		contentType : 'text/json',
    		success : function(text) {
    			var returnJson = nui.decode(text);
    			if(returnJson.exception == null){
    				riskInfo = returnJson.riskInfo;
    			}
    		}
    	 });
    	return riskInfo;
    }
