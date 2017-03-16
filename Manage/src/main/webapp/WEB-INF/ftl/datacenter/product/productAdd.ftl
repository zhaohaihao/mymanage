<#include "../../common/globalDef.ftl">
<@simpleAdd "新增游戏" "${siteUrl}/datacenter/productAdd">

<div class="form-group">
	<label class="control-label col-lg-2">公司名称</label>
	<div class="col-lg-6">
		<input type="text" class="form-control validate[required]" name="example.companyName" id="example.companyName" value=""/>
	</div>
</div>
<div class="form-group">
	<label class="control-label col-lg-2">公司地址</label>
	<div class="col-lg-6">
		<input type="text" class="form-control validate[required]" name="example.companyAddress" id="example.companyAddress" value=""/>
	</div>
</div>
<div class="form-group">
	<label class="control-label col-lg-2">联系人</label>
	<div class="col-lg-6">
		<input type="text" class="form-control validate[required]" name="example.companyPerson" id="example.companyPerson" value=""/>
	</div>
</div>
<div class="form-group">
	<label class="control-label col-lg-2">职务</label>
	<div class="col-lg-6">
		<input type="text" class="form-control validate[required]" name="example.personPosition" id="example.personPosition" value=""/>
	</div>
</div>
<div class="form-group">
	<label class="control-label col-lg-2">联系方式</label>
	<div class="col-lg-6">
		<input type="text" class="form-control validate[required]" name="example.contactPhone" id="example.contactPhone" value=""/>
	</div>
</div>
<div class="form-group">
	<label class="control-label col-lg-2">QQ</label>
	<div class="col-lg-6">
		<input type="text" class="form-control validate[required]" name="example.contactQq" id="example.contactQq" value=""/>
	</div>
</div>
<div class="form-group">
	<label class="control-label col-lg-2">微信</label>
	<div class="col-lg-6">
		<input type="text" class="form-control validate[required]" name="example.contactWx" id="example.contactWx" value=""/>
	</div>
</div>
<div class="form-group">
	<label class="control-label col-lg-2">产品名称</label>
	<div class="col-lg-6">
		<input type="text" class="form-control validate[required]" name="example.productGame.gameName" id="example.productGame.gameName" value=""/>
	</div>
</div>
<@formSelect2 "分类" >
	<select class="form-control validate[required]" name="example.productGame.typeId">
		<option value="" selected="selected">-请选择-</option> 
		<#list productTypeList as item>
			<option value="${item.typeId}">${item.typeName}</option>
		</#list>
	</select>
</@formSelect2>
<@formSelect2 "单机/网游" >
	<select class="form-control validate[required]" name="example.productGame.isOnline">
		<option value="" selected="selected">-请选择-</option> 
		<option value="1">单机</option> 
		<option value="2">网游</option> 
	</select>
</@formSelect2>
<div class="form-group">
	<label class="control-label col-lg-2">评测分数</label>
	<div class="col-lg-6">
		<input type="text" class="form-control validate[required]" name="example.productGame.testScore" id="example.productGame.testScore" value=""/>
	</div>
</div>
<@formSelect2 "是否推荐" >
	<select class="form-control validate[required]" name="example.productGame.isRecommend">
		<option value="" selected="selected">-请选择-</option> 
		<option value="1">是</option> 
		<option value="2">否</option> 
	</select>
</@formSelect2>
<@formFile "上传产品" "picName" />
<div class="form-group">
	<label class="control-label col-lg-2">下载地址</label>
	<div class="col-lg-6">
		<input type="text" class="form-control validate[required]" name="example.productGame.downloadUrl" id="example.productGame.downloadUrl" value=""/>
	</div>
</div>
<@formTextEditer "简介" "example.productGame.introduction" />
<@formTextEditer "审核结果" "example.productGame.checkResult" />
</@simpleAdd>

