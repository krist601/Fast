package fastchacaito
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class IndexController {

    def springSecurityService
    def index() { 
        if (springSecurityService.isLoggedIn())
            render (view:"index")
        else
            redirect (controller:"login",action:"auth")
            
    }
}
