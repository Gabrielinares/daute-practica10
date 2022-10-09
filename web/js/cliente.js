function llenarForm(fila) {
    let codigo = $(fila).find(".codigo").text();
    let nombre = $(fila).find(".nombre").text();
    let edad = $(fila).find(".edad").text();
    let categoria = $(fila).find(".categoria").text();


    $("#txtCodigo").val(codigo);
    $("#txtNombre").val(nombre);
    $("#txtEdad").val(edad);
    $("#txtCategoria option:contains(" + categoria + ")").attr('selected', true);
    console.log($("#txtCategoria").text());
}

$(document).ready(function () {

    $("#mdlFormulario").on("hidden.bs.modal", function(){
        $("form")[0].reset();
        $("#txtCategoria option[selected]").removeAttr('selected');
    });

    $(document).on('click', '.btnEditar', function () {
        llenarForm($(this).closest('tr'));
    });
    
    $(document).on('click', '.btnEliminar', function () {
        llenarForm($(this).closest('tr'));
    });
});