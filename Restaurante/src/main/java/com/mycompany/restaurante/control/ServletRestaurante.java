/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.restaurante.control;

import com.mycompany.restaurante.persistence.entities.Categorias;
import static com.mycompany.restaurante.persistence.entities.Categorias_.idCat;
import com.mycompany.restaurante.persistence.entities.Productos;
import com.mycompany.restaurante.persistence.entities.Proveedores;
import com.mycompany.restaurante.persistence.entities.Usuarios;
import com.mycompany.restaurante.persistence.jpa.CategoriasJpaController;
import com.mycompany.restaurante.persistence.jpa.ProductosJpaController;
import com.mycompany.restaurante.persistence.jpa.ProveedoresJpaController;
import com.mycompany.restaurante.persistence.jpa.UsuariosJpaController;
import com.mycompany.restaurante.persistence.jpa.exceptions.IllegalOrphanException;
import com.mycompany.restaurante.persistence.jpa.exceptions.NonexistentEntityException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JDialog;
import javax.swing.JOptionPane;

/**
 *
 * @author JUAN CARVAJAL
 */
@WebServlet("/")
public class ServletRestaurante extends HttpServlet {
    private ProveedoresJpaController proveedoresJPA;
    private ProductosJpaController productosJPA;
    private CategoriasJpaController categoriasJPA;
    private UsuariosJpaController usuariosJPA;
    private final static String PU = "com.mycompany_Restaurante_war_1.0PU";

    @Override
    public void init() throws ServletException {
        super.init();
        //creamos una instancia de la clase EntityManagerFactory
        //esta clase se encarga de gestionar la construcción de entidades y
        //permite a los controladores JPA ejecutar las operaciones CRUD
        EntityManagerFactory emf = Persistence.createEntityManagerFactory(PU);
        //creamos una instancia del controldor JPA para la clase clients y le
        //pasamos el gestor de entidades
        proveedoresJPA = new ProveedoresJpaController(emf);
        productosJPA = new ProductosJpaController(emf);
        categoriasJPA = new CategoriasJpaController(emf);
        usuariosJPA = new UsuariosJpaController(emf);
        
        //esta parte es solamente para realizar la prueba:
        //listamos todos los clientes de la base de datos y los imprimimos en consola
        /*List<Proveedores> listaProveedores = proveedoresJPA.findProveedoresEntities();
        //imprimimos los clientes en consola
        for(Proveedores proveedor: listaProveedores){
            System.out.println("Nombre "+proveedor.getNombreProv());
        }*/
    }
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws com.mycompany.restaurante.persistence.jpa.exceptions.IllegalOrphanException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, IllegalOrphanException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getServletPath();
        
