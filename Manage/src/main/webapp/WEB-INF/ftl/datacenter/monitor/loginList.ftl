<#include "../../common/globalDef.ftl">
<@dcList "${siteUrl}/datacenter/loginList" 1>

<@dcChart "chartDiv" '登录人数统计' "'登录次数','登录人数','付费用户数','非付费用户数','人均登录次数（ALC）'"  >
	xAxis : [
		        {
		            type : 'category',
		            boundaryGap : false,
		            data : [<#list page.items?reverse as item>'${item.logtime?string("HH:mm")!}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value'
		        }
		    ],
		    series : [
		        {
		            name:'登录次数',
		            type:'line',
		            symbol:'none',
		            smooth:true,
		            data:[<#list page.items?reverse as item>'${item.loginCounts?default(0)}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'登录人数',
		            type:'line',
		            symbol:'none',
		            smooth:true,
		            data:[<#list page.items?reverse as item>'${item.loginPeoples?default(0)}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'付费用户数',
		            type:'line',
		            symbol:'none',
		            smooth:true,
		            data:[<#list page.items?reverse as item>'${item.payLoginPeoples?default(0)}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'非付费用户数',
		            type:'line',
		            symbol:'none',
		            smooth:true,
		            data:[<#list page.items?reverse as item>'${item.loginPeoples?default(0)-item.payLoginPeoples?default(0)}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'人均登录次数（ALC）',
		            type:'line',
		            symbol:'none',
		            smooth:true,
		            data:[<#list page.items?reverse as item><#if item.loginPeoples?default(0) = 0>'0'<#else>'${(item.loginCounts?default(0)/item.loginPeoples?default(0))?string('#.##')}'</#if><#if item_index lt page.showCount-1>,</#if></#list>]
		        }
		    ]
</@dcChart>

<div class="widget-content"  id="tableContainer" style="overflow:auto;">
	<table class="table table-striped table-bordered table-hover" style="min-width:950px;">
		<thead>
			<tr>
				<th colspan="100">登录人数统计</th>
			</tr>
		</thead>
		<thead>
			<tr>
				<th>时间</th>
				<th>登录次数</th>
				<th>登录人数</th>
				<th>付费用户数</th>
				<th>非付费用户数</th>
				<th>人均登录次数（ALC）</th>
			</tr>
		</thead>
		<tbody>
	<#list page.items as item>
		<tr>
			<td>${item.logtime?string("HH:mm")!}</td>
			<td>${item.loginCounts?default(0)}</td>
			<td>${item.loginPeoples?default(0)}</td>
			<td>${item.payLoginPeoples?default(0)}</td>
			<td>${item.loginPeoples?default(0)-item.payLoginPeoples?default(0)}</td>
			<td><#if item.loginPeoples?default(0) = 0>0<#else>${(item.loginCounts?default(0)/item.loginPeoples?default(0))?string('#.##')}</#if></td>
		</tr>
	</#list>
		</tbody>
	</table>
	
	
</div>
<div class="widget-foot">
	<@pagination page "topForm"/>
</div>


</@dcList>
