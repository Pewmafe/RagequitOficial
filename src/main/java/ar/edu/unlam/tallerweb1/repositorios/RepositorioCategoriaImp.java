package ar.edu.unlam.tallerweb1.repositorios;

import javax.inject.Inject;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;


import ar.edu.unlam.tallerweb1.modelo.Categoria;

@Repository
public class RepositorioCategoriaImp implements RepositorioCategoria {
	
	@Inject
	private SessionFactory sessionFactory;

	@Override
	public void crearCategoria(Categoria categoria) {
		sessionFactory.getCurrentSession().save(categoria);
		
	}

	@Override
	public Categoria mostrarCategoriaPorId(Long id) {
		return sessionFactory.getCurrentSession().get(Categoria.class, id);
	}


	

}