        try{
            switch (action){
                case "/new": //Muestra el formulario para crear un nuevo cliente
                    showNewForm(request, response);
                    break;
                case "/new2": //Muestra el formulario para crear un nuevo cliente
                    showNewForm2(request, response);
                    break;
                case "/insert": //ejecuta la creación de un nuevo cliente en la BD
                    insertDatos(request, response);
                    break;
                case "/insert2": //ejecuta la creación de un nuevo cliente en la BD
                    insertDatos2(request, response);
                    break;
                case "/delete": //Ejecuta la eliminación de un cliente de la BD
                    deleteDatos(request, response);
                    break;
                case "/delete2": //Ejecuta la eliminación de un cliente de la BD
                    deleteDatos2(request, response);
                    break;
                case "/edit": //Muestra el formulario para editar un cliente
                    showEditForm(request, response);
                    break;
                case "/edit2": //Muestra el formulario para editar un cliente
                    showEditForm2(request, response);
                    break;
                case "/update": //Ejecuta la edición de un cliente de la BD
                    updateDatos(request, response);
                    break;
                case "/list": //Ejecuta la edición de un cliente de la BD
                    listDatos(request, response);
                    break;
                case "/validar": //Ejecuta la edición de un cliente de la BD
                    validar(request, response);
                    break;
                case "/validar2": //Ejecuta la edición de un cliente de la BD
                    validar2(request, response);
                    break;
                case "/registro": //Ejecuta la edición de un cliente de la BD
                    registro(request, response);
                    break;
                case "/error": //Ejecuta la edición de un cliente de la BD
                    error(request, response);
                    break;
                default:
                    login(request, response);
                    break;
            }
        }catch(SQLException ex){
            throw new ServletException(ex);
        }
    }
    
    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        if(session!=null) {
            Usuarios usuario = new Usuarios();
            usuario.setIdUs(null);
            usuario.setUsuario(null);
            usuario.setEmail(null);
            usuario.setPassword(null);
            session.setAttribute("usuario", usuario);
        }
        
        
        //List<Usuarios> listaUsuarios = usuariosJPA.findUsuariosEntities();
        //System.out.println("lo que hay en session: "+usuario.usuario);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        dispatcher.forward(request, response);
    }
    
    private void error(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Error: inicie session pls");
        RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
        dispatcher.forward(request, response);
    }
    
    private void validar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        List<Usuarios> listaUsuarios = usuariosJPA.findUsuariosEntities();
        //request.setAttribute("listUsuarios", listaUsuarios);
        String user = request.getParameter("user");
        String password = request.getParameter("password");
        int u=0;
        
        
        for(int i=0;i<listaUsuarios.size();i++){
            if(user.equals(listaUsuarios.get(i).usuario) && password.equals(listaUsuarios.get(i).password)){          
                    System.out.println("Login correcto");
                    response.sendRedirect("list");
                    
                    Usuarios usuario = new Usuarios();
                    usuario.setIdUs(listaUsuarios.get(i).idUs);
                    usuario.setUsuario(listaUsuarios.get(i).usuario);
                    usuario.setPassword(listaUsuarios.get(i).password);
                    usuario.setEmail(listaUsuarios.get(i).email);
                    
                    HttpSession session = request.getSession();
                    session.setAttribute("usuario", usuario); 
            }else{u++;}
        }

        if(u==listaUsuarios.size()){
            response.sendRedirect("login");
            JOptionPane optionPane = new JOptionPane("Error de Login",JOptionPane.WARNING_MESSAGE);
            JDialog dialog = optionPane.createDialog("Warning!"); 
            dialog.setAlwaysOnTop(true); // to show top of all other application 
            dialog.setVisible(true); // to visible the dialog
        }
    }
    
    private void registro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("registro.jsp");
        dispatcher.forward(request, response);
    }
    
    private void validar2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String user = request.getParameter("usernew");
        String email = request.getParameter("emailnew");
        String password = request.getParameter("passwordnew");
        
        Usuarios usr = new Usuarios();
        usr.setUsuario(user);
        usr.setEmail(email);
        usr.setPassword(password);
        
        usuariosJPA.create(usr);
        response.sendRedirect("login");
    }
    
    private void listDatos(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        HttpSession session = request.getSession(); //Recupera la sesion
        Usuarios usuario = (Usuarios) session.getAttribute("usuario");
        List<Usuarios> listaUsuarios = usuariosJPA.findUsuariosEntities();

        if(usuario.usuario != null){
            for(int i=0;i<listaUsuarios.size();i++){
                if(usuario.usuario.equals(listaUsuarios.get(i).usuario)){
                    List<Proveedores> listaProveedores = proveedoresJPA.findProveedoresEntities();
                    List<Productos> listaProductos = productosJPA.findProductosEntities();
                    List<Categorias> listaCategorias = categoriasJPA.findCategoriasEntities();

                    request.setAttribute("listProveedores", listaProveedores);
                    request.setAttribute("listProductos", listaProductos);
                    request.setAttribute("listCategorias", listaCategorias);
                    request.setAttribute("listUsuario", listaUsuarios.get(i));

                    RequestDispatcher dispatcher = request.getRequestDispatcher("list-datos.jsp");
                    dispatcher.forward(request, response);

                }

            }
        }
        if(usuario.usuario == null){
            response.sendRedirect("error");
        }      
    }
    
    //muestra el formulario para crear un nuevo usuario
    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Usuarios usuario = (Usuarios) session.getAttribute("usuario");
        List<Usuarios> listaUsuarios = usuariosJPA.findUsuariosEntities();

        if(usuario.usuario != null){
            for(int i=0;i<listaUsuarios.size();i++){
                if(usuario.usuario.equals(listaUsuarios.get(i).usuario)){
                    List<Proveedores> listaProveedores = proveedoresJPA.findProveedoresEntities();
                    List<Categorias> listaCategorias = categoriasJPA.findCategoriasEntities();

                    request.setAttribute("listProveedores", listaProveedores);
                    request.setAttribute("listCategorias", listaCategorias);

                    RequestDispatcher dispatcher = request.getRequestDispatcher("client-form.jsp");
                    dispatcher.forward(request, response);
                }
            }
        }
        if(usuario.usuario == null){
            response.sendRedirect("error");
        }
    }
    
    private void showNewForm2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Usuarios usuario = (Usuarios) session.getAttribute("usuario");
        List<Usuarios> listaUsuarios = usuariosJPA.findUsuariosEntities();

        if(usuario.usuario != null){
            for(int i=0;i<listaUsuarios.size();i++){
                if(usuario.usuario.equals(listaUsuarios.get(i).usuario)){
                    RequestDispatcher dispatcher = request.getRequestDispatcher("proveedor-form.jsp");
                    dispatcher.forward(request, response);
                }
            }
        }
        if(usuario.usuario == null){
            response.sendRedirect("error");
        }
    }
    
    //muestra el formulario para editar un usuario
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        HttpSession session = request.getSession();
        Usuarios usuario = (Usuarios) session.getAttribute("usuario");
        List<Usuarios> listaUsuarios = usuariosJPA.findUsuariosEntities();

        if(usuario.usuario != null){
            for(int i=0;i<listaUsuarios.size();i++){
                if(usuario.usuario.equals(listaUsuarios.get(i).usuario)){
                    int idProv = Integer.parseInt(request.getParameter("idProv"));
                    //busca al cliente en la base de datos
                    Proveedores existingProveedor = proveedoresJPA.findProveedores(idProv);
                    //Productos existingProducto = productosJPA.findProductos(id_prod);
                    RequestDispatcher dispatcher = null;
                    if ((existingProveedor != null)) {
                        //si lo encuentra lo envía al formulario
                        dispatcher = request.getRequestDispatcher("list-proveedor.jsp");
                        request.setAttribute("Proveedor", existingProveedor);
                    } else {
                        //si no lo encuentra regresa a la página con la lista de los clientes
                        dispatcher = request.getRequestDispatcher("list-clients.jsp");
                    }
                    dispatcher.forward(request, response);
                    }
            }
        }
        if(usuario.usuario == null){
            response.sendRedirect("error");
        }
    }
    
    private void showEditForm2(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        HttpSession session = request.getSession();
        Usuarios usuario = (Usuarios) session.getAttribute("usuario");
        List<Usuarios> listaUsuarios = usuariosJPA.findUsuariosEntities();

        if(usuario.usuario != null){
            for(int i=0;i<listaUsuarios.size();i++){
                if(usuario.usuario.equals(listaUsuarios.get(i).usuario)){
                    int idProv = Integer.parseInt(request.getParameter("idProv"));
                    int idProd = Integer.parseInt(request.getParameter("idProd"));
                    int idCat = Integer.parseInt(request.getParameter("idCat"));

                    //busca al cliente en la base de datos
                    Proveedores existingProveedor = proveedoresJPA.findProveedores(idProv);
                    Productos existingProducto = productosJPA.findProductos(idProd);
                    Categorias existingCategoria = categoriasJPA.findCategorias(idCat);
                    List<Categorias> listaCategorias = categoriasJPA.findCategoriasEntities();
                    //Productos existingProducto = productosJPA.findProductos(id_prod);
                    RequestDispatcher dispatcher = null;
                    if ((existingProveedor != null)) {
                        if ((existingProducto != null)) {
                            if ((existingCategoria != null)) {
                                //si lo encuentra lo envía al formulario
                                dispatcher = request.getRequestDispatcher("client-form.jsp");
                                request.setAttribute("Proveedor", existingProveedor);
                                request.setAttribute("Producto", existingProducto);
                                request.setAttribute("Categoria", existingCategoria);
                                request.setAttribute("listCategorias", listaCategorias);
                            }}} else {
                                //si no lo encuentra regresa a la página con la lista de los clientes
                                dispatcher = request.getRequestDispatcher("list-clients.jsp");
                            }
                    dispatcher.forward(request, response);
                    }
            }
        }
        if(usuario.usuario == null){
            response.sendRedirect("error");
        }
    }
    
    //método para crear un cliente en la base de datos
    private void insertDatos(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        HttpSession session = request.getSession();
        Usuarios usuario = (Usuarios) session.getAttribute("usuario");
        List<Usuarios> listaUsuarios = usuariosJPA.findUsuariosEntities();

        if(usuario.usuario != null){
            for(int c=0;c<listaUsuarios.size();c++){
                if(usuario.usuario.equals(listaUsuarios.get(c).usuario)){
                    String idProv = request.getParameter("listaproveedores");
                    String descripcionProd = request.getParameter("descripcionProd");
                    String precioProd = request.getParameter("precioProd");
                    String idCat = request.getParameter("listacategorias");
                    List<Proveedores> listaProveedores = proveedoresJPA.findProveedoresEntities();

                    for(int i=0; i < listaProveedores.size();i++){
                        if(Integer.parseInt(idProv) == listaProveedores.get(i).idProv){
                            String nombreProv = listaProveedores.get(i).nombreProv;
                            String direccionProv = listaProveedores.get(i).direccionProv;
                            String telefonoProv = listaProveedores.get(i).telefonoProv;
                            Proveedores prv = new Proveedores(Integer.parseInt(idProv),nombreProv,direccionProv,telefonoProv);

                            List<Categorias> listaCategorias = categoriasJPA.findCategoriasEntities();

                            for(int x=0; x < listaCategorias.size();x++){
                                if(Integer.parseInt(idCat) == listaCategorias.get(x).idCat){
                                    String descripcionCat = listaCategorias.get(x).descripcionCat;
                                    Categorias ctg = new Categorias(Integer.parseInt(idCat),descripcionCat);   

                                    Productos prd = new Productos();
                                    prd.setDescripcionProd(descripcionProd);
                                    prd.setPrecioProd(Integer.parseInt(precioProd));
                                    prd.setIdCatFk(ctg);
                                    prd.setIdProvFk(prv);

                                    productosJPA.create(prd);
                                }
                            }
                        }
                    }
                    response.sendRedirect("list");
                    }
                }
            }
        if(usuario.usuario == null){
            response.sendRedirect("error");
        }
    }
    
    private void insertDatos2(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        HttpSession session = request.getSession();
        Usuarios usuario = (Usuarios) session.getAttribute("usuario");
        List<Usuarios> listaUsuarios = usuariosJPA.findUsuariosEntities();

        if(usuario.usuario != null){
            for(int c=0;c<listaUsuarios.size();c++){
                if(usuario.usuario.equals(listaUsuarios.get(c).usuario)){
                    String nombreProv = request.getParameter("nombreProv");
                    String direccionProv = request.getParameter("direccionProv");
                    String telefonoProv = request.getParameter("telefonoProv");
                    //crea un objeto de tipo Clients vacío y lo llena con los datos obtenidos
                    Proveedores proveedor = new Proveedores();
                    proveedor.setNombreProv(nombreProv);
                    proveedor.setDireccionProv(direccionProv);
                    proveedor.setTelefonoProv(telefonoProv);

                    proveedoresJPA.create(proveedor);
                    response.sendRedirect("list");
                    }
                }
            }
        if(usuario.usuario == null){
            response.sendRedirect("error");
        }
    }
    
    //Método para editar un cliente
    private void updateDatos(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {      
        HttpSession session = request.getSession();
        Usuarios usuario = (Usuarios) session.getAttribute("usuario");
        List<Usuarios> listaUsuarios = usuariosJPA.findUsuariosEntities();

        if(usuario.usuario != null){
            for(int c=0;c<listaUsuarios.size();c++){
                if(usuario.usuario.equals(listaUsuarios.get(c).usuario)){
                    String idProv = request.getParameter("idProv");
                    String idProd = request.getParameter("idProd");
                    String descripcionProd = request.getParameter("descripcionProd");
                    String precioProd = request.getParameter("precioProd");

                    String idCat = request.getParameter("listacategorias");

                    List<Proveedores> listaProveedores = proveedoresJPA.findProveedoresEntities();

                    for(int i=0; i < listaProveedores.size();i++){
                        if(Integer.parseInt(idProv) == listaProveedores.get(i).idProv){
                            String nombreProv = listaProveedores.get(i).nombreProv;
                            String direccionProv = listaProveedores.get(i).direccionProv;
                            String telefonoProv = listaProveedores.get(i).telefonoProv;
                            Proveedores prv = new Proveedores(Integer.parseInt(idProv),nombreProv,direccionProv,telefonoProv);

                            List<Categorias> listaCategorias = categoriasJPA.findCategoriasEntities();

                            for(int x=0; x < listaCategorias.size();x++){
                                if(Integer.parseInt(idCat) == listaCategorias.get(x).idCat){
                                    String descripcionCat = listaCategorias.get(x).descripcionCat;
                                    Categorias ctg = new Categorias(Integer.parseInt(idCat),descripcionCat);   

                                    Productos prd = new Productos();
                                    prd.setIdProd(Integer.parseInt(idProd));
                                    prd.setDescripcionProd(descripcionProd);
                                    prd.setPrecioProd(Integer.parseInt(precioProd));
                                    prd.setIdCatFk(ctg);
                                    prd.setIdProvFk(prv);

                                    //System.out.println("Los productos: "+prd);

                                    try {
                                        //Edita el cliente en la BD
                                        productosJPA.edit(prd);
                                    } catch (Exception ex) {
                                        Logger.getLogger(ServletRestaurante.class.getName()).log(Level.SEVERE, null, ex);
                                    }
                                }
                            }
                        }
                    }
                    //crea un objeto vacío y lo llena con los datos del cliente
                    response.sendRedirect("list");
                    }
                }
            }
        if(usuario.usuario == null){
            response.sendRedirect("error");
        }
    }
    
    //Elimina un cliente de la BD
    private void deleteDatos(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, IllegalOrphanException {
        HttpSession session = request.getSession();
        Usuarios usuario = (Usuarios) session.getAttribute("usuario");
        List<Usuarios> listaUsuarios = usuariosJPA.findUsuariosEntities();

        if(usuario.usuario != null){
            for(int c=0;c<listaUsuarios.size();c++){
                if(usuario.usuario.equals(listaUsuarios.get(c).usuario)){
                    int idProv = Integer.parseInt(request.getParameter("idProv"));
                    List<Proveedores> listaProveedores = proveedoresJPA.findProveedoresEntities();

                    for(int i=0; i < listaProveedores.size();i++){
                        if(idProv == listaProveedores.get(i).idProv){
                            List<Productos> productos = listaProveedores.get(i).productosList;
                            //System.out.println("El producto eliminado: "+productos);
                            try {
                                //Elimina el cliente con el id indicado                  
                                for(int x=0; x < productos.size();x++){
                                    int idProd = productos.get(x).idProd;
                                    productosJPA.destroy(idProd);
                                    System.out.println("Se elimino el producto con id: "+idProd);
                                }
                                proveedoresJPA.destroy(idProv);
                                System.out.println("Se elimino el proveedor con id: "+idProv);
                            } catch (NonexistentEntityException ex) {
                                Logger.getLogger(ServletRestaurante.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        }
                    }        

                    response.sendRedirect("list");
                    }
                }
            }
        if(usuario.usuario == null){
            response.sendRedirect("error");
        }
    }
    
    private void deleteDatos2(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, IllegalOrphanException {
        HttpSession session = request.getSession();
        Usuarios usuario = (Usuarios) session.getAttribute("usuario");
        List<Usuarios> listaUsuarios = usuariosJPA.findUsuariosEntities();

        if(usuario.usuario != null){
            for(int c=0;c<listaUsuarios.size();c++){
                if(usuario.usuario.equals(listaUsuarios.get(c).usuario)){
                    int idProd = Integer.parseInt(request.getParameter("idProd"));
                    //int id_prod3 = Integer.parseInt(request.getParameter("idProd"));

                    try {
                        //Elimina el cliente con el id indicado
                        productosJPA.destroy(idProd);
                        //productosJPA.destroy(id_prod3);
                    } catch (NonexistentEntityException ex) {
                        Logger.getLogger(ServletRestaurante.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    response.sendRedirect("list");
                    }
                }
            }
        if(usuario.usuario == null){
            response.sendRedirect("error");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> mhetod.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            processRequest(request, response);
        } catch (IllegalOrphanException ex) {
            Logger.getLogger(ServletRestaurante.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (IllegalOrphanException ex) {
            Logger.getLogger(ServletRestaurante.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
