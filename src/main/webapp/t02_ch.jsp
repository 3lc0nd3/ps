<%@ page import="co.com.elramireza.motta.model.T02VhSeccion" %>
<%@ page import="java.util.List" %>
<%@ page import="co.com.elramireza.motta.model.T02VhPregunta" %>
<jsp:useBean id="mottaManager" class="co.com.elramireza.motta.dao.MottaDAO" scope="application"/>
<jsp:include page="c_header.jsp"/>
<div class="container">
    <script type="text/javascript">
        jQuery.metadata.setType("attr", "validate");
    </script>
    <h1>
        <%=mottaManager.getTest(2).getNombre()%>
    </h1>

    <h3>
        Datos Personales
    </h3>
    <form class="validateForm" id="imForm" action="login.jsp">
        <fieldset>
            <input id="nombresParticipante" name="nombresParticipante" class="span2 required" type="text" placeholder="Nombres" >
            <%--<br>--%>
            <input id="apellidosParticipante" name="apellidosParticipante" class="span2 required" type="text" placeholder="Apellidos">
            <%--<br>--%>
            <input id="documentoIdentidad"  name="documentoIdentidad" class="span2 required number" type="text" placeholder="Documento Identidad" >

            <input id="emailParticipante" name="emailParticipante" class="span2 email" type="text" placeholder="Email" >
            <%--<br>--%>
            <%--<input id="password" class="span2" type="password" placeholder="Password">--%>
            <%--<br>--%>
            <%--<input id="repassword" class="span2" type="password" placeholder="Repita Password">--%>
            <%--<br>--%>
            <input id="fechaNacimientoS"  name="fechaNacimientoS" <%--readonly--%> class="span2 required" type="text" placeholder="Fecha de Nacimiento">
            <br>
            <input id="celularParticipante" name="celularParticipante" class="span2 digits" minlength="10" maxlength="10" type="text" placeholder="Celular">
            <%--<br>--%>
            <input id="skypeParticipante" class="span2" type="text" placeholder="Skype">
            <%--<br>--%>
            <input id="facebookParticipante" class="span2" type="text" placeholder="Facebook">
            <%--<br>--%>
            <input id="twitterParticipante" class="span2" type="text" placeholder="Twitter">
            <br>
            <select id="grado" class="span2" placeholder="Hola">
                <option value="" disabled="disabled">Seleccione Grado</option>
                <option value="10">Grado 10</option>
                <option value="11">Grado 11 </option>
            </select>
            <select id="curso" class="span2" placeholder="Hola">
                <option value="" disabled="disabled">Seleccione Curso</option>
                <option value="1">Curso 1</option>
                <option value="2">Curso 2</option>
                <option value="3">Curso 3</option>
                <option value="4">Curso 4</option>
                <option value="5">Curso 5</option>
            </select>
            <select id="jornada" class="span2" placeholder="Hola">
                <option value="" disabled="disabled">Seleccione Jornada</option>
                <option value="1">Ma&ntilde;ana</option>
                <option value="2">Tarde </option>
            </select>
            <%--<input type="button" class="btn" value="Enviar"/>--%>
        </fieldset>
        <h2>
            Cuestionario
        </h2>
        <%
            for(T02VhSeccion seccion: mottaManager.getVhSecciones()){
                List<T02VhPregunta> preguntas = mottaManager.getprT02VhPreguntasFromSeccion(seccion.getId());
        %>
        <h3><%=seccion.getSeccion()%></h3>
        <p><%=seccion.getTexto()%></p>
        <%
            if(seccion.getId()<4){
        %>
        <table class="table table-striped" style="width:60%;">
            <tr>
                <th>Id</th>
                <th>Pregunta</th>
                <th>&nbsp;</th>
                <th>&nbsp;</th>
            </tr>
            <%
                for (T02VhPregunta pregunta: preguntas){
            %>
            <tr>
                <td>
                    <%=pregunta.getId()%>
                </td>
                <td>
                    <%=pregunta.getPregunta()%>
                    <label for="r02p<%=pregunta.getId()%>"  style="width:300px;" class="error">Seleccione Respuesta <%=pregunta.getId()%></label>
                </td>
                <td>
                    <label for="r02pSi<%=pregunta.getId()%>" style="width:35px;">
                        <input type="radio" value="1" id="r02pSi<%=pregunta.getId()%>" name="r02p<%=pregunta.getId()%>" validate="required:true" >
                        Si
                    </label>
                </td>
                <td >
                    <label for="r02pNo<%=pregunta.getId()%>" style="width:35px;">
                        <input type="radio" value="0" id="r02pNo<%=pregunta.getId()%>" name="r02p<%=pregunta.getId()%>">
                        No
                    </label>
                </td>
            </tr>
            <%
                }
            %>
        </table>
        <%
            } else {
        %>
        <table class="table table-striped" style="width:60%;">
            <tr>
                <th>
                    Id
                </th>
                <th>Pregunta</th>
                <th>&nbsp;</th>
            </tr>
            <%
                for (T02VhPregunta pregunta: preguntas){
            %>
            <tr>
                <td>
                    <%=pregunta.getId()%>
                </td>
                <td>
                    <%=pregunta.getPregunta()%>
                    <label for="r02p<%=pregunta.getId()%>"  style="width:300px;" class="error">Seleccione Respuesta <%=pregunta.getId()%></label>
                </td>
                <td>
                    <select id="r02p<%=pregunta.getId()%>" name="r02p<%=pregunta.getId()%>" style="width:60px">
                        <option value="" disabled="disabled">...</option>
                        <option value="1"> 1</option>
                        <option value="2"> 2</option>
                        <option value="3"> 3</option>
                        <option value="4"> 4</option>
                        <option value="5"> 5</option>
                        <option value="6"> 6</option>
                        <option value="7"> 7</option>
                    </select>
                </td>
            </tr>
            <%
                }
            %>
        </table>
        <%
            }
        %>
        <br>
        <%
            }
        %>
        <input class="submit" type="submit" value="Submit"/>
        <%--<input type="button" onclick="enviar();" class="btn" value="Enviar"/>--%>

    </form>
