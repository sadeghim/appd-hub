package au.org.ala.biocache.hubs

class RoleFilters {

    def roles =null
    def filters = {
        all(controller:'*', action:'*') {
            before = {
                if(!roles){
                    roles =grailsApplication.config.authorise.roles?.split(",")?.toList()
                    System.out.println("INIT: " + roles)
                }
                System.out.println(controllerName + " " + actionName)
                System.out.println(grailsApplication.config.authorise.roles)
                System.out.println(roles)
                def authorised=false
                roles.each {
                    if(request.isUserInRole(it)){
                        authorised=true
                    }
                }

                if(!authorised){
                    //we need to display the error message
                    flash.message = "You are not authorised to access this site."
                    redirect(uri: "/unauthorised")
                }
                //otherwise we assume that the user is authorised to proceed to the page.

            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
