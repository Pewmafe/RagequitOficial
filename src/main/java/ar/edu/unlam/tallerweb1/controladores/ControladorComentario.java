package ar.edu.unlam.tallerweb1.controladores;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.unlam.tallerweb1.modelo.Comentario;
import ar.edu.unlam.tallerweb1.servicios.ServicioComentar;

@Controller
public class ControladorComentario {

	@Inject
	private ServicioComentar servicioComentario;

	/* ---------- Pagina para comentar ----------- */
	@RequestMapping(path = "/comentario")
	public ModelAndView comentar() {
		return new ModelAndView("comentarioEscribir");
	}

	/* ---------- Pagina para imprimir comentarios ----------- */
	@RequestMapping(path = "/comentarioVisualizacion")
	public ModelAndView verComentario() {
		Comentario comentario = new Comentario();
		ModelMap modelo = new ModelMap();
		List<Comentario> comentarios = servicioComentario.mostrarTodosLosComentarios();

		if (comentarios.isEmpty()) {
			return new ModelAndView("redirect:/comentario", modelo);
		}

		modelo.put("comentarios", comentarios);
		modelo.put("comentario", comentario);

		return new ModelAndView("comentarioVer", modelo);
	}

	/* ---------- Pagina para guardar comentarios ----------- */
	@RequestMapping(path = "/guardarComentario", method = RequestMethod.POST)
	public ModelAndView enviarComentario(
			@RequestParam(value = "comentarioMandar", required = true) String comentarioMensaje,
			@RequestParam(value = "boton", required = true) String tipoBoton) {

		java.util.Date fecha = new Date();
		Comentario comentario = new Comentario();
		comentario.setCantidadLikes(0);
		comentario.setFechaHora(fecha);
		comentario.setMensaje(comentarioMensaje);
		servicioComentario.tipoComentario(tipoBoton, comentario);
		ModelMap modelo = new ModelMap();
		modelo.put("comentario", comentario);

		
		if (comentario.getMensaje().isEmpty() || comentario.getMensaje().substring(0,1).equals(" ")){
			return new ModelAndView("redirect:/comentario");
		}
		servicioComentario.enviarComentario(comentario);
		return new ModelAndView("redirect:/comentarioVisualizacion");

	}

	/* ---------- Pagina para borrar comentarios ----------- */

	@RequestMapping(path = "/borrarComentario")
	public ModelAndView eliminarComentario(@RequestParam(value = "botonBorrar", required = true) Long idComentario) {

		servicioComentario.borrarComentario(idComentario);
		return new ModelAndView("redirect:/comentarioVisualizacion");
	}

	/* ---------- Pagina para borrar likear ----------- */
	@RequestMapping(path = "/meGustaComentario", method = RequestMethod.POST)
	public ModelAndView darLikeComentario(@RequestParam(value = "botonLike", required = true) Long idLike) {

		servicioComentario.darLikeComentario(idLike);
		return new ModelAndView("redirect:/comentarioVisualizacion");
	}

	/* ---------- Pagina para responder comentarios ----------- */
	@RequestMapping(path = "/responderComentario", method = RequestMethod.POST)
	public ModelAndView guardarRespuesta(
			@RequestParam(value = "respuestaMandar", required = true) String respuestaMensaje,
			/* @RequestParam(value = "idComentario", required = true) Long idComentario, */
			@RequestParam(value = "boton", required = true) String tipoBoton) {

		java.util.Date fecha = new Date();
		Comentario respuesta = new Comentario();
		respuesta.setCantidadLikes(0);
		respuesta.setFechaHora(fecha);
		respuesta.setMensaje(respuestaMensaje);
		servicioComentario.tipoComentario(tipoBoton, respuesta);
		ModelMap modelo = new ModelMap();
		modelo.put("comentario", respuesta);
		
		Comentario comentario = servicioComentario.mostrarComentario((long) 1);
		respuesta.setRespuesta(comentario);
		
		
		if (respuesta.getMensaje().isEmpty() || respuesta.getMensaje().substring(0,1).equals(" ")){
			return new ModelAndView("redirect:/comentario");
		}
		servicioComentario.enviarComentario(respuesta);
		return new ModelAndView("redirect:/comentarioVisualizacion");
	}


}
