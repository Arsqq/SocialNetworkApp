<#include "common.ftl">
<#include "security.ftl">
<#import "login.ftl" as l>
<link rel="stylesheet" href="static/style.css">
<nav class="navbar navbar-expand-lg" style="background-color: #e3f2fd;">
    <a class="navbar-brand" href="/">Sociality <i class="fab fa-twitter"></i></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link"  href="/home">Home <i class="fas fa-home"></i></a>
            </li>
            <#if user??>
            <li class="nav-item">
                <a class="nav-link" href="/main">Messages <i class="fas fa-envelope-open-text"></i></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/user-messages/${currentUserId}">My messages <i class="fas fa-address-book"></i></a>
            </li>
            </#if>
            <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link" href="/user">User list <i class="fas fa-th-list"></i></a>
                </li>
            </#if>
            <#if user??>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                       Settings</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="/user/profile">Profile</a>
                        <div class="dropdown-divider"></div>
                    </div>
                </li>
            </#if>
        </ul>

        <div class="navbar-text mr-3"><#if user??>${name}<#else>Please,log in</#if></div>
        <@l.logout />
    </div>
</nav>