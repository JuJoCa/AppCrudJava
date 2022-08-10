package com.mycompany.restaurante.persistence.entities;

import com.mycompany.restaurante.persistence.entities.Categorias;
import com.mycompany.restaurante.persistence.entities.Proveedores;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-07-29T13:29:04")
@StaticMetamodel(Productos.class)
public class Productos_ { 

    public static volatile SingularAttribute<Productos, Categorias> idCatFk;
    public static volatile SingularAttribute<Productos, Proveedores> idProvFk;
    public static volatile SingularAttribute<Productos, Integer> precioProd;
    public static volatile SingularAttribute<Productos, Integer> idProd;
    public static volatile SingularAttribute<Productos, String> descripcionProd;

}