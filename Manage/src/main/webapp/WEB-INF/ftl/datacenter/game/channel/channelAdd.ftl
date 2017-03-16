<#include "../../../common/globalDef.ftl">
<@simpleAdd "新增渠道" "${siteUrl}/datacenter/channelAdd">

<@formText "渠道编号" "channelId" />
<@formText "渠道名称" "channelName" />
<@formText "描述" "channelDesc" />
<@formSelect "平台名称" >
	<select class="form-control" name="platform">
		<option value="" selected="selected">-请选择-</option> 
		<#list platformList as item>
			<option value="${item.platform}">${item.platformName}</option>
		</#list>
	</select>
</@formSelect>
</@simpleAdd>