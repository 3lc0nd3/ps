<%@ page import="co.com.elramireza.motta.model.Participante" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.List" %>
<jsp:useBean id="mottaManager" class="co.com.elramireza.motta.dao.MottaDAO" scope="application"/>

<jsp:include page="c_header.jsp"/>
<div class="container">
    <%
        SimpleDateFormat dfDate = new SimpleDateFormat("yyyy-MMMMMM-dd", new Locale("es"));
    %>
    <h1>
        <%=mottaManager.getTest(2).getNombre()%>
    </h1>

    <table class="table table-striped" style="width:70%">
        <tr>
            <th>Fecha</th>
            <th>Apellido</th>
            <th>Nombre</th>
            <th>Id.</th>
            <th>Jornada</th>
            <th>Grado</th>
            <th>Curso</th>
            <th>Resultado</th>
        </tr>
        <%
            List<Participante> participantesT02Vh;
//            participantesT02Vh = mottaManager.getParticipantesT02Vh();
            participantesT02Vh = mottaManager.getHibernateTemplate().find(
                "from Participante where idParticipante in " +
                        "(select distinct participanteByIdParticipante.idParticipante from T02VhRespuesta ) " +
                        " order by fechaIngresoParticipante desc , apellidosParticipante,nombresParticipante "
        );
            for (Participante participante: participantesT02Vh){
                String fechaS = null;
                try {
                    fechaS = dfDate.format(participante.getFechaIngresoParticipante());
                } catch (Exception e) {
//                    e.printStackTrace();
//                    logger.debug(e.getMessage());
                }
        %>

        <tr>
            <td><%=fechaS%></td>
            <td><%=participante.getApellidosParticipante()%></td>
            <td><%=participante.getNombresParticipante()%></td>
            <td><%=participante.getDocumentoIdentidad()%></td>
            <td><%=participante.getJornada().equals("1")?"Ma&ntilde;ana":"Tarde"%></td>
            <td><%=participante.getGrado()%></td>
            <td><%=participante.getCurso()%></td>
            <td>
                <a href="t02_vh_res_p.jsp?id=<%=participante.getIdParticipante()%>" target="<%=participante.getIdParticipante()%>" class="btn">Resultado</a>
            </td>
        </tr>

        <%
            }
        %>
    </table>

</div>
<jsp:include page="c_footer.jsp"/>