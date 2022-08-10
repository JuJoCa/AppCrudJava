package com.mycompany.restaurante.persistence.entities;

import com.mycompany.restaurante.persistence.entities.Productos;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-07-29T13:29:04")
@StaticMetamodel(Categorias.class)
public class Categorias_ { 

    public static volatile SingularAttribute<Categorias, String> descripcionCat;
    public static volatile ListAttribute<Categorias, Productos> productosList;
    public static volatile SingularAttribute<Categorias, Integer> idCat;

}