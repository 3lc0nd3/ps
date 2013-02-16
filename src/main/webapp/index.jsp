<%@ page import="java.util.List" %>
<%@ page import="co.com.elramireza.motta.model.T01ImPregunta" %>

<jsp:useBean id="mottaManager" class="co.com.elramireza.motta.dao.MottaDAO" scope="application"/>

    <jsp:include page="c_header.jsp"/>
    <div class="container" >
        <div class="hero-unit">
            <h2>Productos</h2>
            <p>Cuestionarios Psicom&eacute;tricos</p>
            <p><a class="btn btn-primary btn-primary">Leer m&aacute;s &raquo;</a></p>
        </div>
    </div>

    <div class="container" >



<%--
        <%
            List<T01ImPregunta> preguntas = mottaManager.getPreguntas();
            for(T01ImPregunta pregunta: preguntas){
        %>
        <br>
        <%=pregunta.getPregunta()%>
        <%
            }
        %>--%>
    </div>
    <jsp:include page="c_footer.jsp"/>