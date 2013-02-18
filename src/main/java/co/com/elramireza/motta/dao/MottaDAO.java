package co.com.elramireza.motta.dao;

import co.com.elramireza.motta.model.*;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * Created by Edward L. Ramirez A.
 * cel 300 554 3367
 * email elramireza@gmail.com
 * User: usuariox
 * Date: Sep 26, 2012
 * Time: 3:43:06 PM
 */
@SuppressWarnings({
        "deprecation", "unchecked"
})
public class MottaDAO extends HibernateDaoSupport{

	private SimpleDateFormat dfDate = new SimpleDateFormat("dd/MM/yyyy");

	public String test(String tmp) {
		this.logger.info("tmp = " + tmp);
		return "Hola: " + tmp;
	}

	public List<T01ImPregunta> getPreguntas() {
		return getHibernateTemplate().find("from T01ImPregunta order by id ");
	}

	public Participante getParticipanteId(int id) {
		return (Participante)getHibernateTemplate().get(Participante.class, Integer.valueOf(id));
	}

	public Participante getParticipante(String login, String password)
	{
		Object[] o = { login, password };
		List participantes = getHibernateTemplate().find("from Participante where emailParticipante = ? and password = ? ", o);

		if (participantes.size() > 0) {
			return (Participante)participantes.get(0);
		}
		return null;
	}

	public List<Test> getTests()
	{
		return getHibernateTemplate().find("from Test ");
	}

	public Test getTest(int id)
	{
		return (Test)getHibernateTemplate().get(Test.class, Integer.valueOf(id));
	}

	public int guardarT01(Participante participante, int[] respuestas) {
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		try {
			participante.setFechaNacimientoParticipante(new Timestamp(this.dfDate.parse(participante.getFechaNacimientoS()).getTime()));
			participante.setFechaIngresoParticipante(timestamp);
		}
		catch (ParseException e) {
			this.logger.debug(e.getMessage());
		}
		Integer idP = (Integer)getHibernateTemplate().save(participante);
		participante.setIdParticipante(idP.intValue());

		for (int i = 1; i <= 35; i++) {
			T01ImRespuesta t01ImRespuesta = new T01ImRespuesta();
			t01ImRespuesta.setFechaRespuesta(timestamp);
			t01ImRespuesta.setParticipanteByIdParticipante(participante);
			T01ImPregunta preguntaByIdPregunta = new T01ImPregunta();
			preguntaByIdPregunta.setId(i);
			t01ImRespuesta.setT01ImPreguntaByIdPregunta(preguntaByIdPregunta);
			t01ImRespuesta.setValor(respuestas[i]);
			getHibernateTemplate().save(t01ImRespuesta);
		}

		return 1;
	}

	public int guardarT02(Participante participante, int[] respuestas) {
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		try {
			participante.setFechaNacimientoParticipante(new Timestamp(this.dfDate.parse(participante.getFechaNacimientoS()).getTime()));
			participante.setFechaIngresoParticipante(timestamp);
		}
		catch (ParseException e) {
			this.logger.debug(e.getMessage());
		}
		Integer idP = (Integer)getHibernateTemplate().save(participante);
		participante.setIdParticipante(idP.intValue());

		for (int i = 1; i <= 215; i++) {
			T02VhRespuesta t02VhRespuesta = new T02VhRespuesta();
			t02VhRespuesta.setFechaRespuesta(timestamp);
			t02VhRespuesta.setParticipanteByIdParticipante(participante);
			T02VhPregunta preguntaByIdPregunta = new T02VhPregunta();
			preguntaByIdPregunta.setId(i);
			t02VhRespuesta.setT02VhPreguntaByIdPregunta(preguntaByIdPregunta);
			t02VhRespuesta.setValor(respuestas[i]);
			getHibernateTemplate().save(t02VhRespuesta);
		}

		return 1;
	}

	public T01ImPregunta getT01ImPregunta(int id) {
		return (T01ImPregunta)getHibernateTemplate().get(T01ImPregunta.class, Integer.valueOf(id));
	}

	public List<T02VhSeccion> getVhSecciones() {
		return getHibernateTemplate().find("from T02VhSeccion order by id ");
	}

