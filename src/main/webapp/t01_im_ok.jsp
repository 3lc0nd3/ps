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
        Sus Datos se han guardado satisfactoriamente, gracias por participar.
    </h3>
</div>

<jsp:include page="c_footer.jsp"/>