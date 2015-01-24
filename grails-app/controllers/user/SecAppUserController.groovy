package user

import org.springframework.dao.DataIntegrityViolationException
import javax.crypto.Cipher
import javax.crypto.spec.SecretKeySpec
import java.awt.image.BufferedImage
import java.io.ByteArrayOutputStream
import java.net.URL
import javax.imageio.ImageIO
import org.springframework.security.access.annotation.Secured
class SecAppUserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [secAppUserInstanceList: SecAppUser.list(params), secAppUserInstanceTotal: SecAppUser.count()]
    }

    def create() {
        [secAppUserInstance: new SecAppUser(params)]
    }

    def save() {
        params.enabled="on"
        def secAppUserInstance = new SecAppUser(params)
        if (!secAppUserInstance.save(flush: true)) {
            render(view: "create", model: [secAppUserInstance: secAppUserInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'secAppUser.label', default: 'SecAppUser'), secAppUserInstance.id])
        redirect(action: "show", id: secAppUserInstance.id)
    }

    def show(Long id) {
        def secAppUserInstance = SecAppUser.get(id)
        if (!secAppUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secAppUser.label', default: 'SecAppUser'), id])
            redirect(action: "list")
            return
        }

        [secAppUserInstance: secAppUserInstance]
    }

    def edit(Long id) {
        def secAppUserInstance = SecAppUser.get(id)
        if (!secAppUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secAppUser.label', default: 'SecAppUser'), id])
            redirect(action: "list")
            return
        }

        [secAppUserInstance: secAppUserInstance]
    }

    def update(Long id, Long version) {
        print "los params son: "+params
        def secAppUserInstance = SecAppUser.get(id)
        if (!secAppUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secAppUser.label', default: 'SecAppUser'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (secAppUserInstance.version > version) {
                secAppUserInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'secAppUser.label', default: 'SecAppUser')] as Object[],
                          "Another user has updated this SecAppUser while you were editing")
                render(view: "edit", model: [secAppUserInstance: secAppUserInstance])
                return
            }
        }

        secAppUserInstance.properties = params

        if (!secAppUserInstance.save(flush: true)) {
            render(view: "edit", model: [secAppUserInstance: secAppUserInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'secAppUser.label', default: 'SecAppUser'), secAppUserInstance.id])
        redirect(action: "show", id: secAppUserInstance.id)
    }

    def delete(Long id) {
        def secAppUserInstance = SecAppUser.get(id)
        if (!secAppUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secAppUser.label', default: 'SecAppUser'), id])
            redirect(action: "list")
            return
        }

        try {
            secAppUserInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'secAppUser.label', default: 'SecAppUser'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'secAppUser.label', default: 'SecAppUser'), id])
            redirect(action: "show", id: id)
        }
    }
    def editPassword(Long id) {
        
        id=(id+7)/ 123456789 
        def secAppUserInstance = SecAppUser.get(id)
        if (!secAppUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secAppUser.label', default: 'SecAppUser'), id])
            redirect(action: "list")
            return
        }
        [secAppUserInstance: secAppUserInstance]
    }

    def updatePassword(Long id, Long version) {
        def secAppUserInstance = SecAppUser.get(id)
        if (!secAppUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secAppUser.label', default: 'SecAppUser'), id])
            redirect(action: "list")
            return
        }
        if (params.password!=params.password2) {
            secAppUserInstance.errors.rejectValue("version", "Las contraseñas no coinciden",
                [message(code: 'secAppUser.label', default: 'SecAppUser')] as Object[],
                          "Las contraseñas no coinciden")
            render(view: "editPassword", model: [secAppUserInstance: secAppUserInstance])
            return
        }

        if (version != null) {
            if (secAppUserInstance.version > version) {
                secAppUserInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'secAppUser.label', default: 'SecAppUser')] as Object[],
                          "Another user has updated this SecAppUser while you were editing")
                render(view: "editPassword", model: [secAppUserInstance: secAppUserInstance])
                return
            }
        }

        secAppUserInstance.properties = params

        if (!secAppUserInstance.save(flush: true)) {
            render(view: "editPassword", model: [secAppUserInstance: secAppUserInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'secAppUser.label', default: 'SecAppUser'), secAppUserInstance.id])
        redirect(action: "show", id: secAppUserInstance.id)
    }
    def showImage = {
          
        /* Path path = Paths.get("web-app\\images\\icon-user-default.png")
        byte[] data = Files.readAllBytes(path) */
        
       
            
        def user = SecAppUser.get( params.id )
        if (user!=null){
            if (user.photo) {//tiene foto
                print user.photo
                response.outputStream << user.photo
            }
            else // no tiene foto
            {
                URL url = new URL((g.resource(dir: 'images/photos', file: 'icon-user-default.png',absolute:true)).toString());

                BufferedImage image = ImageIO.read(url);

                // write image to outputstream
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                ImageIO.write(image, "png", baos);
                baos.flush();

                // get bytes
                byte[] imageBytes = baos.toByteArray();
        
                response.outputStream << imageBytes
            }
            response.outputStream.flush()
        }
    }
}
