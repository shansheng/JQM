<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="/common/js/commscripts.jsp" %>

<head>
<title>债券搜索</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />  
    <style type="text/css">
    	.mini-tabs-bodys{
    		border: 0px;
    	}
    	.mini-layout-region{
    		border-left: 0px;
    		border-right: 0px;
    		border-bottom: 0px;
    	}
    	.mini-panel-border{
    		border-left: 0px;
    		border-right: 0px;
    	}
    </style> 
</head>
<body style="width: 100%;height: 100%;overflow: hidden;">
<div id="layout1" class="mini-layout" style="width:100%; height:100%;"  borderStyle="border:0px;">
	<div height="65%" borderStyle="border:0px;">
		<div class="search-condition" >
		  <div class="list">
            <div id="form1" class="nui-form"  align="center" >
           
	            <input class="nui-hidden" name="jurisdiction" value=""/>
                <table id="table1" border="0" cellpadding="1" cellspacing="1" style="width:100%;table-layout:fixed;">
                    <tr>
                    	<td align="right" style="width:60px">
						债券全称:
		                </td>
		                <td align="left" >
							<input class="nui-textbox" id="vcStockNameFull" name="criteria/_or[20]/_expr[20]/vcStockNameFull" width="80%"/>
                        	<input class="nui-hidden" type="hidden" name="criteria/_or[20]/_expr[20]/_op" value="like">
                            <input class="nui-hidden" type="hidden" name="criteria/_or[20]/_expr[20]/_likeRule" value="all">
                            
                            <input class="nui-hidden" id="vcStockName" name="criteria/_or[20]/_expr[21]/vcStockName" width="80%"/>
                        	<input class="nui-hidden" type="hidden" name="criteria/_or[20]/_expr[21]/_op" value="like">
                            <input class="nui-hidden" type="hidden" name="criteria/_or[20]/_expr[21]/_likeRule" value="all">
                            
                        
                        </td>
                        
                        <td style="width:80px" align="right">
						登记托管机构:
		                </td>
		                <td style="" align="left">
							<input class="nui-dictcombobox" name="criteria/_expr[23]/vcPaymentPlace" dictTypeId="CF_JY_DJTGCS" valueField="dictID" textField="dictName"    
									emptyText="全部" nullItemText="全部"  width="80%" showClose="true" oncloseclick="onCloseClickValueEmpty"  />
                        	<input class="nui-hidden" type="hidden" name="criteria/_expr[23]/_op" value="=">
                        </td>
                   	</tr>
                   	<tr>
                    	<td align="right">
						债券代码:
		                </td>
		                <td align="left">
							<input class="nui-textbox" name="criteria/_expr[24]/vcStockCode"   width="80%" />
                        	<input class="nui-hidden" name="criteria/_expr[24]/_op" value="in">
                        </td>
                        <td align="right">
						发行主体全称:
		                </td>
		                <td align="left">
							<input class="nui-textbox" name="criteria/_expr[25]/vcIssueNameFull"  width="80%"/>
                        	<input class="nui-hidden" type="hidden" name="criteria/_expr[25]/_op" value="like">
                            <input class="nui-hidden" type="hidden" name="criteria/_expr[25]/_likeRule" value="all">
                        </td>
                         
                        <td align="left" style="width:80px" align="right" >
					       <a class='nui-button' plain='false' iconCls="icon-search" onclick="search()">查询</a>
					       <a id="ok" class='nui-button' plain='false' iconCls="icon-ok" onclick="ok()">确认</a>
					    </td>
                       
                    </tr>
                </table>
            </div>
           </div>
         </div>   
        <div class="nui-fit" >
            <div id="dataform1"
                 dataField="stockissueinfos"
                 class="nui-datagrid"
                 style="width:100%;height:100%"
                 url="com.cjhxfund.ats.fm.instr.StockIssueInfoBiz.queryStockIssueList1.biz.ext"
                 pageSize="20" sortField="lIssueBeginDate" sortOrder="desc"
                 showPageInfo="true"
                 multiSelect="true" 
                 onselectionchanged="selectionChanged"
                 frozenStartColumn="0" frozenEndColumn="6">

                    <div property="columns">
                        <div type="indexcolumn"  headerAlign="center" align="center">
                        </div>
                        <div type="checkcolumn"></div>
                        <div name="action" width="40" headerAlign="center">#</div>
                        <div field="vcStockCode" headerAlign="center" align="left" allowSort="true" width="80px">
                            债券代码
                        </div>
                        <div field="vcStockName" headerAlign="center" allowSort="true" width="100px">
                            债券简称
                        </div>
                        <div field="vcPaymentPlace" headerAlign="center" allowSort="true" width="70px" renderer="onvcPaymentPlace">
                            托管机构
                        </div>
                       
                        <div field="vcIssuerNameFull" headerAlign="center" align="center" width="180px" allowSort="true" >
                            发行主体全称
                        </div>
                        <div field="vcStockNameFull" headerAlign="center" allowSort="true" width="100px">
                            债券全称
                        </div>
                       	<div field="vcMainUnderwriter" headerAlign="center" allowSort="true" width="100px">
                            主承销商
                        </div>
                        <div field="cMarketNo" headerAlign="center" allowSort="true" width="100px" renderer="marketNoRenderer">
                            市场
                        </div>
                  </div>
			</div>
		</div>
	</div>	
