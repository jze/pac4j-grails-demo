<%@page import="org.pac4j.springframework.security.authentication.ClientAuthenticationToken"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<h1>protected area</h1>
<a href="..">Back</a><br />
<br /><br />
<% ClientAuthenticationToken token = (ClientAuthenticationToken) SecurityContextHolder.getContext().getAuthentication(); %>
profile : <%=token.getUserProfile()%><br />   <br />

<g:link controller="user" action="create" params="[email:'123@123.de', name:'peter']"> register</g:link>
