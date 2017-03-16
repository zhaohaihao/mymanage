<#include "../../common/globalDef.ftl">
<@dcList "${siteUrl}/datacenter/lossList" 0 1800>
<style>
.other-tables{
	float:left;
	background: #fff none repeat scroll 0 0;
    border: 1px solid #c9c9c9;
    border-radius: 3px;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
    margin-bottom: 20px;
    margin-top: 10px;
    min-height: 50px;
    position: relative;
}
</style>

<div class="widget-content" style="overflow:auto;">
	<table class="table table-striped table-bordered table-hover" style="min-width:1500px;">
		<thead>
			<tr>
				<th colspan="100">
					流失信息&emsp;&nbsp;
					<input type="button" class="btn btn-xs btn-success" onclick="showCol(1)" value="流失人数">
					<input type="button" class="btn btn-xs btn-success" onclick="showCol(2)" value="流失率">
					<input type="button" class="btn btn-xs btn-success" onclick="showCol(3)" value="全显示">
				</th>
			</tr>
		</thead>
		<thead>
			<tr>
				<th>日期</th>
				<th>日活跃用户数<br/>&nbsp;（含新增）</th>
				<th class="chart_a">次日流失数</th>
				<th class="chart_b">次日流失率</th>
				<th class="chart_a">2日流失数</th>
				<th class="chart_b">2日流失率</th>
				<th class="chart_a">3日流失数</th>
				<th class="chart_b">3日流失率</th>
				<th class="chart_a">4日流失数</th>
				<th class="chart_b">4日流失率</th>
				<th class="chart_a">5日流失数</th>
				<th class="chart_b">5日流失率</th>
				<th class="chart_a">6日流失数</th>
				<th class="chart_b">6日流失率</th>
				<th class="chart_a">7日流失数</th>
				<th class="chart_b">7日流失率</th>
				<th class="chart_a">14日流失数</th>
				<th class="chart_b">14日流失率</th>
				<th class="chart_a">30日流失数</th>
				<th class="chart_b">30日流失率</th>
			</tr>
		</thead>
		<tbody>
	<#list page.items as item>
		<tr>
			<td>${item.logtime?date!}</td>
			<td>${item.dayActv?default(0)}</td>
			<td class="chart_a">${item.days1Loss?default(0)}</td>
			<td class="chart_b">#{item.day1Rate*100 ;m0M4}%</td>
			<td class="chart_a">${item.days2Loss?default(0)}</td>
			<td class="chart_b">#{item.day2Rate*100 ;m0M4}%</td>
			<td class="chart_a">${item.days3Loss?default(0)}</td>
			<td class="chart_b">#{item.day3Rate*100 ;m0M4}%</td>
			<td class="chart_a">${item.days4Loss?default(0)}</td>
			<td class="chart_b">#{item.day4Rate*100 ;m0M4}%</td>
			<td class="chart_a">${item.days5Loss?default(0)}</td>
			<td class="chart_b">#{item.day5Rate*100 ;m0M4}%</td>
			<td class="chart_a">${item.days6Loss?default(0)}</td>
			<td class="chart_b">#{item.day6Rate*100 ;m0M4}%</td>
			<td class="chart_a">${item.days7Loss?default(0)}</td>
			<td class="chart_b">#{item.day7Rate*100 ;m0M4}%</td>
			<td class="chart_a">${item.days15Loss?default(0)}</td>
			<td class="chart_b">#{item.day15Rate*100 ;m0M4}%</td>
			<td class="chart_a">${item.days30Loss?default(0)}</td>
			<td class="chart_b">#{item.day30Rate*100 ;m0M4}%</td>
		</tr>
	</#list>
		</tbody>
	</table>
</div>
<div class="widget-foot">
	<@pagination page "topForm"/>
</div>


<@dcChart "chart_a" '流失人数' "'次日流失数','2日流失数','3日流失数','4日流失数','5日流失数','6日流失数','7日流失数','14日流失数','30日流失数'"  >
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
		            name:'次日流失数',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'${item.days1Loss?default(0)}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'2日流失数',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'${item.days2Loss?default(0)}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'3日流失数',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'${item.days3Loss?default(0)}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'4日流失数',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'${item.days4Loss?default(0)}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'5日流失数',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'${item.days5Loss?default(0)}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'6日流失数',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'${item.days6Loss?default(0)}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'7日流失数',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'${item.days7Loss?default(0)}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'14日流失数',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'${item.days15Loss?default(0)}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'30日流失数',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'${item.days30Loss?default(0)}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        }
		    ]
</@dcChart>
<@dcChart "chart_b" '流失率（%）' "'次日流失率','2日流失率','3日流失率','4日流失率','5日流失率','6日流失率','7日流失率','14日流失率','30日流失率'"  >
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
		            name:'次日流失率',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'#{item.day1Rate*100 ;m0M4}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'2日流失率',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'#{item.day2Rate*100 ;m0M4}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'3日流失率',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'#{item.day3Rate*100 ;m0M4}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'4日流失率',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'#{item.day4Rate*100 ;m0M4}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'5日流失率',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'#{item.day5Rate*100 ;m0M4}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'6日流失率',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'#{item.day6Rate*100 ;m0M4}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'7日流失率',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'#{item.day7Rate*100 ;m0M4}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'14日流失率',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'#{item.day15Rate*100 ;m0M4}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'30日流失率',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'#{item.day30Rate*100 ;m0M4}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        }
		    ]
</@dcChart>
</@dcList>
<script>
	function showCol(flag){
		if(flag==3){
			$(".chart_a").show();
			$(".chart_b").show();
		} else if(flag==1){
			$(".chart_a").show();
			$(".chart_b").hide();
		} else if(flag==2){
			$(".chart_a").hide();
			$(".chart_b").show();
		}
	}
</script>