/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/springframework/Repository.java to edit this template
 */
package co.gov.mintic.g43.reto3MinticG43.crud;

import co.gov.mintic.g43.reto3MinticG43.entidades.Reservation;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Lineth
 */
@Repository
public interface ReservationRepositorio extends CrudRepository<Reservation, Long> {
    public Reservation findAllByIdReservation(Long idReservation);
    public Reservation deleteByIdReservation(Long idReservation);
    @Query("SELECT u FROM Reservation u")
    public List<Reservation> buscarreservas();
}
