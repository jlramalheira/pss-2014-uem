<%@ page import="renk.gerenciamentoAutenticacao.Funcionario" %>



    <div class="row">
    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 ${hasErrors(bean: funcionarioInstance, field: 'perfil', 'error')} ">
        <label for="perfil">
            <g:message code="funcionario.perfil.label" default="Perfil" />
            
        </label>
        <g:select class="form-control" id="perfil" name="perfil.id" from="${renk.gerenciamentoAutenticacao.Perfil.list()}" optionKey="id" value="${funcionarioInstance?.perfil?.id}" class="many-to-one" noSelection="['null': '']"/>

    </div>
</div>

