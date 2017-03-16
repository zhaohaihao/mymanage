<#include "../../common/globalDef.ftl">
<@simpleList 1800>

<form name="defaultForm" id="productForm" action="${siteUrl}/datacenter/productListPage" method="post" >

<div class="widget-head">
	<div class="pull-left">
		<input type="submit" class="btn btn-success" value="搜索">
		<input type="button" class="btn btn-success" onclick="showSimplePop('${siteUrl}/datacenter/productAddPage','添加游戏')" value="添加">
	</div>
	<div class="pull-right">
		<button  type="button" class="btn btn-default" onclick="delAll()" >批量删除</button>
		<button  type="button" class="btn btn-default" onclick="ClearForm('defaultForm')">重置</button>
	</div>
	<div class="clearfix"></div>
</div>

<div class="widget-content autoHeader">
	<table class="table table-striped table-bordered table-hover" style="min-width:1750px;">
		<thead class="fixedHeader">
		<tr>
			<th style="width:100px;"></th>
			<th style="width:100px;"></th>
			<th style="width:100px;"><@shDateBeginEnd "createTimeSh" example.createTimeSh! /></th>
			<th><input type="text" style="width:150px;" name="example.companyAddress" value="${example.companyAddress!}" class="form-control" /></th>
			<th><input type="text" name="example.companyName" value="${example.companyName!}" style="width:150px;" class="form-control" /></th>
			<th><input type="text" name="example.companyPerson" style="width:60px;" value="${example.companyPerson!}" class="form-control"/></th>
			<th style="width:120px;"></th>
			<th style="width:120px;"></th>
			<th style="width:120px;"></th>
			<th style="width:120px;"></th>
			<th><input type="text" style="width:120px;" class="form-control" name="example.productGame.gameName" /></th>
			<th>
				<select class="form-control" style="width:80px;" name="example.productGame.typeId">
					<option value="" selected="selected">-请选择-</option> 
					<#list productTypeList as item>
						<option value="${item.typeId}" <#if example.productGame??&&example.productGame.typeId??&& example.productGame.typeId=item.typeId>selected="selected"</#if>>${item.typeName}</option>
					</#list>
				</select>
			</th>
			<th>
				<select class="form-control" style="width:80px;" name="example.productGame.isOnline">
					<option value="">--请选择--</option>
					<option value="1" <#if example.productGame??&&example.productGame.isOnline??&& example.productGame.isOnline=1>selected="selected"</#if>>单机</option>
					<option value="2" <#if example.productGame??&&example.productGame.isOnline??&& example.productGame.isOnline=2>selected="selected"</#if>>网游</option>
				</select>
			</th>
			<th>
				<input type="text" class="form-control"  style="width:30px;display:inline" name="testScore_begin"/>—<input type="text" style="width:30px;display:inline" name="testScore_end"/>
			</th>
			<th>
				<select style="width:60px;" class="form-control" name="example.productGame.isRecommend">
					<option value="">--请选择--</option>
					<option value="1" <#if example.productGame??&& example.productGame.isRecommend??&& example.productGame.isRecommend=1>selected="selected"</#if>>是</option>
					<option value="2" <#if example.productGame??&& example.productGame.isRecommend??&& example.productGame.isRecommend=2>selected="selected"</#if>>否</option>
				</select>
			</th>
			<th>
				<input type="text" style="width:100px;" class="form-control" name="example.productGame.introduction" />
			</th>
			<th>
				<input type="text" style="width:50px;"  class="form-control" name="example.createPerson" value="${example.createPerson!}"/>
			</th>
			<th>
				<input type="text" style="width:100px;" class="form-control" name="example.productGame.checkResult"/>
			</th>
			<th style="width:500px;">
			</th>
		</tr>
		</thead>
		<thead>
			<tr>
				<th><input type="checkbox" name="firstId" id="firstId" /></th>
				<th>序号</th>
				<th>登记日期</th>
				<th>地址</th>
				<th>公司</th>
				<th>联系人</th>
				<th>职务</th>
				<th>联系方式</th>
				<th>QQ</th>
				<th>微信</th>
				<th>产品</th>
				<th>类别</th>
				<th>单机/网游</th>
				<th>初测评分</th>
				<th>是否推荐</th>
				<th>简介</th>
				<th>登记人</th>
				<th>审核结果</th>
				<th>操作</th>
			</tr>
		</thead>
		
	</table>
	
	
</div>

<div class="widget-content autoTbody" >
	<table class="table table-striped table-bordered table-hover" style="min-width:1750px;">
		<tbody>
			<#list page.items as item>
				<tr> 
					<td><input type="checkbox" name="subId" value="${item.companyId!}"/></td>
					<td>${item.companyId!}</td>
					<td>${(item.createTime?string('yyyy-MM-dd'))!}</td>
					<td>${item.companyAddress!}</td>
					<td>${item.companyName!}</td>
					<td>${item.companyPerson!}</td>
					<td>${item.personPosition!}</td>
					<td>${item.contactPhone!}</td>
					<td>${item.contactQq!}</td>
					<td>${item.contactWx!}</td>
					<td>${item.productGame.gameName!}</td>
					<td>${item.productGame.productType.typeName!}</td>
					<td><#if item.productGame.isOnline==1>单机<#else>网游</#if></td>
					<td>${item.productGame.testScore!}</td>
					<td><#if item.productGame.isRecommend==1>是<#else>否</#if></td>
					<td title="${item.productGame.introduction!}"><#if item.productGame.introduction!?length lt 10>${item.productGame.introduction}<#else> ${item.productGame.introduction[0..11]}</#if></td>
					<td>${item.createPerson!}</td>
					<td title="${item.productGame.checkResult!}"><#if item.productGame.checkResult!?length lt 10>${item.productGame.checkResult}<#else> ${item.productGame.checkResult[0..11]}</#if></td>
					<td>
							<input type="button" class="btn btn-xs btn-success" onclick="showSimplePop('${siteUrl}/datacenter/productDownLoadPage/${item.companyId!}','下载')" value="下载">
							<input type="button" class="btn btn-xs btn-warning" onclick="showSimplePop('${siteUrl}/datacenter/productEditPage/${item.companyId!}','修改')" value="修改">
							<input type="button" class="btn btn-xs btn-danger" onclick="deleteConfirm('productForm','${siteUrl}/datacenter/productDel/${item.companyId!}')" value="删除">
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
					$.post("${siteUrl}/datacenter/productDelAll?ids="+ids,function(jsonData){
						window.location.href="productListPage";
					});
				}
			}
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
