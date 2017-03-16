<#include "../../common/globalDef.ftl">
<@simpleEdit "修改产品" "${siteUrl}/datacenter/productEdit">

<@formTextHidden "example.companyId" "${example.companyId!}" />
<@formTextHidden "example.productGame.gameId" "${example.productGame.gameId!}" />
<@formText2 "公司名称" "example.companyName" "${example.companyName!}" />
<@formText2 "公司地址" "example.companyAddress" "${example.companyAddress!}"/>
<@formText2 "联系人" "example.companyPerson" "${example.companyPerson!}"/>
<@formText2 "职务" "example.personPosition" "${example.personPosition!}"/>
<@formText2 "联系方式" "example.contactPhone" "${example.contactPhone!}"/>
<@formText2 "QQ" "example.contactQq" "${example.contactQq!}"/>
<@formText2 "微信" "example.contactWx" "${example.contactWx!}"/>
<@formText2 "产品名称" "example.productGame.gameName" "${example.productGame.gameName!}"/>
<@formSelect2 "分类" >
	<select class="form-control" name="example.productGame.typeId">
		<option value="" selected="selected">-请选择-</option> 
		<#list productTypeList as item>
			<option value="${item.typeId}" <#if example.productGame.typeId?exists&example.productGame.typeId==item.typeId>selected</#if>>${item.typeName}</option>
		</#list>
	</select>
</@formSelect2>
<@formSelect2 "单机/网游" >
	<select class="form-control" name="example.productGame.isOnline">
		<option value="" selected="selected">-请选择-</option> 
		<option value="1" <#if example.productGame.isOnline?exists&example.productGame.isOnline==1>selected</#if>>单机</option> 
		<option value="2" <#if example.productGame.isOnline?exists&example.productGame.isOnline==2>selected</#if>>网游</option> 
	</select>
</@formSelect2>
<@formText2 "评测分数" "example.productGame.testScore" "${example.productGame.testScore!}"/>
<@formSelect2 "是否推荐" >
	<select class="form-control" name="example.productGame.isRecommend">
		<option value="" selected="selected">-请选择-</option> 
		<option value="1" <#if example.productGame.isRecommend?exists&example.productGame.isRecommend==1>selected</#if>>是</option> 
		<option value="2" <#if example.productGame.isRecommend?exists&example.productGame.isRecommend==2>selected</#if>>否</option> 
	</select>
</@formSelect2>
<div class="form-group">
	<div class="col-lg-6">
		<input type="button" value="删除"  id="fileDel"/>
		<ul style="margin-left:60px">
			<#list productPackageList as p>
				<li>${p.packageName}<input type="checkbox" name="fileName" value="${p.packageId}"/></li>
			</#list>
		</ul>
		
	</div>
</div>
<@formFile "上传产品" "picName" />
<@formText2 "下载地址" "example.productGame.downloadUrl" "${example.productGame.downloadUrl!}"/>
<@formTextEditer "简介" "example.productGame.introduction" "${example.productGame.introduction!}"/>
<@formTextEditer "审核结果" "example.productGame.checkResult" "${example.productGame.checkResult!}"/>

</@simpleEdit>

<script>
	$(function(){
		$("#fileDel").click(function(){
			var sub=$("input[name='fileName']");
			var ids=new Array();
			for(var i=0;i<sub.length;i++){
				var status=$(sub[i]).prop("checked");
				if(status){
					ids.push($(sub[i]).val());
				}
			}
			if(ids==null||ids==""){
				alert("请选择删除的文件");
			}else{
				$.post("${siteUrl}/datacenter/fileDelete?ids="+ids,function(jsonData){
					if(jsonData==1){
						var sub=$("input[name='fileName']");
						for(var i=0;i<sub.length;i++){
							var status=$(sub[i]).prop("checked");
							if(status){
								$(sub[i]).parent().remove();
							}
						}
						alert("删除成功");
					}else{
						alert("删除失败");
					}
				});
			}
		});
	});
</script>