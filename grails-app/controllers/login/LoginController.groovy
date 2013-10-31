package login

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
	

}


