/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.restaurante.persistence.entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author JUAN CARVAJAL
 */
@Entity
@Table(name = "productos")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Productos.findAll", query = "SELECT p FROM Productos p"),
    @NamedQuery(name = "Productos.findByIdProd", query = "SELECT p FROM Productos p WHERE p.idProd = :idProd"),
    @NamedQuery(name = "Productos.findByDescripcionProd", query = "SELECT p FROM Productos p WHERE p.descripcionProd = :descripcionProd"),
    @NamedQuery(name = "Productos.findByPrecioProd", query = "SELECT p FROM Productos p WHERE p.precioProd = :precioProd")})
public class Productos implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_prod")
    public Integer idProd;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 150)
    @Column(name = "descripcion_prod")
    private String descripcionProd;
    @Basic(optional = false)
    @NotNull
    @Column(name = "precio_prod")
    private int precioProd;
    @JoinColumn(name = "id_cat_fk", referencedColumnName = "id_cat")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Categorias idCatFk;
    @JoinColumn(name = "id_prov_fk", referencedColumnName = "id_prov")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Proveedores idProvFk;

    public Productos() {
    }

    public Productos(Integer idProd) {
        this.idProd = idProd;
    }

    public Productos(Integer idProd, String descripcionProd, int precioProd) {
        this.idProd = idProd;
        this.descripcionProd = descripcionProd;
        this.precioProd = precioProd;
    }

    public Integer getIdProd() {
        return idProd;
    }

    public void setIdProd(Integer idProd) {
        this.idProd = idProd;
    }

    public String getDescripcionProd() {
        return descripcionProd;
    }

    public void setDescripcionProd(String descripcionProd) {
        this.descripcionProd = descripcionProd;
    }

    public int getPrecioProd() {
        return precioProd;
    }

    public void setPrecioProd(int precioProd) {
        this.precioProd = precioProd;
    }

    public Categorias getIdCatFk() {
        return idCatFk;
    }

    public void setIdCatFk(Categorias idCatFk) {
        this.idCatFk = idCatFk;
    }

    public Proveedores getIdProvFk() {
        return idProvFk;
    }

    public void setIdProvFk(Proveedores idProvFk) {
        this.idProvFk = idProvFk;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idProd != null ? idProd.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Productos)) {
            return false;
        }
        Productos other = (Productos) object;
        if ((this.idProd == null && other.idProd != null) || (this.idProd != null && !this.idProd.equals(other.idProd))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.restaurante.persistence.entities.Productos[ idProd=" + idProd + " ]";
    }
    
}
