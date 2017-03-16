<#include "../../../common/globalDef.ftl">
<@simpleEdit "修改平台" "${siteUrl}/datacenter/platformEdit">

<@formTextReadOnly "平台编号" "platform" "${example.platform!}"/>
<@formText "平台名称" "platformName" "${example.platformName!}"/>

</@simpleEdit>