</div>


<script type="text/javascript">

    function enviar(){
        var msg = "";

        var participante = {
            nombresParticipante: null,
            apellidosParticipante: null,
            documentoIdentidad: null,
            emailParticipante: null,
            fechaNacimientoS: null,
            grado: null,
            celularParticipante: null,
            skypeParticipante: null,
            facebookParticipante: null,
            twitterParticipante: null,
            curso: null,
            jornada: null
        };
        dwr.util.getValues(participante);

        var lista = [];
        lista[0]=-1;
        for(var ci=1; ci<=203; ci++){
            lista[ci] = jQuery("input[name='r02p"+ci+"']:checked").val();
        }
//        alert("lista.length = " + lista.length);
        for(var ci2=204; ci2<=215; ci2++){
            lista[ci2] = dwr.util.getValue("r02p"+ci2);
            
        }

//        alert("lista[214] = " + lista[214]);
//        alert("lista.length = " + lista.length);
//        alert("dwr.util.getValue('r02p214') = " + dwr.util.getValue('r02p214'));


        mottaRemoto.guardarT02(participante, lista, function(data){
            window.location = "t02_vh_ok.jsp";
        });
    }

    jQuery(document).ready(function() {
        jQuery("#imForm").validate();
    });

    jQuery('#fechaNacimientoS').datepicker({
        ampm: true,
        dateFormat: 'd/mm/yy',
        changeMonth: true,
        changeYear: true
    });

    jQuery.validator.setDefaults({
	submitHandler: function() {
		enviar();
	}
});

</script>
<jsp:include page="c_footer.jsp"/>