<#include "../../common/globalDef.ftl">
<@simpleList 850>
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

<form name="defaultForm" action="${siteUrl}/datacenter/provinceStatistics" method="post" >
<div class="widget-head" >
	<div class="pull-left" style="height:33px;">
		<button type="button" class="btn btn-success" onclick="commitTable()">搜索</button>
	</div>
	<div class="pull-right" style="height:33px;">
		<!--<button type="button" class="btn btn-success" onclick="exportExcel()">导出</button>&nbsp;-->
		<button type="button" class="btn btn-default" onclick="ClearForm('defaultForm')">重置</button>&nbsp;
	</div>
	<div class="clearfix"></div>
</div>

<div class="widget-content autoHeader">
	<table class="table table-striped table-bordered table-hover" style="min-width:800px;">
		<thead class="fixedHeader">
		<tr>
			<th style="width:160px;">
				<@shDateBeginEnd "logDateSh" example.logDateSh! />
			</th>
			<th style="width:120px;">
				<select class="form-control" name="kindId">
		        	<option value="" <#if !example.kindId?? >selected="selected"</#if>>请选择</option>
		        	<#if otGameKindList?exists>
			        <#list otGameKindList as item>
				        <option <#if example.kindId?? && example.kindId==item.id>selected="selected"</#if> value="${item.id}">
				        	${item.name}
				        </option>
			        </#list>
			        </#if>
		        </select>
		    </th>
		    <th style="width:120px;">
		    	<select class="form-control" name="dataSource">
		        	<option value="" <#if !example.dataSource?? >selected="selected"</#if>>请选择</option>
		        	<#if otDataSourceList?exists>
			        <#list otDataSourceList as item>
				        <option <#if example.dataSource?? && example.dataSource==item.id>selected="selected"</#if> value="${item.id}">
				        	${item.name}
				        </option>
			        </#list>
			        </#if>
		        </select>
		    </th>
		    <th style="width:120px;">
		    	<select class="form-control" name="provinceId">
		        	<option value="" <#if !example.provinceId?? >selected="selected"</#if>>请选择</option>
		        	<#if otProvinceList?exists>
			        <#list otProvinceList as item>
				        <option <#if example.provinceId?? && example.provinceId==item.id>selected="selected"</#if> value="${item.id}">
				        	${item.name}
				        </option>
			        </#list>
			        </#if>
		        </select>
		    </th>
		    <th style="width:120px;"></th>
		    <th><input type="text" name="control" value="${example.control!}" class="form-control" style="width:100px;"/></th>
		</tr>
		</thead>
		<thead>
			<tr>
				<@seqTh page "defaultForm" "logDate" >日期</@seqTh>
				<@seqTh page "defaultForm" "kindId" >游戏</@seqTh>
				<@seqTh page "defaultForm" "dataSource" >数据源</@seqTh>
				<@seqTh page "defaultForm" "provinceId" >省份</@seqTh>
				<@seqTh page "defaultForm" "payAmount" >充值金额</@seqTh>
				<@seqTh page "defaultForm" "control" >管控情况</@seqTh>
			</tr>
		</thead>
	</table>
	
	
</div>
<div class="widget-content autoTbody">
	<table class="table table-striped table-bordered table-hover" style="min-width:800px;">
		<tbody>
	<#list page.items as item>
		<tr>
			<td>${item.logDate?date!}</td>
			<td>${item.kindName!}</td>
			<td>${item.dataSourceName!}</td>
			<td>${item.provinceName!}</td>
			<td>${item.payAmount?string("#.##")}</td>
			<td>${item.control!}</td>
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
		document.defaultForm.action="${siteUrl}/datacenter/makeprovinceExcel"; 
		defaultForm.submit();
	}
	
	function commitTable(){
		document.defaultForm.action="${siteUrl}/datacenter/provinceStatistics"; 
		defaultForm.submit();
	}
</script>