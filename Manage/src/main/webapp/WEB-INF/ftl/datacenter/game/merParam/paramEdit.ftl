<#include "../../../common/globalDef.ftl">
<@simpleEdit "修改平台账号参数" "${siteUrl}/datacenter/merParamEdit">

<@formTextReadOnly "编号" "gmpId" "${example.gmpId!}"/>

<@formSelect "平台账号" >
	<select class="form-control" name="merNo">
		<option value="-1" <#if example.merNo=="-1">selected="selected"</#if>>通用(-1)</option>
		<#list merList as item>
			<option value="${item.merNo}" <#if example.merNo==item.merNo>selected="selected"</#if>> ${item.merName}(${item.merNo})</option>
		</#list>
	</select>
</@formSelect>

<@formSelect "支付类型" >
	<select class="form-control" name="payType">
		<option value="" selected="selected">-请选择-</option> 
		<#list payTypeList as item>
			<option value="${item.payType}" <#if example.payType==item.payType>selected="selected"</#if>>${item.typeName}(${item.payType})</option>
		</#list>
	</select>
</@formSelect>

<@formTextEditer "内容简介" "gmpDesc" "${example.gmpDesc!}"/>

<@formText "参数说明1" "desc1" "${example.desc1!}" />
<@formTextEditer "参数1" "param1" "${example.param1!}" />
<@formText "参数说明2" "desc2" "${example.desc2!}"/>
<@formTextEditer "参数2" "param2" "${example.param2!}" />
<@formText "参数说明3" "desc3" "${example.desc3!}"/>
<@formTextEditer "参数3" "param3" "${example.param3!}" />
<@formText "参数说明4" "desc4" "${example.desc4!}"/>
<@formTextEditer "参数4" "param4" "${example.param4!}" />
<@formText "参数说明5" "desc5" "${example.desc5!}"/>
<@formTextEditer "参数5" "param5" "${example.param5!}" />
<@formText "参数说明6" "desc6" "${example.desc6!}"/>
<@formTextEditer "参数6" "param6" "${example.param6!}" />


</@simpleEdit>