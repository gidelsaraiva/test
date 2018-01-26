/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;


import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import test.Pessoa;


/**
 *
 * @author marcelosiedler
 */
public class PessoaDao {
   
    EntityManager em;
    
    public  PessoaDao() throws Exception {
        
         EntityManagerFactory emf;
         emf = Conexao.getConexao();
         em = emf.createEntityManager();
 
            
        }


    
    public void incluir(Pessoa obj) throws Exception {
        try {
            em.getTransaction().begin();
            em.persist(obj);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            em.close();
            
        }
        
    }
//metodo de trazer todos que pessoa que tem no banco
    public List<Pessoa> listar() throws Exception {
        return em.createNamedQuery("Pessoa.findAll").getResultList();
    }
    
    // metodo para seleciona ou fazer uma pesquisa por matricula e retorna a pessoa e a matricula
    
    public List<Pessoa> listar(String matricula) throws Exception {
        //passar o parâmetro pra query
         TypedQuery<Pessoa> query = 
                 em.createNamedQuery("Pessoa.findByMatricula", Pessoa.class);
         
         //Seto o parâmetro
         query.setParameter("matricula", '%' + matricula + '%');
         //retorno minha lista
         return query.getResultList();
    }
    
    public void alterar(Pessoa obj) throws Exception {
        
        try {
            em.getTransaction().begin();
            em.merge(obj);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            em.close();
        }
    }
    
    public void excluir(Pessoa obj) throws Exception {
        
        try {
            em.getTransaction().begin();
            em.remove(obj);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
    }
    
    
    public Pessoa buscarPorMatricula(String matricula1) throws Exception
    {
       
        return em.find(Pessoa.class,matricula1);
       
    }
    
       

    public void fechaEmf() {
        Conexao.closeConexao();
    }
    

}