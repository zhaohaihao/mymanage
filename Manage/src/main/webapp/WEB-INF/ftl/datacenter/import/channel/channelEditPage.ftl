<#include "../../../common/globalDef.ftl">
<@simpleEdit "修改渠道" "${siteUrl}/datacenter/import/channelEdit">
<input type="hidden" name="id" value="${example.id!}"/>

<@formSelect "游戏" >
	<select class="form-control" name="kindId">
		<option value="" <#if example.kindId??>selected="selected"</#if>>-请选择-</option> 
		<#list otGameKindList as item>
			<option <#if item.id==example.kindId>selected="selected"</#if> value="${item.id}">${item.name}</option>
		</#list>
	</select>
</@formSelect>
<@formSelect "渠道" >
	<select class="form-control" name="cid">
		<option value="" <#if example.cid??>selected="selected"</#if>>-请选择-</option> 
		<#list otChannelList as item>
			<option <#if item.id==example.cid>selected="selected"</#if> value="${item.id}">${item.name}</option>
		</#list>
	</select>
</@formSelect>
<@formSelect "平台名称" >
	<select class="form-control" name="pid">
		<option value="" <#if example.pid??>selected="selected"</#if>>-请选择-</option> 
		<#list otPlatformList as item>
			<option <#if item.id==example.pid>selected="selected"</#if> value="${item.id}">${item.name}</option>
		</#list>
	</select>
</@formSelect>
<@formTextReadOnly "子渠道号" "code" "${example.code!}"/>
<@formText "子渠道名" "name" "${example.name!}"/>
</@simpleEdit>