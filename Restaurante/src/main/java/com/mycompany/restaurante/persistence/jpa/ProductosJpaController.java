/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.restaurante.persistence.jpa;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import com.mycompany.restaurante.persistence.entities.Categorias;
import com.mycompany.restaurante.persistence.entities.Productos;
import com.mycompany.restaurante.persistence.entities.Proveedores;
import com.mycompany.restaurante.persistence.jpa.exceptions.NonexistentEntityException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

/**
 *
 * @author JUAN CARVAJAL
 */
public class ProductosJpaController implements Serializable {

    public ProductosJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Productos productos) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Categorias idCatFk = productos.getIdCatFk();
            if (idCatFk != null) {
                idCatFk = em.getReference(idCatFk.getClass(), idCatFk.getIdCat());
                productos.setIdCatFk(idCatFk);
            }
            Proveedores idProvFk = productos.getIdProvFk();
            if (idProvFk != null) {
                idProvFk = em.getReference(idProvFk.getClass(), idProvFk.getIdProv());
                productos.setIdProvFk(idProvFk);
            }
            em.persist(productos);
            if (idCatFk != null) {
                idCatFk.getProductosList().add(productos);
                idCatFk = em.merge(idCatFk);
            }
            if (idProvFk != null) {
                idProvFk.getProductosList().add(productos);
                idProvFk = em.merge(idProvFk);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Productos productos) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Productos persistentProductos = em.find(Productos.class, productos.getIdProd());
            Categorias idCatFkOld = persistentProductos.getIdCatFk();
            Categorias idCatFkNew = productos.getIdCatFk();
            Proveedores idProvFkOld = persistentProductos.getIdProvFk();
            Proveedores idProvFkNew = productos.getIdProvFk();
            if (idCatFkNew != null) {
                idCatFkNew = em.getReference(idCatFkNew.getClass(), idCatFkNew.getIdCat());
                productos.setIdCatFk(idCatFkNew);
            }
            if (idProvFkNew != null) {
                idProvFkNew = em.getReference(idProvFkNew.getClass(), idProvFkNew.getIdProv());
                productos.setIdProvFk(idProvFkNew);
            }
            productos = em.merge(productos);
            if (idCatFkOld != null && !idCatFkOld.equals(idCatFkNew)) {
                idCatFkOld.getProductosList().remove(productos);
                idCatFkOld = em.merge(idCatFkOld);
            }
            if (idCatFkNew != null && !idCatFkNew.equals(idCatFkOld)) {
                idCatFkNew.getProductosList().add(productos);
                idCatFkNew = em.merge(idCatFkNew);
            }
            if (idProvFkOld != null && !idProvFkOld.equals(idProvFkNew)) {
                idProvFkOld.getProductosList().remove(productos);
                idProvFkOld = em.merge(idProvFkOld);
            }
            if (idProvFkNew != null && !idProvFkNew.equals(idProvFkOld)) {
                idProvFkNew.getProductosList().add(productos);
                idProvFkNew = em.merge(idProvFkNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = productos.getIdProd();
                if (findProductos(id) == null) {
                    throw new NonexistentEntityException("The productos with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Productos productos;
            try {
                productos = em.getReference(Productos.class, id);
                productos.getIdProd();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The productos with id " + id + " no longer exists.", enfe);
            }
            Categorias idCatFk = productos.getIdCatFk();
            if (idCatFk != null) {
                idCatFk.getProductosList().remove(productos);
                idCatFk = em.merge(idCatFk);
            }
            Proveedores idProvFk = productos.getIdProvFk();
            if (idProvFk != null) {
                idProvFk.getProductosList().remove(productos);
                idProvFk = em.merge(idProvFk);
            }
            em.remove(productos);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Productos> findProductosEntities() {
        return findProductosEntities(true, -1, -1);
    }

    public List<Productos> findProductosEntities(int maxResults, int firstResult) {
        return findProductosEntities(false, maxResults, firstResult);
    }

    private List<Productos> findProductosEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Productos.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Productos findProductos(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Productos.class, id);
        } finally {
            em.close();
        }
    }

    public int getProductosCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Productos> rt = cq.from(Productos.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
