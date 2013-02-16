<jsp:useBean id="mottaManager" class="co.com.elramireza.motta.dao.MottaDAO" scope="application"/>
<jsp:include page="c_header.jsp"/>
<div class="container">
    <h1>
        <%=mottaManager.getTest(2).getNombre()%>

    </h1>
</div>
<jsp:include page="c_footer.jsp"/>