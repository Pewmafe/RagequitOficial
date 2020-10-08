package ar.edu.unlam.tallerweb1.servicios;

import java.util.List;

import ar.edu.unlam.tallerweb1.modelo.Comentario;

public interface ServicioComentar {
	
	 Long enviarComentario(Comentario comentario);

	 Comentario mostrarComentario(Long id);
	
	 void borrarComentario(Long id);
	 
	 void darLikeComentario(Long id);
	 
	 List<Comentario> listaDeComentarios();

}