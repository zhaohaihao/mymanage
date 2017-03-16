<#include "../../../common/globalDef.ftl">
<@simpleEdit "修改渠道" "${siteUrl}/datacenter/import/mainChannelEdit">

<@formTextReadOnly "渠道号" "id" "${example.id!}"/>
<@formText "渠道名" "name" "${example.name!}"/>
</@simpleEdit>