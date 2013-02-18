package co.com.elramireza.motta.model;

import java.sql.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Created by IntelliJ IDEA.
 * User: usuariox
 * Date: 18/02/13
 * Time: 01:23 AM
 */

@Entity
@Table(name="t01_im_resultado")
public class T01ImResultado {
	private int id;
	private Participante participanteByIdParticipante;
	private int aVL;
	private int bLM;
	private int cVE;
	private int dKC;
	private int eMR;
	private int fIntrapersonal;
	private int gInterpersonal;
	private int hNaturista;
	private Date fechaResultado;

	@Id
	@Column(name="id")
	public int getId()
	{
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
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

	@Basic
	@Column(name="a_v_l")
	public int getAVL()
	{
		return this.aVL;
	}

	public void setAVL(int aVL) {
		this.aVL = aVL;
	}

	@Basic
	@Column(name="b_l_m")
	public int getBLM()
	{
		return this.bLM;
	}

	public void setBLM(int bLM) {
		this.bLM = bLM;
	}

	@Basic
	@Column(name="c_v_e")
	public int getCVE()
	{
		return this.cVE;
	}

	public void setCVE(int cVE) {
		this.cVE = cVE;
	}

	@Basic
	@Column(name="d_k_c")
	public int getDKC()
	{
		return this.dKC;
	}

	public void setDKC(int dKC) {
		this.dKC = dKC;
	}

	@Basic
	@Column(name="e_m_r")
	public int getEMR()
	{
		return this.eMR;
	}

	public void setEMR(int eMR) {
		this.eMR = eMR;
	}

	@Basic
	@Column(name="f_intrapersonal")
	public int getFIntrapersonal()
	{
		return this.fIntrapersonal;
	}

	public void setFIntrapersonal(int fIntrapersonal) {
		this.fIntrapersonal = fIntrapersonal;
	}

	@Basic
	@Column(name="g_interpersonal")
	public int getGInterpersonal()
	{
		return this.gInterpersonal;
	}

	public void setGInterpersonal(int gInterpersonal) {
		this.gInterpersonal = gInterpersonal;
	}

	@Basic
	@Column(name="h_naturista")
	public int getHNaturista()
	{
		return this.hNaturista;
	}

	public void setHNaturista(int hNaturista) {
		this.hNaturista = hNaturista;
	}

	@Basic
	@Column(name="fecha_resultado")
	public Date getFechaResultado()
	{
		return this.fechaResultado;
	}

	public void setFechaResultado(Date fechaResultado) {
		this.fechaResultado = fechaResultado;
	}
}
