<#include "../../common/globalDef.ftl">
<@simpleList 1650>
<style type="text/css">
	#page{width: 500px; margin: 0 auto; text-align: left;}
	#test{width: 212px; padding: 2px; height: 22px; border: 1px solid #ddd; margin: 0 5px 0 0; display:none;}
	#test option{padding: 2px 5px;}
	#test option:first-child{display: none;}
	#pre{position:relative; float: right;}
	#over_text{width: 185px; padding: 2px 15px 2px 5px; margin-bottom: -1px; background: url(${imgUrl}/dropdown.png) no-repeat scroll right center; border: 1px solid #ccc; box-shadow: 0 1px 0 0 #eee inset; cursor: default;}
	#over_text:focus{cursor: text;}
	#over_div{width: 185px; border: 1px solid #333; border-radius: 0 0 3px 3px; display: none; position:absolute;}
	.soption{display: block; padding: 2px 5px; position:relative; background-color:#FFF;}
	.soption:hover{background: #1E90FF; color:#fff; padding: 1px 5px;}
</style>

<form name="defaultForm" action="${siteUrl}/datacenter/totalStatistics" method="post" >

<div class="widget-head">
	<div class="pull-left" style="height:33px;">
		<button type="button" class="btn btn-success" onclick="commitTable()">搜索</button>
	</div>
	<div class="pull-right" style="height:33px;">
		<button type="button" class="btn btn-success" onclick="exportExcel()">导出</button>&nbsp;
		<button  type="button" class="btn btn-default" onclick="ClearForm('defaultForm')">重置</button>&nbsp;
	</div>
	<div class="clearfix"></div>
</div>

<div class="widget-content autoHeader">
	<table class="table table-striped table-bordered table-hover" style="min-width:1600px;">
		<thead class="fixedHeader">
		<tr>
			<th style="width:95px;">
				<@shDateBeginEnd "logDateSh" example.logDateSh! />
			</th>
			<th style="width:120px;">
				<select class="form-control" name="kindid">
		        	<option value="" <#if !example.kindid?? >selected="selected"</#if>>请选择</option>
		        	<#if otGameKindList?exists>
			        <#list otGameKindList as item>
				        <option <#if example.kindid?? && example.kindid==item.id>selected="selected"</#if> value="${item.id}">
				        	${item.name}
				        </option>
			        </#list>
			        </#if>
		        </select>
		    </th>
		    <th style="width:115px;"></th>
			<th style="width:115px;"></th>
			<th style="width:115px;"></th>
			<th style="width:100px;"></th>
			<th style="width:100px;"></th>
			<th style="width:100px;"></th>
			<th style="width:100px;"></th>
			<th style="width:100px;"></th>
			<th style="width:100px;"></th>
			<th style="width:100px;"></th>
			<th style="width:100px;"></th>
			<th style="width:100px;"></th>
			<th style="width:100px;"></th>
			<th style="width:100px;"></th>
		</tr>
		</thead>
		<thead>
			<tr>
				<@seqTh page "defaultForm" "logDate" >日期</@seqTh>
				<@seqTh page "defaultForm" "kindId" >游戏</@seqTh>
				<@seqTh page "defaultForm" "totalPayAmount" >总充值金额</@seqTh>
				<@seqTh page "defaultForm" "androidPayAmount" >安卓充值金额</@seqTh>
				<@seqTh page "defaultForm" "iosPayAmount" >IOS充值金额</@seqTh>
				<@seqTh page "defaultForm" "payPl" >付费用户</@seqTh>
				<@seqTh page "defaultForm" "newPl" >新增用户</@seqTh> 
				<@seqTh page "defaultForm" "actPl" >活跃用户</@seqTh>
				<@seqTh page "defaultForm" "totalPl" >累计用户</@seqTh>
				<@seqTh page "defaultForm" "arpu" >ARPU</@seqTh>
				<@seqTh page "defaultForm" "actRate" >活跃率</@seqTh>
				<@seqTh page "defaultForm" "payRate" >付费转化率</@seqTh>
				<@seqTh page "defaultForm" "arppu" >ARPPU</@seqTh>
				<@seqTh page "defaultForm" "day1Remain" >次日留存</@seqTh>
				<@seqTh page "defaultForm" "day3Remain" >三日留存</@seqTh>
				<@seqTh page "defaultForm" "day7Remain" >七日留存</@seqTh>
			</tr>
		</thead>
	</table>
	
	
</div>
<div class="widget-content autoTbody">
	<table class="table table-striped table-bordered table-hover" style="min-width:1600px;">
		<tbody>
		  <#list page.items as item>
			<tr>
				<td>${item.dateweek!}</td>
				<td>
				    <#list otGameKindList as g>
				        <#if item.kindid?? && item.kindid==g.id>
				        	${g.name}
				        </#if>
			        </#list>
				</td>
				<td><@parseNum item.totalpayamount/></td>
				<td><@parseNum item.androidpayamount/></td>
				<td><@parseNum item.iospayamount/></td>
				<td>${item.paypl!}</td>
				<td>${item.newpl!}</td>
				<td>${item.actpl!}</td>
				<td>${item.totalpl!}</td>
				<td><@parseNum item.arpu/></td>
				<td><@parseNum2 item.actrate*100/></td>
				<td><@parseNum2 item.payrate*100/></td>
				<td><@parseNum item.arppu/></td>
				<td><@parseNum2 item.day1remain*100/></td>
				<td><@parseNum2 item.day3remain*100/></td>
				<td><@parseNum2 item.day7remain*100/></td>
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

<script type="text/javascript">
	function exportExcel(){
		document.defaultForm.action="${siteUrl}/datacenter/makeTotalExcel"; 
		defaultForm.submit();
	}
	
	function commitTable(){
		document.defaultForm.action="${siteUrl}/datacenter/totalStatistics"; 
		defaultForm.submit();
	}
</script>