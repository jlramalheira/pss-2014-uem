class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/login")
        "/inicio"(view:"/index")
        "/ajuda"(view:"/help")
        "500"(view:'/error')
    }
}
