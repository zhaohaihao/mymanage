<#include "../../../common/globalDef.ftl">
<@simpleAdd "新增" "${siteUrl}/datacenter/permissionAdd">

<@formText "登录名" "loginName" />

<div class="form-group">
	<input type="checkbox" onclick="chkAllGame(this.checked)">全选
	<div class="col-lg-12" id="dd">
		<#list otGameKindList as item>
			<input type="checkbox" name="kids" value="${item.id}">${item.name}&nbsp;&nbsp;
		</#list>
	</div>
</div>

<div class="form-group">
	<input type="checkbox" onclick="chkAllChannel(this.checked)">全选
	<div class="col-lg-12" id="ddd">
		<#list otChannelList as item>
			<input type="checkbox" name="cids" value="${item.id}">${item.name}&nbsp;&nbsp;
		</#list>
	</div>
</div>

<script type="text/javascript">
	
	function chkAllGame(checked) {
    	if(checked==true){
    		$("#dd input").prop("checked",true);
    	}else {
    		$("#dd input").prop("checked",false);
    	}
    }
    
    function chkAllChannel(checked) {
    	if(checked==true){
    		$("#ddd input").prop("checked",true);
    	}else {
    		$("#ddd input").prop("checked",false);
    	}
    }
    
</script>

</@simpleAdd>