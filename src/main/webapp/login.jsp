<%@ page import="co.com.elramireza.motta.model.Participante" %>
<jsp:useBean id="mottaManager" class="co.com.elramireza.motta.dao.MottaDAO" scope="application"/>
<%
    String login    = request.getParameter("email");
    String password = request.getParameter("password");

    Participante participante = mottaManager.getParticipante(login, password);
    if(participante == null){
        session.setAttribute("msgLogin", "error email y password");
    } else {
        session.setAttribute("msgLogin", "");
        session.setAttribute("participante", participante);
    }
    response.sendRedirect("/");
%>