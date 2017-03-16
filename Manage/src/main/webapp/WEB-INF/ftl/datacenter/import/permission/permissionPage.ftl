<#include "../../../common/globalDef.ftl">
<@simpleList 750>
<form name="defaultForm" action="${siteUrl}/datacenter/permissionPage" method="post" >

<div class="widget-head">
	<div class="pull-left">
		<input type="submit" class="btn btn-success" value="搜索">
		<input type="button" class="btn btn-success" onclick="showSimplePop('${siteUrl}/datacenter/permissionAddPage','添加用户')" value="添加">
	</div>
	<div class="pull-right">
		<button  type="button" class="btn btn-default" onclick="ClearForm('defaultForm')">重置</button>
	</div>
	<div class="clearfix"></div>
</div>

<div class="widget-content autoHeader">
	<table class="table table-striped table-bordered table-hover" style="min-width:745px;">
		<thead class="fixedHeader">
		<tr>
			<th style="width:300px;"><input type="text" name="userName" value="${example.loginName!}" class="form-control" /></th>
			<th style="width:300px;"><input type="text" name="realName" value="${example.nickName!}" class="form-control" /></th>
			<th style="width:150px;"></th>
		</tr>
		</thead>
		<thead>
			<tr>
				<@seqTh page "defaultForm" "loginName" >登录名</@seqTh>
				<@seqTh page "defaultForm" "nickName" >昵称</@seqTh>
				<th>操作</th>
			</tr>
		</thead>
	</table>
	
	
</div>
<div class="widget-content autoTbody">
	<table class="table table-striped table-bordered table-hover" style="min-width:745px;">
		<tbody>
	<#list page.items as item>
		<tr>
			<td>${item.loginName!}</td>
			<td>${item.nickName!}</td>
			<td>
				<input type="button" class="btn btn-xs btn-warning" onclick="showSimplePop('${siteUrl}/datacenter/permissionEditPage?thisId=${item.userId}','修改用户')" value="修改">
				<button data-toggle="modal" class="btn btn-xs btn-danger" data-target="#editModal"
					onclick="deleteConfirm('defaultForm','${siteUrl}/datacenter/permissionDel?thisId=${item.userId}')">
					删除
				</button>
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