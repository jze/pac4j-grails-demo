class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.${format})?"{
            constraints {
                // apply constraints here
            }
        }

        "/twitter" view: "/twitter/index"
        "/facebook" view: "/facebook/index"
        "/theForm" view: "/form/index"
        "/basicauth" view: "/basicauth/index"
        "/cas" view: "/cas/index"

        "/" view: "/index"
        "500" view:'/error'
    }
}
