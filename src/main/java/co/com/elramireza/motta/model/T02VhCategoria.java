package co.com.elramireza.motta.model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="t02_vh_categoria")
public class T02VhCategoria
{
	private int id;
	private String categoria;

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
	@Column(name="categoria")
	public String getCategoria()
	{
		return this.categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
}