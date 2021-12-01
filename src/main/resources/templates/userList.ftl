<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
<@c.page>

    <link rel="stylesheet" href="static/table.css">
    <h1>User List</h1>
    <div class="tbl-header">
<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Role</th>
            <th>Operation</th>
        </tr>
            </thead>
        </table>
    </div>

    <div class="tbl-content">
    <table>
        </tbody>
    <#list users as user>
        <tr>
            <td>${user.username}</td>
            <td><#list user.roles as role>${role}<#sep>,</#list ></td>
            <td><a href="/user/${user.id}" >
                    <i class="fas fa-edit"></i>
                </a> </td>
        </tr>
    </#list>
            <tbody>
        </table>
    </div>
</@c.page>