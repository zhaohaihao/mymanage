<#include "../../../common/globalDef.ftl">
<@simpleAdd "新增渠道配置" "${siteUrl}/datacenter/import/channelAdd">
<@formSelect "游戏" >
	<select class="form-control" name="kindId">
		<option value="" selected="selected">-请选择-</option> 
		<#list otGameKindList as item>
			<option value="${item.id}">${item.name}</option>
		</#list>
	</select>
</@formSelect>
<@formSelect "渠道" >
	<select class="form-control" name="cid">
		<option value="" selected="selected">-请选择-</option> 
		<#list otChannelList as item>
			<option value="${item.id}">${item.name}</option>
		</#list>
	</select>
</@formSelect>
<@formSelect "平台名称" >
	<select class="form-control" name="pid">
		<option value="" selected="selected">-请选择-</option> 
		<#list otPlatformList as item>
			<option value="${item.id}">${item.name}</option>
		</#list>
	</select>
</@formSelect>
<@formText "子渠道号" "code" />
<@formText "子渠道名" "name" />
</@simpleAdd>