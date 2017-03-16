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


<form name="defaultForm" id="productForm" action="${siteUrl}/datacenter/recommendProductListPage" method="post" >

<div class="widget-head">
	<div class="pull-left">
		<input type="submit"  class="btn btn-success" value="搜索">
		<input type="button" class="btn btn-success" onclick="notEnd()" value="未完结进度">
		<input type="hidden" name="example.productGame.isEnd">
	</div>
	<div class="pull-right">
		<button  type="button" class="btn btn-default" onclick="delAll()" >批量删除</button>
		<button  type="button" class="btn btn-default" onclick="ClearForm('defaultForm')">重置</button>
	</div>
	<div class="clearfix"></div>
</div>

<div class="widget-content autoHeader">
	<table class="table table-striped table-bordered table-hover" style="min-width:1631px;">
		<thead class="fixedHeader">
		<tr>
			<th style="width:64px;"></th>
			<th style="width:66px;"></th>
			<th style="width:182px;"><@shDateBeginEnd "createTimeSh" example.createTimeSh! /></th>
			<th style="width:111px;"><input type="text" class="form-control" name="example.productGame.gameName"/></th>
			<th style="width:106px;">
				<select class="form-control" name="example.productGame.typeId">
					<option value="" selected="selected">-请选择-</option> 
					<#list productTypeList as item>
						<option value="${item.typeId}">${item.typeName}</option>
					</#list>
				</select>
			</th>
			<th style="width:82px;"></th>
			<th style="width:66px;"></th>
			<th style="width:66px;"></th>
			<th style="width:106px;">
				<select class="form-control" name="example.productGame.isTrace">
					<option value="">--请选择--</option>
					<option value="1">是</option>
					<option value="2">否</option>
				</select>
			</th>
			<th style="width:200px;"></th>
			<th style="width:200px;"></th>
			<th style="width:106px;">
				<select class="form-control" name="example.productGame.isProxy">
					<option value="">--请选择--</option>
					<option value="1">是</option>
					<option value="2">否</option>
				</select>
			</th>
			<th style="width:67px;"></th>
			<th style="width:100px;"></th>
			<th style="width:145px;"></th>
		</tr>
		</thead>
		<thead>
			<tr>
				<th><input type="checkbox" name="firstId" id="firstId" /></th>
				<th>序号</th>
				<th>推荐日期</th>
				<th>产品</th>
				<th>类型</th>
				<th>全球</th>
				<th>国内</th>
				<th>海外</th>
				<th>是否跟踪</th>
				<th>投委会建议</th>
				<th>谈判结果</th>
				<th>是否代理</th>
				<th>进度</th>
				<th>联系方式</th>
				<th>操作</th>
			</tr>
		</thead>
	</table>
</div>

<div class="widget-content autoTbody" >
	<table class="table table-striped table-bordered table-hover" style="min-width:1631px;">
		<tbody>
			<#list page.items as item>
				<tr> 
					<td><input type="checkbox" name="subId" value="${item.companyId!}"/></td>
					<td>${item.companyId!}</td>
					<td>${(item.createTime?string('yyyy-MM-dd'))!}</td>
					<td>${item.productGame.gameName!}</td>
					<td>${item.productGame.productType.typeName!}</td>
					<td>${item.productGame.priceGlobal!}</td>
					<td>${item.productGame.priceChina!}</td>
					<td>${item.productGame.priceOverseas!}</td>
					<td><#if item.productGame.isTrace?exists&item.productGame.isTrace==1>是<#else>否</#if></td>
					<td title="${item.productGame.advice!}"><#if item.productGame.advice!?length lt 10>${item.productGame.advice!}<#else> ${item.productGame.advice[0..11]}</#if></td>
					<td title="${item.productGame.result!}"><#if item.productGame.result!?length lt 10>${item.productGame.result!}<#else> ${item.productGame.result[0..11]}</#if></td>
					<td><#if item.productGame.isProxy?exists&item.productGame.isProxy==1>是<#else>否</#if></td>
					<td><#if item.productGame.isEnd?exists&item.productGame.isEnd==1>已完结<#else>${item.productGame.progress!}</#if></td>
					<td><a href="${siteUrl}/datacenter/productListPage">${item.contactPhone!}</a></td>
					<td>
							<input type="button" class="btn btn-xs btn-success" onclick="showSimplePop('${siteUrl}/datacenter/recommendProductDetailPage/${item.companyId!}','详情')" value="详情">
							<input type="button" class="btn btn-xs btn-warning" onclick="showSimplePop('${siteUrl}/datacenter/recommendProductEditPage/${item.companyId!}','修改')" value="修改">
							<input type="button" class="btn btn-xs btn-danger" onclick="deleteConfirm('productForm','${siteUrl}/datacenter/recommendProductDel/${item.companyId!}')" value="删除">
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

<script>
	function delAll(){
			var sub=$("input[name='subId']");
			var ids=new Array();
			for(var i=0;i<sub.length;i++){
				var status=$(sub[i]).prop("checked");
				if(status){
					ids.push($(sub[i]).val());
				}
			}
			
			if(ids==null||ids==""){
				alert("请选择删除内容");
			}else{
				if(confirm("您真的要删除吗？")){
					$.post("${siteUrl}/datacenter/recommendProductDelAll?ids="+ids,function(jsonData){
						window.location.href="recommendProductListPage";
					});
				}
			}
		}
		
	function notEnd(){
		$("input[name='example.productGame.isEnd']").val(2);
		$("#productForm").submit();
	}
		
	$(function(){
		$("input[name='firstId']").click(function(){
			var status=$(this).prop("checked");
			if(status){
				$("input[name='subId']").prop("checked",true);
			}else{
				$("input[name='subId']").prop("checked",false);
			}
		});
	});
</script>
