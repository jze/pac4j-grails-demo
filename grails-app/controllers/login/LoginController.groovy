package login

import org.pac4j.springframework.security.authentication.ClientAuthenticationToken
import org.springframework.security.core.context.SecurityContextHolder
import grails.converters.*

import org.pac4j.springframework.security.authentication.*
import org.springframework.security.core.*
import org.springframework.security.core.context.SecurityContextHolder
import org.pac4j.core.context.*
import org.pac4j.core.profile.*
import org.pac4j.http.client.*
import org.pac4j.oauth.client.*
import org.pac4j.cas.client.*
import org.pac4j.openid.client.*

import static login.SpringUtil.*

class LoginController {

    SecurityContextHolder sch

	def index() {
		render "HelloWorld"
	}

	def applicationContext() {
		def bean = getBean("servletContextAttributeExporter")
		
		if(!bean.getProperties().empty)
			for(s in bean.getProperties())
				println s
	}


    def param(){
             //test id of controller action
             render params.id
    }

    def auth(){
        WebContext context = new J2EContext(request, response);
        FacebookClient fbClient = (FacebookClient)getBean("servletContextAttributeExporter").getProperties().get("FacebookClient")


        ClientAuthenticationToken token = (ClientAuthenticationToken) SecurityContextHolder.getContext().getAuthentication();
        render token.getUserProfile()
    }

    def profile(){

        Authentication auth = (Authentication) SecurityContextHolder.getContext().getAuthentication();
        UserProfile profile = null;
        if (auth != null && auth instanceof ClientAuthenticationToken) {
            ClientAuthenticationToken token = (ClientAuthenticationToken) auth;
            profile = token.getUserProfile();
            render profile
        }

        render "no profile"
    }


	

}


