<%@ page import="java.util.List" %>
<%@ page import="co.com.elramireza.motta.model.*" %>
<jsp:useBean id="mottaManager" class="co.com.elramireza.motta.dao.MottaDAO" scope="application"/>
<%
    String idS = request.getParameter("id");
    int id = 0;
    if (idS != null) {
        id = Integer.parseInt(idS);
    }
    Participante participante = mottaManager.getParticipanteId(id);
    List<T02VhCalificacion> calificaciones = mottaManager.getT02VhCalificacion(participante.getIdParticipante());
%>

<jsp:include page="c_header.jsp"/>
<div class="container-fluid">

    <h1>
        <%=mottaManager.getTest(2).getNombre()%>
    </h1>

    <h3><%=participante.getNombresParticipante()%> <%=participante.getApellidosParticipante()%></h3>
    <br>
    <div class="row-fluid">
        <div class="span6">
            <%
                int idSeccionOld=0;
                int idCatOld=0;
                for(T02VhCalificacion calificacion: calificaciones){
                    if(idSeccionOld!=calificacion.getIdSeccion()){
                        idSeccionOld = calificacion.getIdSeccion();
            %>
            <%
                if(idSeccionOld!= 1){
            %>
                </tr>
            </table>
            <%
                }
            %>
            <h3 style="text-align:center;"><%=calificacion.getSeccion()%></h3>
            <table class="table table-bordered">
                <tr>
            <%
                    }
            %>
                    <td style="width:16%; text-align:center;">
                        <span style="font-weight: bold;"><%=calificacion.getCategoria()%></span>
                    <%--</td>--%>
                    <%--<td>--%>
                        <br>
                        <%=calificacion.getResultado()%></td>
            <%
                }
            %>
                
                </tr>
            </table>
        </div>
        <div class="span6">
            <%
                List<T02VhResultado> resultados = mottaManager.getT02VhResultados(participante.getIdParticipante());
            %>
            <h3 style="text-align:center;">RESULTADO</h3>
            <h4 style="text-align:center;">Clave</h4>
            <table class="table table-bordered" align="center" style="width:50%">
                <tr>
                    <td style="width:50%; text-align:center;">
                        <b><%=resultados.get(0).getCategoria()%></b>
                    </td>
                    <td style="text-align:center;">
                        <b><%=resultados.get(1).getCategoria()%></b>
                    </td>
                </tr>
            </table>
            <table class="table table-striped">
                <tr>
                    <th>Carrera</th>
                    <th>Ocupaci&oacute;n</th>
                    <th>Nivel Educativo</th>
                </tr>
            <%
                List<T02VhCarrera> carreras = mottaManager.getT02VhCarreras(
                        resultados.get(0).getIdCategoria(),
                        resultados.get(1).getIdCategoria()
                );
                for (T02VhCarrera carrera : carreras) {
            %>
                <tr>
                    <td><%=carrera.getCarrera()%></td>
                    <td><%=carrera.getT02VhOcupacionByIdOcupacion().getOcupacion()%></td>
                    <td><%=carrera.getT02VhNivelEducativoByIdNivelEducativo().getNivel()%></td>
                </tr>
            <%
                }
            %>
            </table>
            <table class="table table-bordered" align="center" style="width:50%">
                <tr>
                    <td style="width:50%; text-align:center;">
                        <b><%=resultados.get(1).getCategoria()%></b>
                    </td>
                    <td style="text-align:center;">
                        <b><%=resultados.get(0).getCategoria()%></b>
                    </td>
                </tr>
            </table>
            <table class="table table-striped">
                <tr>
                    <th>Carrera</th>
                    <th>Ocupaci&oacute;n</th>
                    <th>Nivel Educativo</th>
                </tr>
            <%
                carreras = mottaManager.getT02VhCarreras(
                        resultados.get(1).getIdCategoria(),
                        resultados.get(0).getIdCategoria()
                );
                for (T02VhCarrera carrera : carreras) {
            %>
                <tr>
                    <td><%=carrera.getCarrera()%></td>
                    <td><%=carrera.getT02VhOcupacionByIdOcupacion().getOcupacion()%></td>
                    <td><%=carrera.getT02VhNivelEducativoByIdNivelEducativo().getNivel()%></td>
                </tr>
            <%
                }
            %>
            </table>
            <%
                if(resultados.get(1).getResultado()==resultados.get(2).getResultado()){
            %>
            <table class="table table-bordered" align="center" style="width:50%;">
                <tr>
                    <td style="width:50%; text-align:center;">
                        <b><%=resultados.get(0).getCategoria()%></b>
                    </td>
                    <td style="text-align:center;">
                        <b><%=resultados.get(2).getCategoria()%></b>
                    </td>
                </tr>
            </table>
            <table class="table table-striped">
                <tr>
                    <th>Carrera</th>
                    <th>Ocupaci&oacute;n</th>
                    <th>Nivel Educativo</th>
                </tr>
            <%
                carreras = mottaManager.getT02VhCarreras(
                        resultados.get(0).getIdCategoria(),
                        resultados.get(2).getIdCategoria()
                );
                for (T02VhCarrera carrera : carreras) {
            %>
                <tr>
                    <td><%=carrera.getCarrera()%></td>
                    <td><%=carrera.getT02VhOcupacionByIdOcupacion().getOcupacion()%></td>
                    <td><%=carrera.getT02VhNivelEducativoByIdNivelEducativo().getNivel()%></td>
                </tr>
            <%
                }
            %>
            </table>
            <table class="table table-bordered" align="center" style="width:50%;">
                <tr>
                    <td style="width:50%; text-align:center;">
                        <b><%=resultados.get(2).getCategoria()%></b>
                    </td>
                    <td style="text-align:center;">
                        <b><%=resultados.get(0).getCategoria()%></b>
                    </td>
                </tr>
            </table>
            <table class="table table-striped">
                <tr>
                    <th>Carrera</th>
                    <th>Ocupaci&oacute;n</th>
                    <th>Nivel Educativo</th>
                </tr>
            <%
                carreras = mottaManager.getT02VhCarreras(
                        resultados.get(2).getIdCategoria(),
                        resultados.get(0).getIdCategoria()
                );
                for (T02VhCarrera carrera : carreras) {
            %>
                <tr>
                    <td><%=carrera.getCarrera()%></td>
                    <td><%=carrera.getT02VhOcupacionByIdOcupacion().getOcupacion()%></td>
                    <td><%=carrera.getT02VhNivelEducativoByIdNivelEducativo().getNivel()%></td>
                </tr>
            <%
                }
            %>
            </table>
            <%
                }
            %>
        </div>
    </div>
</div>
<SCRIPT type="text/javascript">
</SCRIPT>

<jsp:include page="c_footer.jsp"/>