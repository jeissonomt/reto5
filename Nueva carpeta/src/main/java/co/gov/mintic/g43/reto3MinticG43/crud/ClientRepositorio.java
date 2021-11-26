/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/springframework/Repository.java to edit this template
 */
package co.gov.mintic.g43.reto3MinticG43.crud;

import co.gov.mintic.g43.reto3MinticG43.entidades.Client;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Lineth
 */
@Repository
public interface ClientRepositorio extends CrudRepository<Client, Long> {
    public Client findAllByIdClient(Long idClient);
    public Client deleteByIdClient(Long idClient);
    @Query("SELECT u FROM Client u")
    public List<Client> buscarclientes();
}
