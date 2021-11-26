/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/springframework/Service.java to edit this template
 */
package co.gov.mintic.g43.reto3MinticG43.servicios;

import co.gov.mintic.g43.reto3MinticG43.crud.ReservationRepositorio;
import co.gov.mintic.g43.reto3MinticG43.entidades.Reservation;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Lineth
 */
@Service
public class ReservationServicio {

    @Autowired
    ReservationRepositorio reservationRepo;

    public void guardarReservation(Reservation reservation) {
        reservationRepo.save(reservation);
    }

    public List<Reservation> buscarTodoReservation() {
        return (List<Reservation>) reservationRepo.findAll();
    }

    public Reservation buscarpoidReservation(Long id) {
        return reservationRepo.findAllByIdReservation(id);
    }

    public void eliminaridReservation(Long id) {
        reservationRepo.deleteByIdReservation(id);
    }
}
