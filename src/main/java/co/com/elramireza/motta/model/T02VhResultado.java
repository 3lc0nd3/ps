package co.com.elramireza.motta.model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="t02_vh_resultado")
public class T02VhResultado
{
	private String id;
	private int idParticipante;
	private int idCategoria;
	private int resultado;
	private String categoria;

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
	@Column(name="id_categoria")
	public int getIdCategoria()
	{
		return this.idCategoria;
	}

	public void setIdCategoria(int idCategoria) {
		this.idCategoria = idCategoria;
	}

	@Basic
	@Column(name="resultado")
	public int getResultado()
	{
		return this.resultado;
	}

	public void setResultado(int resultado) {
		this.resultado = resultado;
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
}