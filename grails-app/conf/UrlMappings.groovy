class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.${format})?"{
            constraints {
                // apply constraints here
            }
        }

	"/facebook/index.gsp"(view:"facebook/index")
	"/twitter/index.gsp"(view:"twitter/index")
	"/form/index.gsp"(view:"form/index")


        "/"(view:"/index")
        "500"(view:'/error')
	}
}
