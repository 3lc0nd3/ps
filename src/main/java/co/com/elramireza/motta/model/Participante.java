package co.com.elramireza.motta.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by Edward L. Ramirez A.
 * cel 300 554 3367
 * email elramireza@gmail.com
 * User: usuariox
 * Date: Nov 4, 2012
 * Time: 10:54:03 AM
 */
@Entity
@Table(name = "participante")
public class Participante {
    private int idParticipante;

    @Id
    @GenericGenerator(name = "generator", strategy = "increment")
    @GeneratedValue(generator = "generator")
    @Column(name = "id_participante")
    public int getIdParticipante() {
        return idParticipante;
    }

    public void setIdParticipante(int idParticipante) {
        this.idParticipante = idParticipante;
    }

    private String idFacebook;

    @Basic
    @Column(name = "id_facebook")
    public String getIdFacebook() {
        return idFacebook;
    }

    public void setIdFacebook(String idFacebook) {
        this.idFacebook = idFacebook;
    }

    private String idTwitter;

    @Basic
    @Column(name = "id_twitter")
    public String getIdTwitter() {
        return idTwitter;
    }

    public void setIdTwitter(String idTwitter) {
        this.idTwitter = idTwitter;
    }

    private String nombresParticipante;

    @Basic
    @Column(name = "nombres_participante")
    public String getNombresParticipante() {
        return nombresParticipante;
    }

    public void setNombresParticipante(String nombresParticipante) {
        this.nombresParticipante = nombresParticipante;
    }

    private String apellidosParticipante;

    @Basic
    @Column(name = "apellidos_participante")
    public String getApellidosParticipante() {
        return apellidosParticipante;
    }

    public void setApellidosParticipante(String apellidosParticipante) {
        this.apellidosParticipante = apellidosParticipante;
    }

    private String bioParticipante;

    @Basic
    @Column(name = "bio_participante")
    public String getBioParticipante() {
        return bioParticipante;
    }

    public void setBioParticipante(String bioParticipante) {
        this.bioParticipante = bioParticipante;
    }

    private String urlImagenParticipante;

    @Basic
    @Column(name = "url_imagen_participante")
    public String getUrlImagenParticipante() {
        return urlImagenParticipante;
    }

    public void setUrlImagenParticipante(String urlImagenParticipante) {
        this.urlImagenParticipante = urlImagenParticipante;
    }

    private String twitterParticipante;

    @Basic
    @Column(name = "twitter_participante")
    public String getTwitterParticipante() {
        return twitterParticipante;
    }

    public void setTwitterParticipante(String twitterParticipante) {
        this.twitterParticipante = twitterParticipante;
    }

    private String facebookParticipante;

    @Basic
    @Column(name = "facebook_participante")
    public String getFacebookParticipante() {
        return facebookParticipante;
    }

    public void setFacebookParticipante(String facebookParticipante) {
        this.facebookParticipante = facebookParticipante;
    }

    private String linkedinParticipante;

    @Basic
    @Column(name = "linkedin_participante")
    public String getLinkedinParticipante() {
        return linkedinParticipante;
    }

    public void setLinkedinParticipante(String linkedinParticipante) {
        this.linkedinParticipante = linkedinParticipante;
    }

    private String emailParticipante;

    @Basic
    @Column(name = "email_participante")
    public String getEmailParticipante() {
        return emailParticipante;
    }

    public void setEmailParticipante(String emailParticipante) {
        this.emailParticipante = emailParticipante;
    }

    private String celularParticipante;

    @Basic
    @Column(name = "celular_participante")
    public String getCelularParticipante() {
        return celularParticipante;
    }

    public void setCelularParticipante(String celularParticipante) {
        this.celularParticipante = celularParticipante;
    }

    private String skypeParticipante;

    @Basic
    @Column(name = "skype_participante")
    public String getSkypeParticipante() {
        return skypeParticipante;
    }

    public void setSkypeParticipante(String skypeParticipante) {
        this.skypeParticipante = skypeParticipante;
    }

    private String password;

    @Basic
    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    private Timestamp fechaIngresoParticipante;

    @Basic
    @Column(name = "fecha_ingreso_participante")
    public Timestamp getFechaIngresoParticipante() {
        return fechaIngresoParticipante;
    }

    public void setFechaIngresoParticipante(Timestamp fechaIngresoParticipante) {
        this.fechaIngresoParticipante = fechaIngresoParticipante;
    }

    String fechaNacimientoS;

    @Transient
    public String getFechaNacimientoS() {
        return fechaNacimientoS;
    }

    public void setFechaNacimientoS(String fechaNacimientoS) {
        this.fechaNacimientoS = fechaNacimientoS;
    }

    private Timestamp fechaNacimientoParticipante;

    @Basic
    @Column(name = "fecha_nacimiento_participante")
    public Timestamp getFechaNacimientoParticipante() {
        return fechaNacimientoParticipante;
    }

    public void setFechaNacimientoParticipante(Timestamp fechaNacimientoParticipante) {
        this.fechaNacimientoParticipante = fechaNacimientoParticipante;
    }

    private int grado;

    @Basic
    @Column(name = "grado")
    public int getGrado() {
        return grado;
    }

    public void setGrado(int grado) {
        this.grado = grado;
    }

    private String documentoIdentidad;

    @Basic
    @Column(name = "documento_identidad")
    public String getDocumentoIdentidad() {
        return documentoIdentidad;
    }

    public void setDocumentoIdentidad(String documentoIdentidad) {
        this.documentoIdentidad = documentoIdentidad;
    }

    private String jornada;

    @Basic
    @Column(name = "jornada")
    public String getJornada() {
        return jornada;
    }

    public void setJornada(String jornada) {
        this.jornada = jornada;
    }

    private int curso;

    @Basic
    @Column(name = "curso")
    public int getCurso() {
        return curso;
    }

    public void setCurso(int curso) {
        this.curso = curso;
    }
}
