<%@ page import="renk.gerenciamentoPessoas.Cliente" %>
<%@ page import="renk.gerenciamentoPessoas.PessoaFisica" %>
<%@ page import="renk.gerenciamentoPessoas.PessoaJuridica" %>

<div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: clienteInstance, field: 'tipoPessoa', 'error')} required">
        <label for="pessoaTipo">
            <g:message code="cliente.tipoPessoa.label" default="Tipo Pessoa" />
            <span class="required-indicator">*</span>
        </label>
        <g:radioGroup name="pessoaTipo" 
            values="['fisica','juridica']"
            labels="['Pessoa Física', 'Pessoa Jurídica']" 
            value="${clienteInstance?.tipoPessoa == null ? "fisica" : clienteInstance?.tipoPessoa instanceof PessoaFisica ? "fisica" : "juridica"}"
            onchange="muda();">
            ${it.label} ${it.radio}
        </g:radioGroup>
    </div>
</div>
<div id="fisica">
    <div class="row">
        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: clienteInstance?.tipoPessoa, field: 'cpf', 'error')} required">
            <label for="cpf">
                <g:message code="pessoaFisica.cpf.label" default="CPF" />
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="pessoaFisica.cpf" maxlength="11" value="${clienteInstance?.tipoPessoa instanceof PessoaFisica ? clienteInstance.tipoPessoa.cpf : ""}"class="form-control" />

        </div>
    </div>
</div>
<div id="juridica">
    <div class="row">
        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: clienteInstance?.tipoPessoa, field: 'cnpj', 'error')} required">
            <label for="cnpj">
                <g:message code="pessoaJuridica.cnpj.label" default="CNPJ" />
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="pessoaJuridica.cnpj" value="${clienteInstance?.tipoPessoa instanceof PessoaJuridica ? clienteInstance.tipoPessoa.cnpj : ""}"class="form-control" />

        </div>
    </div>

    <div class="row">
        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: clienteInstance?.tipoPessoa, field: 'inscricaoEstadual', 'error')} ">
            <label for="inscricaoEstadual">
                <g:message code="pessoaJuridica.inscricaoEstadual.label" default="Inscricao Estadual" />

            </label>
            <g:textField name="pessoaJuridica.inscricaoEstadual" value="${clienteInstance?.tipoPessoa instanceof PessoaJuridica ? clienteInstance.tipoPessoa.inscricaoEstadual : ""}"class="form-control" />

        </div>
    </div>
</div>
<div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: clienteInstance, field: 'nome', 'error')} required">
        <label for="nome">
            <g:message code="cliente.nome.label" default="Nome" />

        </label>
        <g:textField name="nome" required="" value="${clienteInstance?.nome}"class="form-control" />

    </div>
</div>

<div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: clienteInstance, field: 'email', 'error')} ">
        <label for="email">
            <g:message code="cliente.email.label" default="Email" />

        </label>
        <g:field type="email" class="form-control" name="email" value="${clienteInstance?.email}"class="form-control" />

    </div>
</div>

<div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: clienteInstance, field: 'telefone', 'error')} ">
        <label for="telefone">
            <g:message code="cliente.telefone.label" default="Telefone" />

        </label>
        <g:textField name="telefone" maxlength="15" value="${clienteInstance?.telefone}"class="form-control" />

    </div>
</div>

<div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: clienteInstance, field: 'celular', 'error')} ">
        <label for="celular">
            <g:message code="cliente.celular.label" default="Celular" />

        </label>
        <g:textField name="celular" maxlength="15" value="${clienteInstance?.celular}"class="form-control" />

    </div>
</div>

<div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: clienteInstance, field: 'enderecos', 'error')} ">
        <g:if test="${clienteInstance?.enderecos}">
            <label for="enderecos">
                <g:message code="cliente.enderecos.label" default="Enderecos" />

            </label>

            <ul class="one-to-many">
                <g:each in="${clienteInstance?.enderecos}" var="e">
                    <li><g:link controller="endereco" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
                    </g:each>

            </ul>

        </g:if>
    </div>
</div>    
<script type="text/javascript">
    window.onload = function() {                
	if ($(':input[name="pessoaTipo"]:checked').val() === "fisica") {
            $("#juridica").addClass("hidden");
        } else {
            $("#fisica").addClass("hidden");
        }
    }    
    
    function muda() {
        if ($("#juridica").hasClass("hidden")) {            
            $("#fisica").addClass("hidden");
            $("#juridica").removeClass("hidden");
        } else {
            $("#juridica").addClass("hidden");
            $("#fisica").removeClass("hidden");
        }
    };
</script>
