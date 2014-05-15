package au.org.ala.biocache.hubs

class RoleFilters {

    def roles =null
    def filters = {
        all(controller:'*', action:'*') {
            before = {
                // Note this is not triggered for pages which have no controller (have a view only)
                // Allow any user to perform a logout operation
                if(! controllerName.equals("logout")) {
                    if(!roles){
                        roles =grailsApplication.config.authorise.roles?.split(",")?.toList()
                        log.info("Initialising roles: " + roles)
                        roles = roles.findAll{it.length()>0}
                        if(roles?.size()==0){
                            roles = null
                            log.warn("No roles have access to the system")
                            flash.message = "Warning this system has been configured without access.  Please add an authorise.roles property"
                            redirect(uri: "/unauthorised")
                            return
                        }
                    }
                    def authorised=false
                    roles.each {
                        log.info "Checking role: ${it}"
                        if(request.isUserInRole(it)){
                            authorised=true
                        }
                    }
                    log.info(controllerName + " " + actionName)
                    log.info("authorised = " + authorised)
                    if(!authorised){
                        //we need to display the error message
                        flash.message = "You are not authorised to access this site."
                        redirect(uri: "/unauthorised")
                        return
                    }
                    //otherwise we assume that the user is authorised to proceed to the page.
                } else{
                    log.debug("Not checking role because logout")
                }


            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
