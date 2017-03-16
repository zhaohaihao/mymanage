<#include "../../common/globalDef.ftl">
<@dcList "${siteUrl}/datacenter/kpiMonthReportList" 0 >

<div class="widget-content"  id="tableContainer" style="overflow:auto;">
	<table class="table table-striped table-bordered table-hover" style="min-width:950px;">
		<thead>
			<tr>
				<th colspan="100">KPI月报<span style="float:right;"><input type="button" id="exportExcel" onclick="exportExcel2()" class="btn btn-success" value="导出excel"/><span></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>日期</th>
				<#list page.items as item>
				<th>${item.logtime?string("yyyy-MM")!}</th>
				</#list>
			</tr>
			
			<tr>
				<td>收入</td>
				<#list page.items as item>
				<td>${item.mPayAmount?string(",##0.##")!}</td>
				</#list>
			</tr>
			<tr>
				<td>新增用户充值总额</td>
				<#list page.items as item>
				<td>${item.mPayAmountNu?string(",##0.##")!}</td>
				</#list>
			</tr>
			<tr>
				<td>新增用户数</td>
				<#list page.items as item>
				<td>${item.mAddUsers!}</td>
				</#list>
			</tr>
			<tr>
				<td>新增用户的付费用户数</td>
				<#list page.items as item>
				<td>${item.mPayNus!}</td>
				</#list>
			</tr>
			<tr>
				<td>新增用户付费率</td>
				<#list page.items as item>
				<td>${item.mPayNus/item.mAddUsers*100!}%</td>
				</#list>
			</tr>
			<tr>
				<td>新增用户ARPPU</td>
				<#list page.items as item>
				<td>${(item.mPayAmount/item.mPayNus)?string("#.##")!}</td>
				</#list>
			</tr>
			<tr>
				<td>上月新增用户在本月登录--收入</td>
				<#list page.items as item>
				<td>${item.m1PayAmount?string(",##0.##")!}</td>
				</#list>
			</tr>
			<tr>
				<td>本月活跃用户数MAU</td>
				<#list page.items as item>
				<td>-</td>
				</#list>
			</tr>
			<tr>
				<td>上月新增用户在本月登录--活跃人数</td>
				<#list page.items as item>
				<td>${item.m1ActivNus!}</td>
				</#list>
			</tr>
			<tr>
				<td>上月新增用户在本月登录--留存率</td>
				<#list page.items as item>
				<td>${item.m1ActivNus/item.m1AddUsers*100!}%</td>
				</#list>
			</tr>
			<tr>
				<td>上月新增用户在本月登录--付费率</td>
				<#list page.items as item>
				<td>${item.m1PayNus/item.m1ActivNus*100!}%</td>
				</#list>
			</tr>
			<tr>
				<td>上月新增用户在本月登录--ARPPU</td>
				<#list page.items as item>
				<td>${(item.m1PayAmount/item.m1PayNus)?string("#.##")!}</td>
				</#list>
			</tr>
			<tr>
				<td>30+天前新增用户在本月登录--收入</td>
				<#list page.items as item>
				<td>${item.m2PayAmount?string(",##0.##")!}</td>
				</#list>
			</tr>
			<tr>
				<td>30+天前新增用户在本月登录--付费率</td>
				<#list page.items as item>
				<td>${item.m2PayNus/item.m2AddUsers*100!}%</td>
				</#list>
			</tr>
			<tr>
				<td>30+天前新增用户在本月登录--ARPPU</td>
				<#list page.items as item>
				<td>${(item.m2PayAmount/item.m2PayNus)?string("#.##")!}</td>
				</#list>
			</tr>
			<tr>
				<td>本月登录的回流用户数</td>
				<#list page.items as item>
				<td>${item.mComingUsers!}</td>
				</#list>
			</tr>
			<tr>
				<td>30+天未登录的回流用户的回流率</td>
				<#list page.items as item>
				<td>-</td>
				</#list>
			</tr>
			<tr>
				<td>累计用户数</td>
				<#list page.items as item>
				<td>${item.users!}</td>
				</#list>
			</tr>
		</tbody>
	</table>
	
	<div class="widget-foot">
	<@pagination page "topForm"/>
	</div>
	
</div>

<@dcChart "chartDiv" 'KPI月报统计' "'收入','新增用户充值总额','新增用户数','新增用户的付费用户数','新增用户付费率','新增用户ARPPU','上月用户--收入','本月活跃用户数MAU','上月用户--活跃人数','上月用户--留存率','上月用户--付费率','上月用户--ARPPU','30+天前用户--收入','30+天前用户--付费率','30+天前用户--ARPPU','本月登录的回流用户数','30+天未登录的回流用户的回流率','累计用户数'"  >
	grid:{
            height: '65%',
        },
	xAxis : [
		        {
		            type : 'category',
		            boundaryGap : false,
		            data : [<#list page.items as item>'${item.logtime?string("yyyy-MM")!}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value'
		        }
		    ],
		    series : [
		        {
		            name:'收入',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'${item.mPayAmount?string(",##0.##")!}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'新增用户充值总额',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'${item.mPayAmountNu?string(",##0.##")!}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'新增用户数',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'${item.mAddUsers!}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'新增用户的付费用户数',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'${item.mPayNus!}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'新增用户付费率',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'${(item.mPayNus/item.mAddUsers)?string("#.##")!}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'新增用户ARPPU',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'${(item.mPayAmount/item.mPayNus)?string("#.##")!}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'上月用户--收入',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'${item.m1PayAmount?string(",##0.##")!}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'本月活跃用户数MAU',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>''<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'上月用户--活跃人数',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'${item.m1ActivNus!}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'上月用户--留存率',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'${(item.m1ActivNus/item.m1AddUsers)?string("#.##")!}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'上月用户--付费率',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'${(item.m1PayNus/item.m1ActivNus)?string("#.##")!}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'上月用户--ARPPU',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'${(item.m1PayAmount/item.m1PayNus)?string("#.##")!}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'30+天前用户--收入',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'${item.m2PayAmount?string(",##0.##")!}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'30+天前用户--付费率',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'${(item.m2PayNus/item.m2AddUsers)?string("#.##")!}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'30+天前用户--ARPPU',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'${(item.m2PayAmount/item.m2PayNus)?string("#.##")!}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'本月登录的回流用户数',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'${item.mComingUsers!}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'30+天未登录的回流用户的回流率',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'${item.m2ComingUsers!}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'累计用户数',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'${item.users!}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        }
		    ]
</@dcChart>
</@dcList>
<script type="text/javascript">
	function exportExcel2(){
		document.topForm.action="${siteUrl}/datacenter/createMkpiInfoExcel"; 
		topForm.submit();
	}
</script>