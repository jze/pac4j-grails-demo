<%@page import="grails.converters.JSON; org.pac4j.springframework.security.authentication.ClientAuthenticationToken"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<h1>protected area</h1>
<a href="..">Back</a><br />
<br /><br />
<% ClientAuthenticationToken token = (ClientAuthenticationToken) SecurityContextHolder.getContext().getAuthentication();

    String mail = token.getUserProfile().attributes.get("email")
    String first_name = token.getUserProfile().attributes.get("first_name")
    String last_name = token.getUserProfile().attributes.get("last_name")
%>
profile : <%=token.userProfile.attributes%><br />   <br />

<g:link controller="user" action="create" params="[email:mail, firstName:first_name, lastName:last_name, provider:token.clientName]"> register</g:link>  <br/>

