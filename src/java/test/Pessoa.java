package test;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "pessoa")
@NamedQueries({
    @NamedQuery(name = "Pessoa.findAll", query = "SELECT p FROM Pessoa p"),
    @NamedQuery(name = "Pessoa.findByMatricula", query = "SELECT p FROM test.Pessoa p WHERE p.matricula like :matricula")
                 
})
public class Pessoa implements Serializable {

    @Id @GeneratedValue(strategy = GenerationType.AUTO)
   
    //@Column(unique = true)
    private Long id;
    private String matricula;
    private String nome;
    
         
   

    //<editor-fold defaultstate="collapsed" desc="gets & sets'">
    public Long getId() {
        return id;
    }
   
    public void setId(Long id) {
        this.id = id;
    }


    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    
    //</editor-fold>

   @Override
    public int hashCode() {
        int hash = 0;
        hash += (matricula != null ? matricula.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Pessoa
                )) {
            return false;
        }
        Pessoa other = (Pessoa) object;
        if ((this.matricula == null && other.matricula != null) || (this.matricula != null && !this.matricula.equals(other.matricula))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return matricula + " | "+nome;
    }
  
    
}
