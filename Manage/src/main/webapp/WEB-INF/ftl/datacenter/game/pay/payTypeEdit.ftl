<#include "../../../common/globalDef.ftl">
<@simpleEdit "修改渠道" "${siteUrl}/datacenter/payTypeEdit">

<@formTextReadOnly "支付编号" "payType" "${example.payType!}"/>
<@formText "支付名称" "typeName" "${example.typeName!}"/>
<@formText "描述" "typeDesc" "${example.typeDesc!}"/>
<@formText "显示名称" "showName" "${example.showName!}"/>

<@formSelect "真实类型" >
	<select class="form-control" name="trueType">
		<option value="0" <#if example.trueType??>selected="selected"</#if>>-请选择-</option> 
		<#list payTypeList as item>
			<option <#if item.payType==example.trueType>selected="selected"</#if> value="${item.payType}">${item.showName}</option>
		</#list>
	</select>
</@formSelect>

</@simpleEdit>