package co.com.elramireza.motta.dao;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.List;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.sql.Timestamp;

import co.com.elramireza.motta.model.T01ImPregunta;
import co.com.elramireza.motta.model.Participante;
import co.com.elramireza.motta.model.Test;
import co.com.elramireza.motta.model.T01ImRespuesta;

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

    public String test(String tmp){
        logger.info("tmp = " + tmp);
        return "Hola: " + tmp;
    }

    public List<T01ImPregunta> getPreguntas(){
        return getHibernateTemplate().find("from T01ImPregunta order by id ");
    }

    public Participante getParticipante(String login,
                                        String password){
        Object o[] = {login, password};
        List<Participante> participantes = getHibernateTemplate().find(
                "from Participante where emailParticipante = ? and password = ? ",
                o
        );
        if(participantes.size()>0){
            return participantes.get(0);
        } else {
            return null;
        }
    }

    public List<Test> getTests(){
        return getHibernateTemplate().find(
                "from Test "
        );
    }

    public Test getTest(int id){
        return (Test) getHibernateTemplate().get(Test.class,id);
    }

    public int guardarT01(Participante participante, int[] respuestas){
        try {
            participante.setFechaNacimientoParticipante(new Timestamp(dfDate.parse(participante.getFechaNacimientoS()).getTime()));
        } catch (ParseException e) {
//            e.printStackTrace();
            logger.debug(e.getMessage());
        }
        Integer idP = (Integer) getHibernateTemplate().save(participante);
        participante.setIdParticipante(idP);

        T01ImRespuesta t01ImRespuesta;
        T01ImPregunta preguntaByIdPregunta;
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        for(int i=1; i<=35; i++){
            t01ImRespuesta = new T01ImRespuesta();
            t01ImRespuesta.setFechaRespuesta(timestamp);
            t01ImRespuesta.setParticipanteByIdParticipante(participante);
            preguntaByIdPregunta = new T01ImPregunta();
            preguntaByIdPregunta.setId(i);
            t01ImRespuesta.setT01ImPreguntaByIdPregunta(preguntaByIdPregunta);
            t01ImRespuesta.setValor(respuestas[i]);
            getHibernateTemplate().save(t01ImRespuesta);
//            logger.info("respuestas["+i+"] = " + respuestas[i]);
        }
        return 1;
    }

    public T01ImPregunta getT01ImPregunta(int id){
        return (T01ImPregunta) getHibernateTemplate().get(T01ImPregunta.class, id);
    }


    
}
