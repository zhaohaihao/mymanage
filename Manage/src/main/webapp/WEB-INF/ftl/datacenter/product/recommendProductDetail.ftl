<#include "../../common/globalDef.ftl">
<div class="modal-content">
	<div class="modal-body">
		<form id="editModalForm" class="form-horizontal" role="form">
		<div class="padd">
		<div class="form quick-post">
			<@formTextReadOnly "产品名称" "example.productGame.gameName" "${example.productGame.gameName!}"/>
			<@formTextReadOnly "产品完成度" "example.productGame.progress" "${example.productGame.progress!}"/>
			<@formTextReadOnly "公司研发团队人数" "example.productGame.peopleNum" "${example.productGame.peopleNum!}"/>
			<@formTextReadOnly "立项思路：" "example.productGame.remark" "${example.productGame.remark!}"/>
			<@formTextReadOnly "全球代理价格" "example.productGame.priceGlobal" "${example.productGame.priceGlobal!}"/>
			<@formTextReadOnly "国内代理价格" "example.productGame.priceChina" "${example.productGame.priceChina!}"/>
			<@formTextReadOnly "海外代理价格" "example.productGame.priceOverseas" "${example.productGame.priceOverseas!}"/>
			<@formSelect2 "是否跟踪" >
				<select disabled="true" class="form-control" name="example.productGame.isTrace">
					<option value="" selected="selected">-请选择-</option> 
					<option value="1" <#if example.productGame.isTrace?exists&example.productGame.isTrace==1>selected</#if>>是</option> 
					<option value="2" <#if example.productGame.isTrace?exists&example.productGame.isTrace==2>selected</#if>>否</option> 
				</select>
			</@formSelect2>
			<@formSelect2 "是否代理" >
				<select disabled="true" class="form-control" name="example.productGame.isProxy">
					<option value="" selected="selected">-请选择-</option> 
					<option value="1" <#if example.productGame.isProxy?exists&example.productGame.isProxy==1>selected</#if>>是</option> 
					<option value="2" <#if example.productGame.isProxy?exists&example.productGame.isProxy==2>selected</#if>>否</option> 
				</select>
			</@formSelect2>
			<div class="form-group">
				<label class="control-label col-lg-2">投委会建议</label>
				<div class="col-lg-6">
					<textarea class="cleditor" style="overflow: hidden; resize: none; height: 268px;"  disabled="true" >${example.productGame.advice!}</textarea>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-lg-2">游戏截图</label>
				<div class="col-lg-10">
					<#list productPictureList as p>
						<a href="${p.pictureUrl}" target="_blank"><img style="width:60px;height:60px" src="${p.pictureUrl}"></a>
					</#list>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-lg-2">进度描述</label>
				<div class="col-lg-6">
					<textarea class="cleditor" disabled="true" >${example.productGame.gameDesc!}</textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-lg-2">标记完结</label>
				<div class="col-lg-1">
					<input type="checkbox" disabled="true" <#if example.productGame.isEnd?exists&example.productGame.isEnd==1>checked</#if>  class="form-control" name="example.productGame.isEnd"  id="example.productGame.isEnd" value="${example.productGame.isEnd!}" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-lg-2">谈判结果</label>
				<div class="col-lg-6">
					<textarea class="cleditor" disabled="true" name="example.productGame.result">${example.productGame.result!}</textarea>
				</div>
			</div>
		</div>
		</div>
		</form>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" onclick="layer.closeAll()">关闭</button>
	</div>
</div>



