<#include "../../common/globalDef.ftl">
<@dcList "${siteUrl}/datacenter/rechargeKpiList" 0 >

<div class="widget-content"  id="tableContainer" style="overflow:auto;">
	<table class="table table-striped table-bordered table-hover" style="min-width:950px;">
		<thead>
			<tr>
				<th colspan="100">充值报表</th>
			</tr>
		</thead>
		<thead>
			<tr>
				<th>日期</th>
				<th>充值人数</th>
				<th>充值次数</th>
				<th>首充人数</th>
				<th>ARPU</th>
				<th>收入</th>
			</tr>
		</thead>
		<tbody>
	<#list page.items as item>
		<tr>
			<td>${item.logtime?date!}</td>
			<td>${item.peopleCounts!}</td>
			<td>${item.rechargeCounts!}</td>
			<td>${item.firstPeopleCounts!}</td>
			<td>#{item.arpu ;m0M4}</td>
			<td>${item.infullamount!}</td>
		</tr>
	</#list>
		<td>合计</td>
			<td>x</td>
			<td>x</td>
			<td>x</td>
			<td></td>
			<td>x</td>
		</tbody>
	</table>
	
	
</div>
<div class="widget-foot">
	<@pagination page "topForm"/>
</div>
<@dcChart "chartDiv" '充值指标' "'充值人数','充值次数','首充人数','ARPU','收入'"  >
	xAxis : [
		        {
		            type : 'category',
		            boundaryGap : false,
		            data : [<#list page.items?reverse as item>'${item.logtime?string("MM-dd")!}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value'
		        }
		    ],
		    series : [
		        {
		            name:'充值人数',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'${item.peopleCounts!}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'充值次数',
		            type:'line',
		            symbol:'none',

		            data:[<#list page.items?reverse as item>'${item.rechargeCounts!}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'首充人数',
		            type:'line',
		            symbol:'none',
		            data:[<#list page.items?reverse as item>'${item.firstPeopleCounts!}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'ARPU',
		            type:'line',
		            symbol:'none',
		            data:[<#list page.items?reverse as item>'#{item.arpu ;m0M4}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'收入',
		            type:'line',
		            symbol:'none',
		            data:[<#list page.items?reverse as item>'${item.infullamount!}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        }
		    ]
</@dcChart>
</@dcList>
<script>
 	$(window).load(function() { 
      	 var sum = 0; 
		 var _lenght=$('table thead tr th').length-1;
		 var tr_lenght=$('table tr').length-2;
		 for(var i=1;i<_lenght;i++){
			 for(var j=0;j<tr_lenght;j++){
				$("tbody tr:not(:last) td").eq(i+j*_lenght).each(function(){  
			      sum = sum + parseInt($(this).text());  
			    }); 
			 }
			$("tbody tr:last-child td").eq(i).text(sum);
			sum = 0;
		}
	}); 
</script>
