<%@page import="org.pac4j.springframework.security.authentication.*"%>
<%@page import="org.springframework.security.core.*"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.pac4j.core.context.*"%>
<%@page import="org.pac4j.core.profile.*"%>
<%@page import="org.pac4j.http.client.*"%>
<%@page import="org.pac4j.oauth.client.*"%>
<%@page import="org.pac4j.cas.client.*"%>
<%@page import="org.pac4j.openid.client.*"%>
<%
	WebContext context = new J2EContext(request, response); 
	FacebookClient fbClient = (FacebookClient) application.getAttribute("FacebookClient");
	TwitterClient twClient = (TwitterClient) application.getAttribute("TwitterClient");
	FormClient formClient = (FormClient) application.getAttribute("FormClient");
	BasicAuthClient baClient = (BasicAuthClient) application.getAttribute("BasicAuthClient");
	CasClient casClient = (CasClient) application.getAttribute("CasClient");
	MyOpenIdClient myopenidClient = (MyOpenIdClient) application.getAttribute("MyOpenIdClient");

    Google2Client google2Client = (Google2Client) application.getAttribute("Google2Client");
    YahooClient yahooClient = (YahooClient) application.getAttribute("YahooClient") ;
    WindowsLiveClient windowsLiveClient = (WindowsLiveClient) application.getAttribute("WindowsLiveClient");
    GitHubClient gitHubClient = (GitHubClient) application.getAttribute("GitHubClient");
%>
<h1>index</h1>
<a href="facebook/">Protected url by Facebook : facebook/index.gsp</a><br />
<a href="twitter/">Protected url by Twitter : twitter/index.gsp</a><br />
<a href="form/">Protected url by form authentication : form/index.gsp</a><br />
<a href="basicauth/">Protected url by basic auth : basicauth/index.gsp</a><br />
<a href="cas/">Protected url by CAS : cas/index.gsp</a><br />
<form action="myopenid/" method="POST">
  <input type="text" name="openIdUser" value="http://xxx.myopenid.com/" />
  <input type="submit" value="Protected url by myopenid.com : myopenid/index.gsp" />
</form>
<br />
<a href="/j_spring_security_logout">logout</a>
<br /><br />
<%Authentication auth = (Authentication) SecurityContextHolder.getContext().getAuthentication();
UserProfile profile = null;
if (auth != null && auth instanceof ClientAuthenticationToken) {
    ClientAuthenticationToken token = (ClientAuthenticationToken) auth; 
    profile = token.getUserProfile();
}
%>
profile : <%=profile%>
<br /><br />
<hr />
<a href="<%=fbClient.getRedirectionUrl(context)%>">Authenticate with Facebook</a><br />
<a href="<%=twClient.getRedirectionUrl(context)%>">Authenticate with Twitter</a><br />
<a href="<%=formClient.getRedirectionUrl(context)%>">Authenticate with form</a><br />

<a href="<%=google2Client.getRedirectionUrl(context)%>">Authenticate with Google</a><br />
<a href="<%=yahooClient.getRedirectionUrl(context)%>">Authenticate with Yahoo</a><br />
<a href="<%=windowsLiveClient.getRedirectionUrl(context)%>">Authenticate with WindowsLive</a><br />
<a href="<%=gitHubClient.getRedirectionUrl(context)%>">Authenticate with GitHub</a><br />
