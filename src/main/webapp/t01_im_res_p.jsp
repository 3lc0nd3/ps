<%@ page import="co.com.elramireza.motta.model.Participante" %>
<%@ page import="co.com.elramireza.motta.model.T01ImResultado" %>
<jsp:useBean id="mottaManager" class="co.com.elramireza.motta.dao.MottaDAO" scope="application"/>
<%
    String idS = request.getParameter("id");
    int id = 0;
    if (idS != null) {
        id = Integer.parseInt(idS);
    }
    Participante participante = mottaManager.getParticipanteId(id);
    T01ImResultado resultado = mottaManager.getT01CalificacionParticipante(participante.getIdParticipante());
%>

<jsp:include page="c_header.jsp"/>
<div class="container-fluid">

    <h1>
        <%=mottaManager.getTest(1).getNombre()%>
    </h1>

    <h3><%=participante.getNombresParticipante()%> <%=participante.getApellidosParticipante()%></h3>
    <br>
    <div class="row-fluid">
        <div class="span4">
            <table class="table table-bordered">
                <tr><td>A.</td>
                    <td>Verbal/ling&uuml;&iacute;stica</td>
                    <td><%=resultado.getAVL()%></td></tr>
                <tr><td>B.</td><td>L&oacute;gico/matem&aacute;tica</td>
                    <td><%=resultado.getBLM()%></td></tr>
                <tr><td>C.</td><td>Visual/espacial</td>
                    <td><%=resultado.getCVE()%></td></tr>
                <tr><td>D.</td><td>Kinest&eacute;sica/Corporal</td>
                    <td><%=resultado.getDKC()%></td></tr>
                <tr><td>E.</td><td>Musical/r&iacute;tmica</td>
                    <td><%=resultado.getEMR()%></td></tr>
                <tr><td>F.</td><td>Intrapersonal</td>
                    <td><%=resultado.getFIntrapersonal()%></td></tr>
                <tr><td>G.</td><td>Interpersonal</td>
                    <td><%=resultado.getGInterpersonal()%></td></tr>
            </table>
        </div>
        <div class="span8">
            <div id="chart1" style="height:400px; width:92%;"></div>
        </div>
    </div>
</div>
<SCRIPT type="text/javascript">
    function viewIm(){
        var lista = [[
                <%=resultado.getAVL()%>,
                <%=resultado.getBLM()%>,
                <%=resultado.getCVE()%>,
                <%=resultado.getDKC()%>,
                <%=resultado.getEMR()%>,
                <%=resultado.getFIntrapersonal()%>,
                <%=resultado.getGInterpersonal()%>
        ]];
        var ticks = [
            utf8_decode('Verbal/lingüística'),
            utf8_decode('Lógico/matemática'),
            utf8_decode('Visual/espacial'),
            utf8_decode('Kinestésica/Corporal'),
            utf8_decode('Musical/rítmica'),
            utf8_decode('Intrapersonal'), 
            utf8_decode('Interpersonal')
        ];

        jQuery('#chart1').empty();
        jQuery('#chart1').jqplot(lista, {
            animate: true,
            animateReplot: true,
            title:'<%=participante.getNombresParticipante()%> <%=participante.getApellidosParticipante()%>',
            series:[
                {
                    label: "I.M.",
                    // Change our line width and use a diamond shaped marker.
                    markerOptions: { style:'dimaond' }
                }
            ],
            legend:{show:true, location:'no'},
            seriesDefaults: {
                //                            pointLabels: { show:true } ,
                rendererOptions: {
                    smooth: true
                }
            },
            axes:{
                xaxis: {
                    renderer: jQuery.jqplot.CategoryAxisRenderer,
                    rendererOptions: { /*forceTickAt0: true, */forceTickAt: 100},
                    label: '',
                    labelRenderer: jQuery.jqplot.CanvasAxisLabelRenderer,
                    tickRenderer: jQuery.jqplot.CanvasAxisTickRenderer,
                    ticks: ticks

                }
            },
            highlighter: {
                show: true,
                sizeAdjust: 10,
                tooltipFormatString: ' %.2f',
                useAxesFormatters: false
            }
        });
    }

    viewIm();
</SCRIPT>
<script src="javascripts/jqPlot/example.js"></script>
<jsp:include page="c_footer.jsp"/>