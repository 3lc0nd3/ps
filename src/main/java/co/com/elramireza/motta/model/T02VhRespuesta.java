package co.com.elramireza.motta.model;

import java.sql.Timestamp;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="t02_vh_respuesta")
public class T02VhRespuesta
{
	private int id;
	private int valor;
	private Timestamp fechaRespuesta;
	private T02VhPregunta t02VhPreguntaByIdPregunta;
	private Participante participanteByIdParticipante;

	@Id
	@Column(name="id")
	public int getId()
	{
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Basic
	@Column(name="valor")
	public int getValor()
	{
		return this.valor;
	}

	public void setValor(int valor) {
		this.valor = valor;
	}

	@Basic
	@Column(name="fecha_respuesta")
	public Timestamp getFechaRespuesta()
	{
		return this.fechaRespuesta;
	}

	public void setFechaRespuesta(Timestamp fechaRespuesta) {
		this.fechaRespuesta = fechaRespuesta;
	}

	@ManyToOne
	@JoinColumn(name="id_pregunta", referencedColumnName="id", nullable=false)
	public T02VhPregunta getT02VhPreguntaByIdPregunta()
	{
		return this.t02VhPreguntaByIdPregunta;
	}

	public void setT02VhPreguntaByIdPregunta(T02VhPregunta t02VhPreguntaByIdPregunta) {
		this.t02VhPreguntaByIdPregunta = t02VhPreguntaByIdPregunta;
	}

	@ManyToOne
	@JoinColumn(name="id_participante", referencedColumnName="id_participante", nullable=false)
	public Participante getParticipanteByIdParticipante()
	{
		return this.participanteByIdParticipante;
	}

	public void setParticipanteByIdParticipante(Participante participanteByIdParticipante) {
		this.participanteByIdParticipante = participanteByIdParticipante;
	}
}