package ar.org.centro8.curso.java.aplicaciones.test;

import ar.org.centro8.curso.java.aplicaciones.entities.Cliente;
import ar.org.centro8.curso.java.aplicaciones.enums.TipoDocumento;
import ar.org.centro8.curso.java.aplicaciones.repositories.interfaces.I_ClienteRepository;
import ar.org.centro8.curso.java.aplicaciones.repositories.jdbc.ClienteRepository;
import ar.org.centro8.curso.java.connectors.Connector;

public class TestClienteRepository {
    public static void main(String[] args) {
        I_ClienteRepository cr = new ClienteRepository(Connector.getConnection());
        
        cr.save(new Cliente("Facundo", "Tapia", "Lavalle 3571", "facutapia06@gmail.com", "1141848451", TipoDocumento.DNI, 41112111));
        cr.save(new Cliente("Bernardo", "Garcia", "Medrano 150", "berni@gmail.com", "1141457861", TipoDocumento.DNI, 34116111));
        cr.save(new Cliente("Violeta", "Lopez", "Charcas 3000", "violeta@gmail.com", "1141347328", TipoDocumento.DNI, 22711111));
        
        cr.remove(cr.getById(59));
        
        Cliente cliente = cr.getById(98);
        if (cliente != null && cliente.getId()!= 0) {
            cliente.setNombre("Mauro");
            cr.update(cliente);
        }
        
        System.out.println("*********************************");
        cr.getAll().forEach(System.out::println);
    }
}
