<#import "parts/common.ftl" as c>

<@c.page>
<h3>@{userChannel.username}</h3>
<div>${type}</div>
<ul class="list-group">
    <#list users as user>
        <li class="list-group-item"></li>
            <a href="/user-messages/${user.id}">${user.getUserName()}</a>
    </#list>
</ul>

</@c.page>