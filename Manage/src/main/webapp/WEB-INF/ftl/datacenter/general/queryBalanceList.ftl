<#include "../../common/globalDef.ftl">
<@simpleList 870>
<form name="defaultForm" id="loginLogListForm" action="${siteUrl}/datacenter/queryBalanceList" method="post" >

<div class="widget-head">
	<div class="pull-left">
		<input type="submit" class="btn btn-success" value="查询">
	</div>
	<div class="clearfix"></div>
</div>

<div class="widget-content autoHeader" >
	<table class="table table-striped table-bordered table-hover" style="min-width:850px;">
		<thead class="fixedHeader">
		<tr>
			<th>帐号余额(元)</th>
			<th>帐号剩余条数</th>
		</tr>
		</thead>
	</table>
</div>
<div class="widget-content autoTbody" >
	<table class="table table-striped table-bordered table-hover" style="min-width:850px;">
		<tbody>
			<tr>
				<td>${balance!}</td>
				<td>${number!}</td>
			</tr>
		</tbody>
	</table>
</div>
</form>

</@simpleList>