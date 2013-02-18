package co.com.elramireza.motta.model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="t02_vh_pregunta")
public class T02VhPregunta
{
	private int id;
	private String pregunta;
	private T02VhSeccion t02VhSeccionByIdSeccion;
	private T02VhCategoria t02VhCategoriaByIdCategoria;

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
	@Column(name="pregunta")
	public String getPregunta()
	{
		return this.pregunta;
	}

	public void setPregunta(String pregunta) {
		this.pregunta = pregunta;
	}

	public boolean equals(Object o)
	{
		if (this == o) return true;
		if ((o == null) || (getClass() != o.getClass())) return false;

		T02VhPregunta that = (T02VhPregunta)o;

		if (this.id != that.id) return false;
		if (this.pregunta != null ? !this.pregunta.equals(that.pregunta) : that.pregunta != null) return false;

		return true;
	}

	public int hashCode()
	{
		int result = this.id;
		result = 31 * result + (this.pregunta != null ? this.pregunta.hashCode() : 0);
		return result;
	}

	@ManyToOne
	@JoinColumn(name="id_seccion", referencedColumnName="id", nullable=false)
	public T02VhSeccion getT02VhSeccionByIdSeccion()
	{
		return this.t02VhSeccionByIdSeccion;
	}

	public void setT02VhSeccionByIdSeccion(T02VhSeccion t02VhSeccionByIdSeccion) {
		this.t02VhSeccionByIdSeccion = t02VhSeccionByIdSeccion;
	}

	@ManyToOne
	@JoinColumn(name="id_categoria", referencedColumnName="id", nullable=false)
	public T02VhCategoria getT02VhCategoriaByIdCategoria()
	{
		return this.t02VhCategoriaByIdCategoria;
	}

	public void setT02VhCategoriaByIdCategoria(T02VhCategoria t02VhCategoriaByIdCategoria) {
		this.t02VhCategoriaByIdCategoria = t02VhCategoriaByIdCategoria;
	}
}