<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>
<@c.page>
  <link rel="stylesheet" href="/static/signUpForm.css" />
    <title>Creative Colorlib SignUp Form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- Custom Theme files -->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!-- //Custom Theme files -->
    <!-- web font -->
    <link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">
    <!-- //web font -->
  <!-- main -->
  ${message?ifExists}
  <div class="main-w3layouts wrapper">
    <h1>Give us some information</h1>
    <div class="main-agileinfo">
      <div class="agileits-top">
        <form action="/registration" method="post">
          <input type="text" name="username" placeholder="Username"
                 value="<#if user??>${user.username}</#if>"
                 class="form-control ${(usernameError??)?string('is-invalid', '')}">
          <#if usernameError??>
            <div class="invalid-feedback">
              ${usernameError}
            </div>
          </#if>



          <input  type="email" name="email" placeholder="some@some.com"
                 value="<#if user??>${user.email}</#if>"
                 class="form-control ${(emailError??)?string('is-invalid', '')}">
          <#if emailError??>
            <div class="invalid-feedback">
              ${emailError}
            </div>
          </#if>


          <input  type="password" name="password" placeholder="Password"
                 class="form-control ${(passwordError??)?string('is-invalid', '')}">
          <#if passwordError??>
            <div class="invalid-feedback">
              ${passwordError}
            </div>
          </#if>
          <input  type="password" name="password2"
                 class="form-control ${(password2Error??)?string('is-invalid', '')}" placeholder="Confirm Password">
          <#if password2Error??>
            <div class="invalid-feedback">
              ${password2Error}
            </div>
          </#if>
          <div class="wthree-text">
            <label class="anim">
              <input type="checkbox" class="checkbox" required="">
              <span>I Agree To The Terms & Conditions</span>
            </label>
            <div class="clear"> </div>
          </div>
        <p>Don't have an Account? <a href="#"> Login Now!</a></p>
      <input type="hidden" name="_csrf" value="${_csrf.token}" />
      <input type="submit" value="SIGN UP">
          <div>
            <div class="g-recaptcha" data-sitekey="6Lc1CEkdAAAAAFexJRlaQjidBcIM5MxYB2I6f81i"></div>
            <#if captchaError??>
              <div class="alert alert-danger" role="alert">
                ${captchaError}
              </div>
            </#if>
          </div>
      </form>
    </div>
    <ul class="colorlib-bubbles">
      <li></li>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
    </ul>
  </div>
</@c.page>