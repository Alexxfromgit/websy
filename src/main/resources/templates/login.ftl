<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    ${message?ifExists}
<#--Login Page-->
    <@l.login "/login" false/>
</@c.page>