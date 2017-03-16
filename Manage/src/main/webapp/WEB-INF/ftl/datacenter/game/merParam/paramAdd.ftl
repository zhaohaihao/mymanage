<#include "../../../common/globalDef.ftl">
<@simpleAdd "新增平台账号" "${siteUrl}/datacenter/merParamAdd">

<@formSelect "平台账号" >
	<select class="form-control" name="merNo">
		<option value="-1" selected="selected">通用</option> 
		<#list merList as item>
			<option value="${item.merNo}">${item.merName}(${item.merNo})</option>
		</#list>
	</select>
</@formSelect>

<@formSelect "支付类型" >
	<select class="form-control" name="payType">
		<option value="" selected="selected">-请选择-</option> 
		<#list payTypeList as item>
			<option value="${item.payType}">${item.typeName}(${item.payType})</option>
		</#list>
	</select>
</@formSelect>

<@formTextEditer "内容简介" "gmpDesc" />

<@formText "参数说明1" "desc1" />
<@formTextEditer "参数1" "param1" />
<@formText "参数说明2" "desc2" />
<@formTextEditer "参数2" "param2" />
<@formText "参数说明3" "desc3" />
<@formTextEditer "参数3" "param3" />
<@formText "参数说明4" "desc4" />
<@formTextEditer "参数4" "param4" />
<@formText "参数说明5" "desc5" />
<@formTextEditer "参数5" "param5" />
<@formText "参数说明6" "desc6" />
<@formTextEditer "参数6" "param6" />


</@simpleAdd>