</div>
	<script type="text/javascript">
    	nui.parse(); 
    	var grid = nui.get("dataform1");
		var msg;
       
    	 $("#dataform1 .mini-buttonedit-buttons").remove();
		 $("#dataform1 .mini-buttonedit-border").css("background-color","#f0f0f0");
    	//重新刷新页面
           function refresh(){
               var form = new  nui.Form("#form1");
               var json = form.getData(false,false);
               grid.load(json);//grid查询
               nui.get("update").enable();
           }
           //传递数据
		   function setFormData(data){
		   		
				nui.get("vcStockNameFull").setValue(data.vcStockName);
				nui.get("vcStockName").setValue(data.vcStockName);
				var formData = new nui.Form("#form1").getData(false,false);
	        	grid.load(formData);
		   }
           //查询
           function search() {
           	 var form = new nui.Form("#form1");
			 nui.get("vcStockName").setValue(nui.get("vcStockNameFull").getValue());
              var json = form.getData(false,false);
              var dataForm1 = new nui.Form("#dataform1");
        	  dataForm1.reset();//清除明细信息
              grid.load(json);//grid查询
            }

            //重置查询条件
            function reset(){
               var form = new nui.Form("#form1");//将普通form转为nui的form
               form.reset();
               //清空对象
               nui.get("form1").clearRows();
            }
            
            //当选择列时
		    function selectionChanged(){
		        
		    } 
			function onvcPaymentPlace(e){
	  			return nui.getDictText("CF_JY_DJTGCS",e.row.vcPaymentPlace);;
			}
            
			//行双击时重新设置tabs页面参数
			grid.on("rowdblclick", function (e) {			
				//console.log(e);
				CloseWindow("cancel",e.row);
				
				
			});
			
		    function reloadData(){
				grid.reload();
			}
		//选中确认
		function ok(){
			var s=grid.getSelecteds();
			CloseWindow("cancel",s);
		}
		//渲染行对象
		grid.on("drawcell", function (e) {
            var record = e.record,
	        column = e.column;
	        
	        /*field = e.field,
	        value = e.value;*/
	        //action列，超连接操作按钮
	        if (column.name == "action") {
	            e.cellStyle = "text-align:left";
	            e.cellHtml = "<a class='nui-button' plain='false' style='cursor:pointer;text-decoration:underline;' onclick='info()'>详情</a>&nbsp;";
				}
		        //设置行样式
		        if (record.gender == 1) {
		            e.rowCls = "myrow";
		        }

        	});
		function info(){
			var row = grid.getSelected();
			
            if (row) {
                nui.open({
                    url: "<%=request.getContextPath() %>/fm/baseinfo/firstGradeDebt/debtIssueQueryDetail.jsp?lStockIssueId="+row.lStockIssueId,
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
                
            } else {
                nui.alert("请选中一条记录");
            }
		}
		//关闭窗口
		function CloseWindow(action,data) {
			if (action == "close" && form.isChanged()) {
				if(confirm("数据被修改了，是否先保存？")) {
					saveData();
				}
			}
			if (window.CloseOwnerWindow)
				return window.CloseOwnerWindow(data);
			else window.close();
		}
		
		//取消
		function onCancel() {
			CloseWindow("cancel","");
		}
		//市场代码字典转换
		function marketNoRenderer(e){
        	return nui.getDictText("tradePlace",e.row.cMarketNo);
        }  
    </script>
</body>
</html>