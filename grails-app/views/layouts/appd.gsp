<g:set var="orgNameLong" value="${grailsApplication.config.skin.orgNameLong}"/>
<g:set var="orgNameShort" value="${grailsApplication.config.skin.orgNameShort}"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <alatag:addApplicationMetaTags/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    %{--<link rel="shortcut icon" type="image/x-icon" href="favicon.ico">--}%

    <title><g:layoutTitle /></title>
    <r:require module="generic" />
    <style type="text/css">
    body {
        background-color: #ffffff !important;
    }
    #breadcrumb {
        margin-top: 10px;
    }
    #footer {
        margin: 20px;
        padding-top: 10px;
        border-top: 1px solid #CCC;
        font-size: 12px;
    }
    #content .nav-tabs > li.active > a {
        background-color: #ffffff;
    }
    .nav {
        margin-top: 20px;
    }
    body > #main-content {
        margin-top: 0px;
    }

    </style>
    <r:script disposition='head'>
        // initialise plugins
        jQuery(function(){
            // autocomplete on navbar search input
            jQuery("form#search-form-2011 input#search-2011, form#search-inpage input#search, input#search-2013").autocomplete('http://bie.ala.org.au/search/auto.jsonp', {
                extraParams: {limit: 100},
                dataType: 'jsonp',
                parse: function(data) {
                    var rows = new Array();
                    data = data.autoCompleteList;
                    for(var i=0; i<data.length; i++) {
                        rows[i] = {
                            data:data[i],
                            value: data[i].matchedNames[0],
                            result: data[i].matchedNames[0]
                        };
                    }
                    return rows;
                },
                matchSubset: false,
                formatItem: function(row, i, n) {
                    return row.matchedNames[0];
                },
                cacheLength: 10,
                minChars: 3,
                scroll: false,
                max: 10,
                selectFirst: false
            });

            // Mobile/desktop toggle
            // TODO: set a cookie so user's choice is remembered across pages
            var responsiveCssFile = $("#responsiveCss").attr("href"); // remember set href
            $(".toggleResponsive").click(function(e) {
                e.preventDefault();
                $(this).find("i").toggleClass("icon-resize-small icon-resize-full");
                var currentHref = $("#responsiveCss").attr("href");
                if (currentHref) {
                    $("#responsiveCss").attr("href", ""); // set to desktop (fixed)
                    $(this).find("span").html("Mobile");
                } else {
                    $("#responsiveCss").attr("href", responsiveCssFile); // set to mobile (responsive)
                    $(this).find("span").html("Desktop");
                }
            });

            $('.helphover').popover({animation: true, trigger:'hover'});
        });
    </r:script>
    <r:layoutResources/>
    <g:layoutHead />
</head>
<body class="${pageProperty(name:'body.class')?:'nav-collections'}" id="${pageProperty(name:'body.id')}" onload="${pageProperty(name:'body.onload')}">



<div class="navbar navbar-inverse navbar-static-top">
    <div class="navbar-inner ">
        <div class="container">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="brand" href="${g.createLink(uri:'/')}" style="">
                <g:img dir="images" file="pha_footer_logo.png"/>
            </a>
            <a class="brand" href="${g.createLink(uri:'/')}" style="font-size: 24px;color:#AAAAAA;line-height: 28px;">
                &nbsp;&nbsp;${raw(orgNameLong)}
            </a>
            <div class="nav-collapse collapse">
                <p class="navbar-text pull-right" style="line-height: 50px;">
                    <g:set var="loginId"><alatag:loggedInUserDisplayname/></g:set>
                    <a class="navbar-link" href="http://www.ala.org.au/my-profile/">${loginId}</a>
                    <g:if test="${loginId}">|</g:if>
                    <g:if test="${!pageProperty(name:'page.returnUrlPath')}">
                        %{--<g:set var="returnUrlPath" value="${grailsApplication.config.serverName}${request.requestURI}${request.queryString ? '?' : ''}"/>--}%
                        <g:set var="returnUrlPath" value="${g.createLink(uri:'/index', absolute:true)}"/>
                    </g:if>
                    <g:else>
                        <g:set var="returnUrlPath" value="${pageProperty(name:'page.returnUrlPath')}"/>
                    </g:else>
                    <hf:loginLogout logoutUrl="${request.contextPath}/logout/logout" logoutReturnToUrl="${returnUrlPath}"/>

                </p>
                %{--<p class="navbar-text pull-right">--}%
                    %{--Logged in as <a href="#" class="navbar-link">${username?:'unknown'}</a>--}%
                %{--</p>--}%
                %{--<ul class="nav hide">--}%
                    %{--<li class="active"><a href="#">Home</a></li>--}%
                    %{--<li><a href="#about">About</a></li>--}%
                    %{--<li><a href="#contact">Contact</a></li>--}%
                %{--</ul>--}%
            </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
    </div><!--/.navbar-inner -->
</div><!--/.navbar -->

<div class="container" id="main-content">
    <g:layoutBody />
</div><!--/.container-->

<div id="footer">
    <div class="container-fluid">
        <div class="row-fluid">
            <a href="http://creativecommons.org/licenses/by/3.0/au/" title="External link to Creative Commons"><img src="http://i.creativecommons.org/l/by/3.0/88x31.png" width="88" height="31" alt=""></a>
            This site is licensed under a <a href="http://creativecommons.org/licenses/by/3.0/au/" title="External link to Creative Commons" class="external">Creative Commons Attribution 3.0 Australia License</a>.
        Provider content may be covered by other <a href="#terms-of-use" title="Terms of Use">Terms of Use</a>.
        </div>
    </div>
</div><!--/#footer -->
<br/>

<!-- JS resources-->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-4355440-1', 'auto');
  ga('send', 'pageview');

</script>
<r:layoutResources/>
</body>
</html>
