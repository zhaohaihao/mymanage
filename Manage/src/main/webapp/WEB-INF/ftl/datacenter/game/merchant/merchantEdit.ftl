<#include "../../../common/globalDef.ftl">
<@simpleEdit "修改平台账号" "${siteUrl}/datacenter/merchantEdit">

<@formTextReadOnly "平台账号" "merNo" "${example.merNo!}"/>
<@formText "平台名称" "merName" "${example.merName!}"/>
<@formText "签名密钥" "priKey" "${example.priKey!}"/>
<@formSelect "游戏" >
	<select class="form-control" name="kindId">
		<option value="" <#if example.kindId??>selected="selected"</#if>>-请选择-</option> 
		<#list gameKindList as item>
			<option <#if item.kindId==example.kindId>selected="selected"</#if> value="${item.kindId}">${item.gameName}</option>
		</#list>
	</select>
</@formSelect>

</@simpleEdit>