<#include "../../../common/globalDef.ftl">
<@simpleEdit "修改平台" "${siteUrl}/datacenter/import/platformEdit">

<@formTextReadOnly "平台编号" "id" "${example.id!}"/>
<@formText "平台名称" "name" "${example.name!}"/>
</@simpleEdit>