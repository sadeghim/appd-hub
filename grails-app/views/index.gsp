<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="${grailsApplication.config.skin.layout}"/>
        <title>${grailsApplication.config.skin.orgNameLong}</title>
	</head>
	<body>
        <div style="margin: 20px 0;">
            <h2>${grailsApplication.config.skin.orgNameLong}</h2>
            <div style="margin: 10px 0;">
                Please note: access to the APPD requires you to be logged in and to have
                the appropriate access role. To request access to this service send an email to
                <a href="mailto:appd@phau.com.au?subject=Request access to APPD">appd@phau.com.au</a>,
                providing your email address, affiliation and reasons for requesting access.
            </div>

            <g:set var="loginLogout" value="${hf.loginLogout(loginReturnToUrl:g.createLink(uri:'/search',absolute:true))}"/>
            <g:if test="${loginLogout =~ /login/}">
                <div style="margin: 10px 0;">
                    Continue to  ${raw(loginLogout)} page.
                </div>
            </g:if>
            <g:else>
                Continue to <g:link uri='/search'>search page</g:link>
            </g:else>

        </div>

	</body>
</html>
