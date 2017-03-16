<#include "../../../common/globalDef.ftl">
<@simpleAdd "新增支付类型" "${siteUrl}/datacenter/payTypeAdd">

<@formText "支付编号" "payType" />
<@formText "支付名称" "typeName" />
<@formText "描述" "typeDesc" />
<@formText "显示名称" "showName" />

<@formSelect "真实类型" >
	<select class="form-control" name="trueType">
		<option value="0" selected="selected">-请选择-</option> 
		<#list payTypeList as item>
			<option value="${item.payType}">${item.showName}</option>
		</#list>
	</select>
</@formSelect>
</@simpleAdd>