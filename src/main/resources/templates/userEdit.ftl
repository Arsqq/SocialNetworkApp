<#import "parts/common.ftl" as c>

<@c.page>


<H1>User Editor</H1>

    <form action="/user" method="post">

        <#list roles as role>
            <div>
              <label> <input type="checkbox" name="${role}" ${user.roles?
                  seq_contains(role)?string("checked", " ")}>${role}</label>
            </div>
        </#list>

        <input type="hidden" value="${user.id}" name="userId    ">
        <input type="text" value="${user.username}" name="username">
        <input type="hidden" value="${_csrf.token}"  name="_csrf">
        <button type="submit">Save</button>

    </form>





</@c.page>