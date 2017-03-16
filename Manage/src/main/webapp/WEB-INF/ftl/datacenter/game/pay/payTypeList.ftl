<#include "../../../common/globalDef.ftl">
<@simpleList 1150>
<form name="defaultForm" id="payTypeForm" action="${siteUrl}/datacenter/payTypeList" method="post" >

<div class="widget-head">
	<div class="pull-left">
		<input type="submit" class="btn btn-success" value="搜索">
		<input type="button" class="btn btn-success" onclick="showSimplePop('${siteUrl}/datacenter/payTypeAddPage','添加支付类型')" value="添加">
	</div>
	<div class="pull-right">
		<button  type="button" class="btn btn-default" onclick="ClearForm('defaultForm')">重置</button>
	</div>
	<div class="clearfix"></div>
</div>

<div class="widget-content autoHeader">
	<table class="table table-striped table-bordered table-hover" style="min-width:680px;">
		<thead class="fixedHeader">
		<tr>
			<th style="width:120px;"></th>
			<th><input type="text" name="typeName" value="${example.typeName!}" class="form-control" style="width:120px;"/></th>
	        <th><input type="text" name="typeDesc" value="${example.typeDesc!}" class="form-control" style="width:120px;"/></th>
	        <th><input type="text" name="showName" value="${example.showName!}" class="form-control" style="width:120px;"/></th>
	        <th style="width:120px;"></th>
	        <th style="width:120px;"></th>
		</tr>
		</thead>
		<thead>
			<tr>
				<@seqTh page "defaultForm" "pay_type" >支付类型编号</@seqTh>
				<@seqTh page "defaultForm" "type_name" >支付类型名称</@seqTh>
				<@seqTh page "defaultForm" "type_desc" >描述</@seqTh>
				<@seqTh page "defaultForm" "show_name" >显示名称</@seqTh>
				<@seqTh page "defaultForm" "true_type" >真实充值类型</@seqTh>
				<th>操作</th>
			</tr>
		</thead>
	</table>
	
	
</div>
<div class="widget-content autoTbody">
	<table class="table table-striped table-bordered table-hover" style="min-width:680px;">
		<tbody>
	<#list page.items as item>
		<tr>  
			<td>${item.payType!}</td>
			<td>${item.typeName!}</td>
			<td>${item.typeDesc!}</td>
			<td>${item.showName!}</td>
			<td>
				<#list payTypeList as p>
                     <#if item.trueType?exists && p.payType = item.trueType>${p.showName}</#if>
	         	</#list>
			</td>
			<td>
				<input type="button" class="btn btn-xs btn-danger" onclick="deleteConfirm('payTypeForm','${siteUrl}/datacenter/payTypeDel?payType=${item.payType}')" value="删除">
				<input type="button" class="btn btn-xs btn-warning" onclick="showSimplePop('${siteUrl}/datacenter/payTypeEditPage?payType=${item.payType}','修改支付类型')" value="修改">
            </td> 
		</tr>
	</#list>
		</tbody>
	</table>
	
	
</div>
<div class="widget-foot">
	<@pagination page "defaultForm"/>
</div>
</form>
</@simpleList>