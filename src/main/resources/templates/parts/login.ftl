<#include "security.ftl">
<#macro login path isRegisterForm>
    <link rel="stylesheet" href="/static/formStyle.css">
    <link rel="stylesheet" href="/static/backForMessagesAndProfile.css">
    <div class="overlay">
        <form class="my-form" action="${path}" method="post">
            <div class="con">
                <header class="head-form">
                    <h2>Log In</h2>
                    <p>login here using your username and password</p>
                </header>
                <br>
                <div class="field-set">
                 <span class="input-item">
             <i class="fa fa-user-circle"></i>
                </span>
                    <!--   user name Input-->
                    <input type="text"  id="txt-input"
                           class="form-input" name="username" placeholder="Username"
                           value="<#if user??>${user.username}</#if>">

                    <br>
                    <span class="input-item">
          <i class="fa fa-key"></i>
         </span>
                    <!--   Password Input-->
                    <input  type="password"
                            placeholder="Password" id="pwd"
                            name="password"
                            class="form-input">
                    <span>
          <i class="fa fa-eye" aria-hidden="true"   id="eye" onclick="showHide()"></i>
                        <script type="text/javascript">
                            const password=document.getElementById('pwd');
                            const toggle=document.getElementById('eye');
                            function showHide(){
                                if(password.type==='password'){
                                    password.setAttribute('type','text');
                                    toggle.classList.add('hide')
                                }
                                else{
                                    password.setAttribute('type','password');
                                    toggle.classList.remove('hide')
                                }
                            }
                        </script>



                </span>
                    <br>
                    <!--        buttons -->
                    <!--      button LogIn -->
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <button class="button-custom" type="submit"> Log In </button>
                </div>
                <!--   other buttons -->
                <div class="other">
                    <!--      Forgot Password button-->
                    <!--     Sign Up button -->
                    <a class="btn submits sign-up" href="/registration">Sign Up
                        <!--         Sign Up font icon -->
                        <i class="fa fa-user-plus" aria-hidden="true"></i>
                    </a>
                    <!--      End Other the Division -->
                </div>
                <!--   End Conrainer  -->
            </div>

        </form>
    </div>
</#macro>
<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="container-button" type="submit"><#if user??>Sign out <i class="fas fa-sign-out-alt"></i><#else>Log in <i class="fas fa-sign-out-alt"></i></#if></button>

    </form>
</#macro>