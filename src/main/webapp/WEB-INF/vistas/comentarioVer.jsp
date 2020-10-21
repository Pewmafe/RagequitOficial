<%@ include file="header.jsp"%>
<br>
<c:if test="${not empty comentarios}">
	<c:forEach items="${comentarios}" var="comentario">

		<c:set var="tipoComentario" value="${comentario.getTipo()}"></c:set>

		<c:if test="${tipoComentario=='COMUN'}">

			<div class="container p-3 mb-2 colorCeleste text-white">

				<div class="row mb-4">

					<div
						class="d-flex flex-row user-info mb-3 col-md-2 col-lg-1 justify-content-center">
						<img class="rounded-circle" src="img/santiago.jpeg" width="50"
							height="50">
					</div>
					<div class="container col-md-10 col-lg-11 justify-content-center">

						<h5>Nombre de usuario</h5>
						<small>
							${comentario.getFechaHora().getHours()}:${comentario.getFechaHora().getMinutes()}
							hs ${comentario.getFechaHora().getDate()} /
							${comentario.getFechaHora().getMonth()} / ${anio} </small>
						<p>En respuesta a:</p>

						<div class="container colorComentario rounded">
							<p class="text-dark !important p-3">${comentario.getMensaje()}</p>
						</div>


						<p>${comentario.getTipo()}</p>

						<div class=" container row">

							<div>
								<form:form method="POST" action="meGustaComentario">
									<button type="submit" value="${comentario.getId()}"
										name="botonLike" class="btn btn-outline-warning botonBorrar">
										<i class="fas fa-star"></i>
									</button>
								</form:form>
								<!--  Esto tiene p�nta de hacerse de una manera mas limpia -->

							</div>

							<div class="ml-1">
								<p>${comentario.getCantidadLikes()}</p>
							</div>

							<div class="ml-3">

								<form method="" action="comentario">
									<button type="button"
										class="btn btn-outline-warning botonBorrar"
										data-toggle="modal" data-target="#responderComentario"
										data-id="${comentario.getId()}">
										<i class="far fa-comment-dots"></i>
									</button>
								</form>

							</div>

							<div class="ml-3">
								<form action="borrarComentario">
									<button type="button"
										class="btn btn-outline-warning botonBorrar"
										data-toggle="modal" data-target="#borrarComentario"
										data-id="${comentario.getId()}">
										<i class="far fa-trash-alt"></i>
									</button>
								</form>
							</div>

						</div>
					</div>
				</div>

			</div>

		</c:if>


		<c:if test="${tipoComentario=='SUSCRIPTOR'}">
			<div class="container p-3 mb-2 colorPremium text-white">

				<div class="row mb-4">
					<div
						class="d-flex flex-row user-info mb-3 col-md-2 col-lg-1 justify-content-center">
						<img class="rounded-circle" src="img/santiago.jpeg" width="50"
							height="50">
					</div>
					<div class="container col-md-10 col-lg-11 justify-content-center">

						<h4>Nombre de usuario</h4>
						<small>
							${comentario.getFechaHora().getHours()}:${comentario.getFechaHora().getMinutes()}
							hs ${comentario.getFechaHora().getDate()} /
							${comentario.getFechaHora().getMonth()} / ${anio} </small>
						<p>En respuesta a:</p>

						<div class="container colorComentario rounded">
							<p class="text-dark !important p-3">${comentario.getMensaje()}</p>
						</div>


						<p>${comentario.getTipo()}</p>

						<div class=" container row">

							<div>
								<form:form method="POST" action="meGustaComentario">
									<button type="submit" value="${comentario.getId()}"
										name="botonLike" class="btn btn-outline-warning botonBorrar">
										<i class="fas fa-star"></i>
									</button>
								</form:form>
								<!--  Esto tiene p�nta de hacerse de una manera mas limpia -->

							</div>

							<div class="ml-1">
								<p>${comentario.getCantidadLikes()}</p>
							</div>

							<div class="ml-3">

								<form method="" action="comentario">
									<button type="button"
										class="btn btn-outline-warning botonBorrar"
										data-toggle="modal" data-target="#responderComentario"
										data-id="${comentario.getId()}">
										<i class="far fa-comment-dots"></i>
									</button>
								</form>

							</div>

							<div class="ml-3">
								<form action="borrarComentario">
									<button type="button"
										class="btn btn-outline-warning botonBorrar"
										data-toggle="modal" data-target="#borrarComentario"
										data-id="${comentario.getId()}">
										<i class="far fa-trash-alt"></i>
									</button>
								</form>
							</div>

						</div>
					</div>
				</div>


			</div>
		</c:if>

	</c:forEach>
</c:if>




<div class="modal fade" id="borrarComentario" tabindex="-1"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title text-dark">Borrar comentario</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body text-dark">
				<p>�Seguro que deseas borrar el comentario?.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
				<form action="borrarComentario">
					<button type="submit" class="btn btn-danger" name="botonBorrar"
						id="botonBorrar">BORRAR</button>
				</form>

			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="responderComentario" tabindex="-1"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header colorCeleste p-3">
				<form action="comentarioMandar" class="container">
					<p>Respondiendo a</p>
					<div>
						<textarea id="respuestaMandar" name="respuestaMandar"
							class="form-control" rows="3" placeholder="Escribe tu respuesta"
							required></textarea>
					</div>

					<br>
					<div class="row">
						<input type="hidden" name="idComentario"
							value="${comentario.getId()}">
						<div class="col-md-6 col-lg-6 mt-6 mb-3">
							<button type="submit" class="btn btn-warning" value="comun"
								name="boton">Responder</button>
						</div>
						<div class="col-md-6 col-lg-6 mt-6">
							<button type="submit" class="btn btn-warning" value="premium"
								name="boton">Responder Premium</button>
						</div>
					</div>
			</div>
		</div>
	</div>
</div>

</main>

<!--  ACA NO VA EL ESTILO, ES PROVISORIO -->
<style>
.colorCeleste {
	background: #287EB0;
}

.colorComentario {
	background: #eceff0;
}

.colorPremium {
	background: #062255;
}
</style>

<!--  ACA NO VA EL ESTILO, ES PROVISORIO -->


<%@ include file="footer.jsp"%>