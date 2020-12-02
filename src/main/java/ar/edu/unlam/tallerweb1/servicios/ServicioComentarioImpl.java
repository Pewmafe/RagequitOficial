package ar.edu.unlam.tallerweb1.servicios;

import java.util.ArrayList;
import java.util.List;
import java.util.TreeSet;

import javax.inject.Inject;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.stereotype.Service;

import ar.edu.unlam.tallerweb1.modelo.Comentario;
import ar.edu.unlam.tallerweb1.modelo.ComentarioEstado;
import ar.edu.unlam.tallerweb1.modelo.ComentarioOrdenadoPorLikes;
import ar.edu.unlam.tallerweb1.modelo.ComentarioTipo;
import ar.edu.unlam.tallerweb1.modelo.LikeComentario;
import ar.edu.unlam.tallerweb1.modelo.Publicacion;
import ar.edu.unlam.tallerweb1.modelo.PublicacionOrdenPorFecha;
import ar.edu.unlam.tallerweb1.modelo.Usuario;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioComentario;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioLikeComentario;

@Service
@Transactional
public class ServicioComentarioImpl implements ServicioComentario {

	@Inject
	private RepositorioComentario repositorioComentar;
	@Inject
	ServicioPublicacion servicioPublicacion;
	@Inject
	private RepositorioLikeComentario repositorioLikeComentario;

	@Override
	public Long guardarComentario(Comentario comentario) {
		if (comentario.getRespuesta() == null) {
			servicioPublicacion.aumentarCantidadComentariosDePublicacion(comentario.getPublicacion());
			return repositorioComentar.enviarComentario(comentario);
		}
		servicioPublicacion.aumentarCantidadComentariosDePublicacion(comentario.getRespuesta().getPublicacion());
		return repositorioComentar.enviarComentario(comentario);

	}

	@Override
	public Comentario mostrarComentario(Long id) {
		return repositorioComentar.mostrarComentario(id);
	}

	@Override
	public void borrarComentario(Long id) {
		Comentario comentario = mostrarComentario(id);
		List<Comentario> respuesta = respuestaListado(comentario);

		if (comentario.getRespuesta() == null) {
			Publicacion publicacion = comentario.getPublicacion();
			servicioPublicacion.disminuirCantidadComentariosDePublicacion(publicacion);
		} else {
			Publicacion publicacion = comentario.getRespuesta().getPublicacion();
			servicioPublicacion.disminuirCantidadComentariosDePublicacion(publicacion);
		}

		if ((respuesta == null || respuesta.size() == 0) && comentario.getCantidadLikes() == 0) {
			repositorioComentar.borrarComentario(id);
		} else {
			comentario.setEstado(ComentarioEstado.INACTIVO);
		}
	}

	@Override
	public void tipoComentario(String boton, Comentario comentario) {
		switch (boton) {
		case "comun":
			comentario.setTipo(ComentarioTipo.COMUN);
			break;
		case "premium":
			comentario.setTipo(ComentarioTipo.SUSCRIPTOR);
			break;
		default:
			break;
		}
	}

	@Override
	public List<Comentario> devolverComentarioPorPublicacion(Publicacion publicacion) {
		return repositorioComentar.obtenerComentariosPorPublicacion(publicacion);
	}

	@Override
	public List<Comentario> devolverTodosLosComentariosyRespuestas() {
		return repositorioComentar.mostrarTodosLosComentarios();
	}

	@Override
	public List<Comentario> respuestaListado(Comentario comentario) {
		return repositorioComentar.respuestaListado(comentario);
	}

	@Override
	public Boolean verificarUsuario(Usuario usuarioLogueado, Usuario usuarioIngresado) {
		if (usuarioLogueado == usuarioIngresado) {
			return true;
		}
		return false;
	}

	@Override
	public void aumentarCantidadLikes(Comentario comentario) {
		Comentario like = repositorioComentar.mostrarComentario(comentario.getId());
		Integer cantidadLikes = like.getCantidadLikes() + 1;
		like.setCantidadLikes(cantidadLikes);
	}

	@Override
	public void disminuirCantidadLikes(Comentario comentario) {
		Comentario like = repositorioComentar.mostrarComentario(comentario.getId());
		Integer cantidadLikes = like.getCantidadLikes() - 1;
		like.setCantidadLikes(cantidadLikes);
	}


	@Override
	public TreeSet<Comentario> devolverListaComentarioPorMasLikes() {
		List<Comentario> comentarios = this.devolverSoloComentario();
		ComentarioOrdenadoPorLikes orden = new ComentarioOrdenadoPorLikes();
		TreeSet<Comentario> comentarioOrdenadoPorLikes = new TreeSet<Comentario>(orden);
		comentarioOrdenadoPorLikes.addAll(comentarios);
		return comentarioOrdenadoPorLikes;
	}

	@Override
	public List<Comentario> devolverSoloComentario() {
		List<Comentario> comentarioYrespuesta = devolverTodosLosComentariosyRespuestas();
		List<Comentario> nuevaLista = new ArrayList();
		for (Comentario comentario : comentarioYrespuesta) {
			if (comentario.getRespuesta() == null) {
				nuevaLista.add(comentario);
			}
		}
		return nuevaLista;
	}

	@Override
	public List<Comentario> devolverSoloRespuesta() {
		List<Comentario> comentarioYrespuesta = devolverTodosLosComentariosyRespuestas();
		List<Comentario> nuevaLista = new ArrayList();
		for (Comentario comentario : comentarioYrespuesta) {
			if (comentario.getRespuesta() != null) {
				nuevaLista.add(comentario);
			}
		}
		return nuevaLista;
	}


	@Override
	public TreeSet<Comentario> devolverListaRespuestaPorMasLikes() {
		List<Comentario> comentarios = this.devolverSoloRespuesta();
		ComentarioOrdenadoPorLikes orden = new ComentarioOrdenadoPorLikes();
		TreeSet<Comentario> comentarioOrdenadoPorLikes = new TreeSet<Comentario>(orden);
		comentarioOrdenadoPorLikes.addAll(comentarios);
		return comentarioOrdenadoPorLikes;
	}

}