	public List<T02VhPregunta> getprT02VhPreguntasFromSeccion(int idSeccion)
	{
		return getHibernateTemplate().find("from T02VhPregunta where t02VhSeccionByIdSeccion.id = ? order by id ", Integer.valueOf(idSeccion));
	}

	public List<Participante> getParticipanteT01()
	{
		return getHibernateTemplate().find("from Participante where idParticipante in \n(select distinct participanteByIdParticipante.idParticipante from T01ImRespuesta) \n order by jornada, grado, curso, nombresParticipante, apellidosParticipante ");
	}

	public T01ImResultado getT01ImResultado(int idParticipante)
	{
		List resultados = getHibernateTemplate().find("from T01ImResultado where participanteByIdParticipante.idParticipante = ? ", Integer.valueOf(idParticipante));

		if (resultados.size() > 0) {
			return (T01ImResultado)resultados.get(0);
		}
		return null;
	}

	public List<Participante> getParticipantesT02Vh()
	{
		return getHibernateTemplate().find("from Participante where idParticipante in (select distinct participanteByIdParticipante.idParticipante from T02VhRespuesta )  order by jornada, grado, curso, nombresParticipante, apellidosParticipante ");
	}

	public T01ImResultado getT01CalificacionParticipante(int idParticipante)
	{
		T01ImResultado resultado = getT01ImResultado(idParticipante);
		if (resultado != null) {
			return resultado;
		}

		resultado = new T01ImResultado();
		List<T01ImRespuesta> respuestas = getHibernateTemplate().find("from T01ImRespuesta where participanteByIdParticipante.idParticipante = ?", Integer.valueOf(idParticipante));

		int aVL = 0;
		int bLM = 0;
		int cVE = 0;
		int dKC = 0;
		int eMR = 0;
		int fIntra = 0;
		int gInter = 0;
		for (T01ImRespuesta respuesta : respuestas) {
			switch (respuesta.getT01ImPreguntaByIdPregunta().getId()) {
				case 9:
				case 10:
				case 17:
				case 22:
				case 30:
					aVL += respuesta.getValor();
					break;
				case 5:
				case 7:
				case 15:
				case 20:
				case 25:
					bLM += respuesta.getValor();
					break;
				case 1:
				case 11:
				case 14:
				case 23:
				case 27:
					cVE += respuesta.getValor();
					break;
				case 8:
				case 16:
				case 19:
				case 21:
				case 29:
					dKC += respuesta.getValor();
					break;
				case 3:
				case 4:
				case 13:
				case 24:
				case 28:
					eMR += respuesta.getValor();
					break;
				case 2:
				case 6:
				case 26:
				case 31:
				case 33:
					fIntra += respuesta.getValor();
					break;
				case 12:
				case 18:
				case 32:
				case 34:
				case 35:
					gInter += respuesta.getValor();
			}

		}

		resultado.setParticipanteByIdParticipante(getParticipanteId(idParticipante));
		resultado.setAVL(aVL);
		resultado.setBLM(bLM);
		resultado.setCVE(cVE);
		resultado.setDKC(dKC);
		resultado.setEMR(eMR);
		resultado.setFIntrapersonal(fIntra);
		resultado.setGInterpersonal(gInter);
		resultado.setFechaResultado(new java.sql.Date(System.currentTimeMillis()));

		getHibernateTemplate().save(resultado);

		return getT01CalificacionParticipante(idParticipante);
	}

	public List<T02VhCalificacion> getT02VhCalificacion(int idParticipante)
	{
		return getHibernateTemplate().find("from T02VhCalificacion where idParticipante = ?", Integer.valueOf(idParticipante));
	}

	public List<T02VhResultado> getT02VhResultados(int idParticipante)
	{
		return getHibernateTemplate().find("from T02VhResultado where idParticipante = ? ", Integer.valueOf(idParticipante));
	}

	public List<T02VhCarrera> getT02VhCarreras(int idCategoria1, int idCategoria2)
	{
		Object[] o = { Integer.valueOf(idCategoria1), Integer.valueOf(idCategoria2) };
		return getHibernateTemplate().find("from T02VhCarrera where t02VhCategoriaByIdCategoria1 .id = ? and t02VhCategoriaByIdCategoria2.id = ? ", o);
	}
}