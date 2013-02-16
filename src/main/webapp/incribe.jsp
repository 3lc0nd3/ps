<jsp:useBean id="mottaManager" class="co.com.elramireza.motta.dao.MottaDAO" scope="application"/>

<jsp:include page="c_header.jsp"/>
<div class="container">
    <h3>Inscribir nuevo usuario</h3>
    <form class="" action="login.jsp">
        
        <input id="nombresParticipante" class="span2" type="text" placeholder="Nombres">
        <%--<br>--%>
        <input id="apellidosParticipante" class="span2" type="text" placeholder="Apellidos">
        <br>
        <input id="emailParticipante" class="span2" type="text" placeholder="Email">
        <br>
        <input id="password" class="span2" type="password" placeholder="Password">
        <%--<br>--%>
        <input id="repassword" class="span2" type="password" placeholder="Repita Password">
        <br>
        <input id="fechaNacimientoS" <%--readonly--%> class="span2" type="text" placeholder="Fecha de Nacimiento">
        <br>
        <input id="celularParticipante" class="span2" type="text" placeholder="Celular">
        <%--<br>--%>
        <input id="skypeParticipante" class="span2" type="text" placeholder="Skype">
        <br>
        <input class="span2" type="text" placeholder="Facebook">
        <%--<br>--%>
        <input class="span2" type="text" placeholder="Twitter">
        <br>
        <br>
        <input type="button" class="btn" value="Enviar"/>
    </form>
</div>
<script type="text/javascript">

    jQuery('#fechaNacimientoS').datepicker({
        ampm: true,
        dateFormat: 'd/mm/yy',
        changeMonth: true,
        changeYear: true
    });

</script>
<jsp:include page="c_footer.jsp"/>
