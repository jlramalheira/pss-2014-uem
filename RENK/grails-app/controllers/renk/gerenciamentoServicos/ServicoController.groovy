package renk.gerenciamentoServicos



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ServicoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Servico.list(params), model:[servicoInstanceCount: Servico.count()]// Servico.findAllByAtivo()
    }

    def show(Servico servicoInstance) {
        respond servicoInstance
    }

    def create() {
        respond new Servico(params)
    }

    @Transactional
    def save(Servico servicoInstance) {
        if (servicoInstance == null) {
            notFound()
            return
        }

        if (servicoInstance.hasErrors()) {
            respond servicoInstance.errors, view:'create'
            return
        }

        servicoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'servicoInstance.label', default: 'Servico'), servicoInstance.id])
                redirect servicoInstance
            }
            '*' { respond servicoInstance, [status: CREATED] }
        }
    }

    def edit(Servico servicoInstance) {
        respond servicoInstance
    }

    @Transactional
    def update(Servico servicoInstance) {
        if (servicoInstance == null) {
            notFound()
            return
        }

        if (servicoInstance.hasErrors()) {
            respond servicoInstance.errors, view:'edit'
            return
        }

        servicoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Servico.label', default: 'Servico'), servicoInstance.id])
                redirect servicoInstance
            }
            '*'{ respond servicoInstance, [status: OK] }
        }
    }

    def inativate(Servico servicoInstance) {

        if (servicoInstance == null) {
            notFound()
            return
        }

        servicoInstance.setInativar()
        servicoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.inativated.message', args: [message(code: 'Servico.label', default: 'Servico'), servicoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
    
    def ativate(Servico servicoInstance) {

        if (servicoInstance == null) {
            notFound()
            return
        }

        servicoInstance.setAtivar()
        servicoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.ativated.message', args: [message(code: 'Servico.label', default: 'Servico'), servicoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'servicoInstance.label', default: 'Servico'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
