<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
<@c.page>
    <link rel="stylesheet" href="static/table.css">
    <link rel="stylesheet" href="static/btn.css">
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
            <td>
                <div class="row">
                <button class="btn" onclick=window.location.href="/user/${user.id}">
                    <i class="fas fa-edit"></i>
                </button>
                <form action="/user/${user.id}" method="post">
                    <button type="submit" value="delete" class="btn">
                        <i class="fa fa-trash"></i>
                    </button>
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                </form>
                </div>
            </td>
        </tr>
    </#list>
            <tbody>
        </table>
    </div>
</@c.page>