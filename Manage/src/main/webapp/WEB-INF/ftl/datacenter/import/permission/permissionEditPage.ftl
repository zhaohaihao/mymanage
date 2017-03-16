<#include "../../../common/globalDef.ftl">
<@simpleAdd "修改" "${siteUrl}/datacenter/permissionEdit">

<input type="hidden" name="userId" value="${example.userId}">
<@formTextReadOnly "登录名" "loginName" "${example.loginName}"/>

<div class="form-group">
	<input type="checkbox" onclick="chkAllGame(this.checked)">全选
	<div class="col-lg-12" id="dd">
		<#list otGameKindList as item>
			<input type="checkbox" name="kids" value="${item.id}" <#if example.kindIds?index_of(item.id?string)!=-1 >checked</#if> >${item.name}&nbsp;&nbsp;
		</#list>
	</div>
</div>

<div class="form-group">
	<input type="checkbox" onclick="chkAllChannel(this.checked)">全选
	<div class="col-lg-12" id="ddd">
		<#list otChannelList as item>
			<input type="checkbox" name="cids" value="${item.id}" <#if example.channelIds?index_of(item.id?string)!=-1 >checked</#if> >${item.name}&nbsp;&nbsp;
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