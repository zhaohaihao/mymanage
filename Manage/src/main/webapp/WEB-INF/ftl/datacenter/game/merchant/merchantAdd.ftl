<#include "../../../common/globalDef.ftl">
<@simpleAdd "新增平台账号" "${siteUrl}/datacenter/merchantAdd">

<@formText "平台账号" "merNo" />
<@formText "平台名称" "merName" />
<@formText "签名密钥" "priKey" />
<@formSelect "游戏" >
	<select class="form-control" name="kindId">
		<option value="" selected="selected">-请选择-</option> 
		<#list gameKindList as item>
			<option value="${item.kindId}">${item.gameName}</option>
		</#list>
	</select>
</@formSelect>
</@simpleAdd>