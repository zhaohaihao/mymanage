<#include "../../common/globalDef.ftl">
<@simpleEdit "修改产品详情" "${siteUrl}/datacenter/recommendProductEdit">

<@formTextHidden "example.companyId" "${example.companyId!}" />
<@formTextHidden "example.productGame.gameId" "${example.productGame.gameId!}" />
<@formText2 "产品名称" "example.productGame.gameName" "${example.productGame.gameName!}"/>
<@formText2 "产品完成度" "example.productGame.progress" "${example.productGame.progress!}"/>
<@formText2 "公司研发团队人数" "example.productGame.peopleNum" "${example.productGame.peopleNum!}"/>
<@formTextEditer "立项思路：" "example.productGame.remark" "${example.productGame.remark!}"/>
<@formText2 "全球代理价格" "example.productGame.priceGlobal" "${example.productGame.priceGlobal!}"/>
<@formText2 "国内代理价格" "example.productGame.priceChina" "${example.productGame.priceChina!}"/>
<@formText2 "海外代理价格" "example.productGame.priceOverseas" "${example.productGame.priceOverseas!}"/>
<@formSelect2 "是否跟踪" >
	<select class="form-control" name="example.productGame.isTrace">
		<option value="" selected="selected">-请选择-</option> 
		<option value="1" <#if example.productGame.isTrace?exists&example.productGame.isTrace==1>selected</#if>>是</option> 
		<option value="2" <#if example.productGame.isTrace?exists&example.productGame.isTrace==2>selected</#if>>否</option> 
	</select>
</@formSelect2>
<@formSelect2 "是否代理" >
	<select class="form-control" name="example.productGame.isProxy">
		<option value="" selected="selected">-请选择-</option> 
		<option value="1" <#if example.productGame.isProxy?exists&example.productGame.isProxy==1>selected</#if>>是</option> 
		<option value="2" <#if example.productGame.isProxy?exists&example.productGame.isProxy==2>selected</#if>>否</option> 
	</select>
</@formSelect2>
<@formTextEditer "投委会建议" "example.productGame.advice" "${example.productGame.advice!}"/>
<div class="form-group">
	<div class="col-lg-10">
		<input type="button" value="删除"  id="fileDel"/>
		<ul style="margin-left:60px">
			<#list productPictureList as p>
				<li><a href="${p.pictureUrl}" target="_blank"><img style="width:60px;height:60px" src="${p.pictureUrl}"></a><input type="checkbox" name="fileName" value="${p.pictureId}"/></li>
			</#list>
		</ul>
	</div>
</div>
<@formProductUpdateImg "上传游戏截图" "rpicName" />
<@formTextEditer "进度描述" "example.productGame.gameDesc" "${example.productGame.gameDesc!}"/>
<div class="form-group">
	<label class="control-label col-lg-2">标记完结</label>
	<div class="col-lg-1">
		<input type="checkbox" <#if example.productGame.isEnd?exists&example.productGame.isEnd==1>checked</#if>  class="form-control" name="example.productGame.isEnd"  id="example.productGame.isEnd" value="1" />
	</div>
</div>
<@formTextEditer "谈判结果" "example.productGame.result" "${example.productGame.result!}"/>
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
				$.post("${siteUrl}/datacenter/filePicDelete?ids="+ids,function(jsonData){
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
