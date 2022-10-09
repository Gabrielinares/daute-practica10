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

    $('#myDataTable').DataTable();


    $("#mdlFormulario").on("hidden.bs.modal", function () {
        $("form")[0].reset();
        $("#txtCategoria option[selected]").removeAttr('selected');
    });

    $(document).on('click', '.btnEditar', function () {
        llenarForm($(this).closest('tr'));
        $(".btnOcultar1").attr('disabled', 'disabled');
        $(".btnOcultar").removeAttr('disabled');

    });

    $(document).on('click', '.btnEliminar', function () {
        llenarForm($(this).closest('tr'));
        $(".btnOcultar1").attr('disabled', 'disabled');
        $(".btnOcultar").removeAttr('disabled');

    });

    $(document).on('click', '.btnAgregar', function () {
        $(".btnOcultar").attr('disabled', 'disabled');
        $(".btnOcultar1").removeAttr('disabled');

    });
});