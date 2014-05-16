package renk.gerenciamentoProdutos



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ItemPromocaoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ItemPromocao.list(params), model:[itemPromocaoInstanceCount: ItemPromocao.count()]
    }

    def show(ItemPromocao itemPromocaoInstance) {
        respond itemPromocaoInstance
    }

    def create() {
        respond new ItemPromocao(params)
    }

    @Transactional
    def save(ItemPromocao itemPromocaoInstance) {
        if (itemPromocaoInstance == null) {
            notFound()
            return
        }

        if (itemPromocaoInstance.hasErrors()) {
            respond itemPromocaoInstance.errors, view:'create'
            return
        }

        itemPromocaoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'itemPromocaoInstance.label', default: 'ItemPromocao'), itemPromocaoInstance.id])
                redirect itemPromocaoInstance
            }
            '*' { respond itemPromocaoInstance, [status: CREATED] }
        }
    }

    def edit(ItemPromocao itemPromocaoInstance) {
        respond itemPromocaoInstance
    }

    @Transactional
    def update(ItemPromocao itemPromocaoInstance) {
        if (itemPromocaoInstance == null) {
            notFound()
            return
        }

        if (itemPromocaoInstance.hasErrors()) {
            respond itemPromocaoInstance.errors, view:'edit'
            return
        }

        itemPromocaoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ItemPromocao.label', default: 'ItemPromocao'), itemPromocaoInstance.id])
                redirect itemPromocaoInstance
            }
            '*'{ respond itemPromocaoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ItemPromocao itemPromocaoInstance) {

        if (itemPromocaoInstance == null) {
            notFound()
            return
        }

        itemPromocaoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ItemPromocao.label', default: 'ItemPromocao'), itemPromocaoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemPromocaoInstance.label', default: 'ItemPromocao'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
