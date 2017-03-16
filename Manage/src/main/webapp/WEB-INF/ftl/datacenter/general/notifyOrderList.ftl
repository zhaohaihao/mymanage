<#include "../../common/globalDef.ftl">
<@simpleList 1150>
<form name="defaultForm" id="loginLogListForm" action="${siteUrl}/datacenter/notifyOrderList" method="post" >

<div class="widget-head">
	<div class="pull-left">
		<input type="submit" class="btn btn-success" value="搜索">
	</div>
	<div class="pull-right">
		<button  type="button" class="btn btn-default" onclick="ClearForm('defaultForm')">重置</button>
	</div>
	<div class="clearfix"></div>
</div>

<div class="widget-content autoHeader" >
	<table class="table table-striped table-bordered table-hover" style="min-width:1100px;">
		<thead class="fixedHeader">
		<tr>
			<th><input type="text" name="orderId" value="${example.orderId!}" class="form-control" style="width:120px;"/></th>
			<th style="width:160px;">
				<@shDateBeginEnd "notifyDateSH" example.notifyDateSH! />
			</th>
			<th style="width:300px"><input type="text" name="callbackUrl" value="${example.callbackUrl!}" class="form-control" style="width:200px;"/></th>
			<th ><input type="text" name="notifyCount" value="${example.notifyCount!}" class="form-control" style="width:70px;"/></th>
			<th style="width:150px;">
				<select class="form-control" name="notifyStatus" style="width:100px;">
		        	<option value="" <#if example.notifyStatus??>selected="selected"</#if>>-请选择-</option>
		        	<option value=1 <#if example.notifyStatus?? & example.notifyStatus==1>selected="selected"</#if> >成功</option>
			        <option value=2 <#if example.notifyStatus?? & example.notifyStatus==2>selected="selected"</#if> >失败</option>
		        </select>
			</th>
		</tr>
		<tr>
			<@seqTh page "defaultForm" "order_id" >用户ID</@seqTh>
			<@seqTh page "defaultForm" "notify_time" >通知时间</@seqTh>
			<@seqTh page "defaultForm" "callback_url" >回调路径</@seqTh>
			<@seqTh page "defaultForm" "notify_count" >通知次数</@seqTh>
			<@seqTh page "defaultForm" "notify_status" >通知状态</@seqTh>
		</tr>
		</thead>
	</table>
</div>
<div class="widget-content autoTbody" >
	<table class="table table-striped table-bordered table-hover" style="min-width:1100px;">
		<tbody>
	<#list page.items as item>
		<tr>
			<td>${item.orderId!}</td>
			<td>
				<#if item.notifyDate?? >
				${item.notifyDate?datetime!}
				</#if>
			</td>
			<td><@txtLimit "${item.callbackUrl!}"/></td>
			<td>${item.notifyCount!}</td>
			<td>
			   	<#if item.notifyStatus?? & 1==item.notifyStatus>成功</#if>
			   	<#if item.notifyStatus?? & 2==item.notifyStatus>失败</#if>
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