<%@ page import="co.com.elramireza.motta.model.Participante" %>
<%@ page import="co.com.elramireza.motta.model.Test" %>
<jsp:useBean id="mottaManager" class="co.com.elramireza.motta.dao.MottaDAO" scope="application"/>
<%
    Participante participante = (Participante) session.getAttribute("participante");
%>
<br>
<div class="container" >
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <a class="brand" href="/ps">Tests PS</a>
                <div class="nav-collapse collapse">
                    <ul class="nav">
                        <%--<li class="active"><a href="#">Inicio</a></li>--%>
                        <%
                            for(Test test: mottaManager.getTests()){
                        %>
                        <li><a href="<%=test.getUrl()%>"><%=test.getNombre()%></a></li>
                        <%
                            }
                        %>
                        <%--<li><a href="t02_ch.jsp">Cuestionario Holland</a></li>--%>
                    </ul>
                    <%
                        if(participante == null){ // NO hay usuario en session

                    %>
                    <%--<form class="navbar-form pull-right" action="login.jsp">
                        <input class="span2" type="text" placeholder="Email">
                        <input class="span2" type="password" placeholder="Password">
                        <button type="submit" class="btn">Sign in</button>
                    </form>--%>
                    <%
                        }

                    %>
                </div><!--/.nav-collapse -->
            </div>
        </div>
    </div>
</div>