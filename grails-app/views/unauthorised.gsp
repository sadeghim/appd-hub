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

<g:if test="${flash.message}">

  <h2> ${flash.message} </h2>

</g:if>

</body>
</html>