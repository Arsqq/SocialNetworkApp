<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
<@c.page>
    <link rel="stylesheet" href="static/style.css">
    <h1 class="header">List Of Users</h1>
<table class="table  table-bordered table-dark">
    <thead>
        <tr class="table-info">
            <th>Name</th>
            <th>Role</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
    <#list users as user>
         <#if isAdmin??>
        <tr>
            <td class="table-success">${user.username}</td>
            <td class="table-warning"><#list user.roles as role>${role}<#sep>,</#list ></td>
            <td class="table-danger"><a href="/user/${user.id}">edit</a> </td>
        </tr>
                <#else>
                    <tr>
                        <td class="success">${user.username}</td>
                        <td class="table-warning"><#list user.roles as role>${role}<#sep>,</#list ></td>
                        <td><a href="/user/${user.id}">edit</a> </td>
                    </tr>
          </#if>
    </#list>
    </tbody>
</table>

</@c.page>