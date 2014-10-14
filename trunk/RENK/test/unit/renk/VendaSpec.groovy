package renk

import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import renk.gerenciamentoTransacoes.Venda
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestMixin(GrailsUnitTestMixin)
class VendaSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void testConstraints() {
        mockDomain Venda
        def venda = new Venda()
        assertFalse usuario.validate()
        def venda_ok = new Usuario(nome:"Joselino", login: "joca")
        assertTrue usuario_ok.validate()
    }
 
    void testUnicidade() {
        mockDomain Usuario, []
        def usuario1 = new Usuario(nome: "Joselino", login: "jose")
        usuario1.save()
        def usuario2 = new Usuario(nome:"Joselino", login:"joca")
        assertFalse usuario2.validate() // já existe um Joselino!
 
    }
    
    void "test something"() {
    }
}
