<#include "../../../common/globalDef.ftl">
<@simpleEdit "修改渠道" "${siteUrl}/datacenter/channelEdit">

<@formTextReadOnly "渠道编号" "channelId" "${example.channelId!}"/>
<@formText "渠道名称" "channelName" "${example.channelName!}"/>
<@formText "描述" "channelDesc" "${example.channelDesc!}"/>
<@formSelect "平台名称" >
	<select class="form-control" name="platform">
		<option value="" <#if example.platform??>selected="selected"</#if>>-请选择-</option> 
		<#list platformList as item>
			<option <#if item.platform==example.platform>selected="selected"</#if> value="${item.platform}">${item.platformName}</option>
		</#list>
	</select>
</@formSelect>

</@simpleEdit>