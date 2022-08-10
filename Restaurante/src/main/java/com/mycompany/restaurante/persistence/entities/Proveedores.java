/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.restaurante.persistence.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author JUAN CARVAJAL
 */
@Entity
@Table(name = "proveedores")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Proveedores.findAll", query = "SELECT p FROM Proveedores p"),
    @NamedQuery(name = "Proveedores.findByIdProv", query = "SELECT p FROM Proveedores p WHERE p.idProv = :idProv"),
    @NamedQuery(name = "Proveedores.findByNombreProv", query = "SELECT p FROM Proveedores p WHERE p.nombreProv = :nombreProv"),
    @NamedQuery(name = "Proveedores.findByDireccionProv", query = "SELECT p FROM Proveedores p WHERE p.direccionProv = :direccionProv"),
    @NamedQuery(name = "Proveedores.findByTelefonoProv", query = "SELECT p FROM Proveedores p WHERE p.telefonoProv = :telefonoProv")})
public class Proveedores implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_prov")
    public Integer idProv;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "nombre_prov")
    public String nombreProv;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "direccion_prov")
    public String direccionProv;
    @Size(max = 50)
    @Column(name = "telefono_prov")
    public String telefonoProv;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idProvFk", fetch = FetchType.EAGER)
    public List<Productos> productosList;

    public Proveedores() {
    }

    public Proveedores(Integer idProv) {
        this.idProv = idProv;
    }

    public Proveedores(Integer idProv, String nombreProv, String direccionProv, String telefonoProv) {
        this.idProv = idProv;
        this.nombreProv = nombreProv;
        this.direccionProv = direccionProv;
        this.telefonoProv = telefonoProv;
    }

    public Integer getIdProv() {
        return idProv;
    }

    public void setIdProv(Integer idProv) {
        this.idProv = idProv;
    }

    public String getNombreProv() {
        return nombreProv;
    }

    public void setNombreProv(String nombreProv) {
        this.nombreProv = nombreProv;
    }

    public String getDireccionProv() {
        return direccionProv;
    }

    public void setDireccionProv(String direccionProv) {
        this.direccionProv = direccionProv;
    }

    public String getTelefonoProv() {
        return telefonoProv;
    }

    public void setTelefonoProv(String telefonoProv) {
        this.telefonoProv = telefonoProv;
    }

    @XmlTransient
    public List<Productos> getProductosList() {
        return productosList;
    }

    public void setProductosList(List<Productos> productosList) {
        this.productosList = productosList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idProv != null ? idProv.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Proveedores)) {
            return false;
        }
        Proveedores other = (Proveedores) object;
        if ((this.idProv == null && other.idProv != null) || (this.idProv != null && !this.idProv.equals(other.idProv))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.restaurante.persistence.entities.Proveedores[ idProv=" + idProv + " ]";
    }
    
}
