<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.Map" %>
<%@ page import="java.util.Map" %>

<%
    Map<String, String> erroresMap = (Map<String, String>) request.getAttribute("errores");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registro de Productos</title>
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="text-bg-secondary p-3">


<div class="px-5">
    <h1 class="display-4">Registro de Productos</h1>
</div>
<!-- Formulario -->
<div class="px-5">
    <form action="/webapp-form-tarea2/crear" method="post">

        <%--input-nombre--%>
        <div class="row mb-3">
            <label for="nombre" class="col-form-label col-mb-2">Nombre</label>
            <div class="col-sm-4">
                <input type="text" name="nombre" id="nombre" class="form-control" value="${param.nombre}">
            </div>
            <%
                if (erroresMap != null && erroresMap.containsKey("nombre")) {
                    out.println("<small class='alert alert-danger col-sm-4' style='color:red';>" + erroresMap.get("nombre") + "</small>");
                }
            %>
        </div>

        <!-- input-precio-->
        <div class="row mb-3">
            <label for="precio" class="col-form-label col-mb-2">Precio</label>
            <div class="col-sm-4">
                <input type="text" name="precio" id="precio" class="form-control" value="${param.precio}">
            </div>
            <%
                if (erroresMap != null && erroresMap.containsKey("precio")) {
                    out.println("<small class='alert alert-danger col-sm-4' style='color:red';>" + erroresMap.get("precio") + "</small>");
                }
            %>
        </div>

        <!-- input-fabricante-->
        <div class="row mb-3">
            <label for="fabricante" class="col-form-label col-mb-2">Fabricante</label>
            <div class="col-sm-4">
                <input type="text" name="fabricante" id="fabricante" class="form-control" value="${param.fabricante}">
            </div>
            <%
                if (erroresMap != null && erroresMap.containsKey("fabricante")) {
                    out.println("<small class='alert alert-danger col-sm-4' style='color:red';>" + erroresMap.get("fabricante") + "</small>");
                }
            %>
        </div>

        <!-- selector de categorias-->
        <div class="row mb-3">
            <label for="categoria" class="col-form-label col-mb-2">Categoria</label>
            <div class="col-sm-4">
                <select name="categoria" id="categoria" class="form-select">
                    <option value="" selected>--Seleccion--</option>
                    <option value="lacteos" ${param.categoria.equals("lacteos")?"selected":""}>Lacteos</option>
                    <option value="verduleria" ${param.categoria.equals("verduleria")?"selected":""}>Verduleria</option>
                    <option value="carnes" ${param.categoria.equals("carnes")?"selected":""}>Carnes</option>
                    <option value="panificados" ${param.categoria.equals("panificados")?"selected":""}>Panificados
                    </option>
                    <option value="fiambres" ${param.categoria.equals("fiambres")?"selected":""}>Fiambres</option>
                    <option value="electronicos" ${param.categoria.equals("electronicos")?"selected":""}>Electronicos
                    </option>
                    <option value="otros" ${param.categoria.equals("otros")?"selected":""}>Otros</option>
                </select>
            </div>
            <%
                if (erroresMap != null && erroresMap.containsKey("categoria")) {
                    out.println("<small class='alert alert-danger col-sm-4' style='color:red';>" + erroresMap.get("categoria") + "</small>");
                }
            %>
        </div>

        <%-- Boton Enviar--%>
        <div class="row mb-3">
            <div>
                <input type="submit" value="Enviar" class="btn btn-primary">
            </div>
        </div>

    </form>
</div>

</body>
</html>