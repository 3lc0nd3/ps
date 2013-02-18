package co.com.elramireza.motta.model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="t02_vh_nivel_educativo")
public class T02VhNivelEducativo
{
	private int id;
	private String nivel;

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
	@Column(name="nivel")
	public String getNivel()
	{
		return this.nivel;
	}

	public void setNivel(String nivel) {
		this.nivel = nivel;
	}


}