package co.com.elramireza.motta.model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="t02_vh_ocupacion")
public class T02VhOcupacion
{
	private int id;
	private String ocupacion;

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
	@Column(name="ocupacion")
	public String getOcupacion()
	{
		return this.ocupacion;
	}

	public void setOcupacion(String ocupacion) {
		this.ocupacion = ocupacion;
	}


}