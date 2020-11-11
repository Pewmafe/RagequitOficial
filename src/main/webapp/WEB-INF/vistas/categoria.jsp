<%@ include file="header.jsp"%>
<main>
    <section>
        <article>
            <div>
                <h3 class="border-bottom text-center mb-4">Crear Categoria</h3>
            </div>
            <div class="text-center ">
                <p class="pl-3 text-justify text-size-categoria">
                    �Bienvenido! , dentro de esta secci�n podr&aacute;s crear categor&iacute;as para los distintos tipos
                    de Videojuegos, M&uacute;sica, Anime, entre muchas otras.
                </p>
            </div>
            <div class="anchoCategoria pad-2">
                <form action="agregarCategoria">
                    <div class="form-group">
                        <label for="crearCategoria">*Elija el nombre de la categoria:</label>
                        <input type="text" name="crearCategoria" id="crearCategoria" class="form-control" placeholder="Valorant, Anime, Musica ..." required>
                    </div>
                    <div>
                        <label for="filtro">*Elegir el tipo de categoria</label>
                        <select name="categoria" id="categoria" class="custom-select">
                            <option disabled selected>Seleccione una opcion</option>
                            <option value="Juegos">Juegos</option>
                            <option value="Varios">Varios</option>
                        </select>
                    </div>
                    <div class="text-right">
                        <button type="submit" class="btn btn-naranja mt-3 botonBloque">Crear</button>
                    </div>
                </form>
            </div>
            
            <!--<c:if test="${errorCategoria != 'null'}">-->
            <h4 class="text-danger"><span>${errorCategoria}</span></h4>
            <br>
        	</c:if>
            
            <div class="text-right subirDiv">
            <a href="irACategorias" class="irACategorias">Ver categorias creadas</a>
            </div>
        </article>
    </section>
</main>
<%@ include file="footer.jsp"%>