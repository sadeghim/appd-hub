import grails.util.Holders

class BootStrap {

    def init = { servletContext ->
        log.debug "config.security.cas = ${Holders.config.security.cas}"
        log.debug "config.ala.skin = ${Holders.config.ala.skin}"
    }
    def destroy = {
    }
}
