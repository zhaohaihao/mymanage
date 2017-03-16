<#include "../../../common/globalDef.ftl">
<@simpleList 1550>
<form name="defaultForm" id="paramForm" action="${siteUrl}/datacenter/merParamList" method="post" >

<div class="widget-head" style="border-bottom:0 none;">
	<div class="pull-left">
		<input type="submit" class="btn btn-success" value="搜索">
		<input type="button" class="btn btn-success" onclick="showSimplePop('${siteUrl}/datacenter/merParamAddPage','添加平台账号参数')" value="添加">
	</div>
	<div class="pull-right">
		<button  type="button" class="btn btn-default" onclick="ClearForm('defaultForm')">重置</button>
	</div>
	<div class="clearfix"></div>
</div>

<div class="widget-content autoHeader">
	<table class="table table-striped table-bordered table-hover" style="min-width:1400px;">
		<thead class="fixedHeader">
		<tr>
			<th style="width:100px; padding-top:0;padding-bottom:0;"></th>
			<th style="width:100px; padding-top:0;padding-bottom:0;"></th>
			<th style="width:130px; padding-top:0;padding-bottom:0;"></th>
	        <th style="width:130px; padding-top:0;padding-bottom:0;"></th>
	        <th style="width:130px; padding-top:0;padding-bottom:0;"></th>
	        <th style="width:130px; padding-top:0;padding-bottom:0;"></th>
	        <th style="width:130px; padding-top:0;padding-bottom:0;"></th>
	        <th style="width:130px; padding-top:0;padding-bottom:0;"></th>
	        <th style="width:130px; padding-top:0;padding-bottom:0;"></th>
	        <th style="width:250px; padding-top:0;padding-bottom:0;"></th>
		</tr>
		</thead>
		<thead>
			<tr>
				<@seqTh page "defaultForm" "mer_no" >游戏平台账号</@seqTh>
				<@seqTh page "defaultForm" "pay_type" >支付类型</@seqTh>
				<@seqTh page "defaultForm" "gmp_desc" >描述</@seqTh>
				<@seqTh page "defaultForm" "param1" >参数1</@seqTh>
				<@seqTh page "defaultForm" "param2" >参数2</@seqTh>
				<@seqTh page "defaultForm" "param3" >参数3</@seqTh>
				<@seqTh page "defaultForm" "param4" >参数4</@seqTh>
				<@seqTh page "defaultForm" "param5" >参数5</@seqTh>
				<@seqTh page "defaultForm" "param6" >参数6</@seqTh>
				<th>操作</th>
			</tr>
		</thead>
	</table>
</div>
<div class="widget-content autoTbody">
	<table class="table table-striped table-bordered table-hover" style="min-width:1400px;">
		<tbody>
	<#list page.items as item>
		<tr>
			<td>
			<#if item.merNo=="-1">
				通用(-1)
			<#else>
				<#list merList as mer>
					<#if mer.merNo==item.merNo>
						${mer.merName!}(${mer.merNo!})
						<#break>
					</#if>
				</#list>
			</#if>
			</td>
			<td>
				<#list payTypeList as pay>
					<#if item.payType==pay.payType>
						${pay.typeName!}(${pay.payType!})
						<#break>
					</#if>
				</#list>
			</td>
			<td>${item.gmpDesc!}</td>
			<td><@txtLimit "${item.param1!}"/></td>
			<td><@txtLimit "${item.param2!}"/></td>
			<td><@txtLimit "${item.param3!}"/></td>
			<td><@txtLimit "${item.param4!}"/></td>
			<td><@txtLimit "${item.param5!}"/></td>
			<td><@txtLimit "${item.param6!}"/></td>
			<td>
				<input type="button" class="btn btn-xs btn-danger" onclick="deleteConfirm('paramForm','${siteUrl}/datacenter/merParamDel?gmpId=${item.gmpId}')" value="删除">
				<input type="button" class="btn btn-xs btn-warning" onclick="showSimplePop('${siteUrl}/datacenter/merParamEditPage?gmpId=${item.gmpId}','修改平台账号参数')" value="修改">
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