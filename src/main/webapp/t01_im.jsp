<%@ page import="co.com.elramireza.motta.model.T01ImPregunta" %>
<%@ page import="java.util.List" %>
<jsp:useBean id="mottaManager" class="co.com.elramireza.motta.dao.MottaDAO" scope="application"/>
<jsp:include page="c_header.jsp"/>
<div class="container">
    <script type="text/javascript">
        jQuery.metadata.setType("attr", "validate");
    </script>

    <h1>
        <%=mottaManager.getTest(1).getNombre()%>
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
                <option value="10">Ma&ntilde;ana</option>
                <option value="11">Tarde </option>
            </select>
            <%--<input type="button" class="btn" value="Enviar"/>--%>
        </fieldset>
        <h3>
            Cuestionario
        </h3>
        <table class="table table-striped" style="width:60%;">
            <tr>
                <th>Id</th>
                <th>Pregunta</th>
                <%--<th>Si</th>--%>
                <th></th>
                <%--<th>No</th>--%>
                <th></th>
            </tr>
            <%
                List<T01ImPregunta> preguntas = mottaManager.getPreguntas();
                int i = 0;
                for(T01ImPregunta pregunta: preguntas){
                    i++;
            %>
            <tr>
                <td>
                    <%=i%>
                </td>
                <td>
                    <%=pregunta.getPregunta()%>
                    <label for="r01p<%=i%>"  style="width:300px;" class="error">Seleccione Respuesta <%=i%></label>
                </td>
                <td>
                    <label for="r01pSi<%=i%>" style="width:35px;">
                        <input type="radio" value="1" id="r01pSi<%=i%>" name="r01p<%=i%>" validate="required:true" >
                        Si
                    </label>
                </td>
                <td >
                    <label for="r01pNo<%=i%>" style="width:35px;">
                        <input type="radio" value="0" id="r01pNo<%=i%>" name="r01p<%=i%>">
                        No
                    </label>
                </td>
            </tr>

            <%
                }
            %>
        </table>


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
        for(var ci=1; ci<=35; ci++){
            lista[ci] = jQuery("input[name='r01p"+ci+"']:checked").val();
        }

        mottaRemoto.guardarT01(participante, lista, function(data){
            window.location = "t01_im_ok.jsp";
        });

        var j;
        //        j = dwr.util.getValue("r01p35");
//        j = jQuery("input[name='r01p35']:checked").val();
//        alert("j = " + j);
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