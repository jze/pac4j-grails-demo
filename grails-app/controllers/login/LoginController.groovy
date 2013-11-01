package login

import org.pac4j.springframework.security.authentication.ClientAuthenticationToken
import org.springframework.security.core.context.SecurityContextHolder
import grails.converters.*

class LoginController {


	def index() {
		render "HelloWorld"
	}

	def applicationContext() {
		def bean = SpringUtil.getBean("servletContextAttributeExporter")
		
		if(!bean.getProperties().empty)
			for(s in bean.getProperties())
				println s
	}

	
	def facebook(){
		ClientAuthenticationToken token = (ClientAuthenticationToken) SecurityContextHolder.getContext().getAuthentication();
		def profile = token.getUserProfile();
		render(profile as JSON)
	}
	

}


