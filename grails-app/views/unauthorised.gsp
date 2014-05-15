<%--
  Created by IntelliJ IDEA.
  User: car61w
  Date: 25/03/14
  Time: 3:47 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <parameter name="returnUrlPath" value="${grailsApplication.config.grails.serverURL}"/>
    <title>${grailsApplication.config.skin.orgNameLong}</title>
    <meta name="layout" content="${grailsApplication.config.skin.layout}"/>
</head>

<body>
<h1>Unauthorised</h1>
<g:if test="${flash.message}">
    <h4>${flash.message}</h4>
</g:if>
<g:else>
</g:else>
<g:set var="loginLogout" value="${hf.loginLogout(loginReturnToUrl:g.createLink(uri:'/index',absolute:true))}"/>
<g:if test="${loginLogout =~ /login/}">
    Please ${raw(loginLogout)}
</g:if>
%{--<hf:loginLogout loginReturnToUrl="${request.contextPath}/index" logoutUrl="${request.contextPath}/logout/logout" logoutReturnToUrl="${request.contextPath}/"/>--}%

</body>
</html>