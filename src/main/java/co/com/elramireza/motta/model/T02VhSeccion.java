package co.com.elramireza.motta.model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="t02_vh_seccion")
public class T02VhSeccion
{
	private int id;
	private String seccion;
	private String texto;

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
	@Column(name="seccion")
	public String getSeccion()
	{
		return this.seccion;
	}

	public void setSeccion(String seccion) {
		this.seccion = seccion;
	}

	@Basic
	@Column(name="texto")
	public String getTexto()
	{
		return this.texto;
	}

	public void setTexto(String texto) {
		this.texto = texto;
	}

}