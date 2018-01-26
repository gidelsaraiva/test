
package dao;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author Alex
 */
public  class Conexao {
    
    
    private static EntityManagerFactory emf;
    
    
    private Conexao() {

    }

    public static EntityManagerFactory getConexao() {
        
        if ((emf == null) || (!emf.isOpen())) {
             emf = Persistence.createEntityManagerFactory("testPU");
               
        }
        return emf;
    }  
    
   
    public static void closeConexao(){
        if (emf.isOpen()){
           emf.close();
        }
    }
}


