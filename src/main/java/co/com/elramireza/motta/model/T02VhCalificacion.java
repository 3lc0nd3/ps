package co.com.elramireza.motta.model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="t02_vh_calificacion")
public class T02VhCalificacion
{
	private String id;
	private int idParticipante;
	private String seccion;
	private String categoria;
	private long resultado;
	private int idSeccion;
	private int idCategoria;

	@Id
	@Column(name="id")
	public String getId()
	{
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Basic
	@Column(name="id_participante")
	public int getIdParticipante()
	{
		return this.idParticipante;
	}

	public void setIdParticipante(int idParticipante) {
		this.idParticipante = idParticipante;
	}

	@Basic
	@Column(name="seccion")
	public String getSeccion()
	{
		return this.seccion;
	}

	public void setSeccion(String seccion) {
		this.seccion = seccion;
	}

	@Basic
	@Column(name="categoria")
	public String getCategoria()
	{
		return this.categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	@Basic
	@Column(name="resultado")
	public long getResultado()
	{
		return this.resultado;
	}

	public void setResultado(long resultado) {
		this.resultado = resultado;
	}

	@Basic
	@Column(name="id_seccion")
	public int getIdSeccion()
	{
		return this.idSeccion;
	}

	public void setIdSeccion(int idSeccion) {
		this.idSeccion = idSeccion;
	}

	@Basic
	@Column(name="id_categoria")
	public int getIdCategoria()
	{
		return this.idCategoria;
	}

	public void setIdCategoria(int idCategoria) {
		this.idCategoria = idCategoria;
	}
}