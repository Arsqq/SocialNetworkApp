<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
<@c.page>
    <link rel="stylesheet" href="static/style.css">
    <div class="header">
           <#if
           user??><h0> WELCOME,${user.username}</h0>
               <#else>   <h0> WELCOME,GUEST</h0>
           </#if>

       <div class="header2">
           <h0>Enjoy your stay</h0>
       </div>
    </div>
</@c.page>
