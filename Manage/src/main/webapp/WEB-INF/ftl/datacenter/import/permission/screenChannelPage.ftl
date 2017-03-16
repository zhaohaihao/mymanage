<#include "../../../common/globalDef.ftl">
<div class="modal-content">
	<div class="modal-body">
		<form id="editModalForm" class="form-horizontal" role="form">
		<div class="padd">
		<div class="form quick-post">
	<div class="form-group">
		<input id ="ck_all"type="checkbox" onclick="chkAll(this.checked)"><label style="font-weight: normal;" for="ck_all">全选</label>
		<div class="col-lg-12" id="ddd">
			<#if otChannelList?exists>
			<#list otChannelList as item>
				<input type="checkbox" id="ck_${item_index}" name="cids" value="${item.id}" <#if cidList?index_of(item.id?string)!=-1 >checked</#if>><label style="font-weight: normal;" for="ck_${item_index}">${item.name}</label>&nbsp;&nbsp;
			</#list>
			</#if>
		</div>
	</div>


</div>
		</div>
		</form>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" onclick="layer.closeAll()">关闭</button>
		<button type="button" class="btn btn-danger" onclick="javascript:screenChannelSubmit('editModalForm')">确定并保存信息</button>
	</div>
</div>
<script type="text/javascript">
	
	function chkAll(checked) {
    	if(checked==true){
    		$("#ddd input").prop("checked",true);
    	}else {
    		$("#ddd input").prop("checked",false);
    	}
		
    }
    
    function screenChannelSubmit(formId){
		$('#'+formId).ajaxSubmit({
	        type: "POST",
	        url:'${siteUrl}/datacenter/screenChannel',
	        async: false,
	        dataType : 'json',
	        error:function(dataOrg){
	        	alertErr('未知异常');
	        },
	        success : function(dataOrg){
	        	var res=comMsg(dataOrg);
				if(res!=null){
					layer.closeAll();
					alertSuc(dataOrg.msg);
					defaultModalClose();
					$("#cidList").val(dataOrg.data);
				}
	        }
	    });
	}

</script>