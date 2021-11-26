/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/springframework/RestController.java to edit this template
 */
package co.gov.mintic.g43.reto3MinticG43.controladores;

import co.gov.mintic.g43.reto3MinticG43.entidades.Reservation;
import co.gov.mintic.g43.reto3MinticG43.servicios.ReservationServicio;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Lineth
 */
@RestController
@RequestMapping("/api")
public class ControladorReservation {
    @Autowired
    ReservationServicio reservationServicio;
            
    @GetMapping("/Reservation/all")
    public List<Reservation> buscartodo() {
        return reservationServicio.buscarTodoReservation();
    }
    
    @GetMapping("/Reservation/{id}")
    public Reservation get(@PathVariable("id") Long id) {
        return reservationServicio.buscarpoidReservation(id);
    }
    
    @PostMapping("/Reservation/save")
    public ResponseEntity post(@RequestBody Reservation reservation) {
        reservationServicio.guardarReservation(reservation);
        return ResponseEntity.status(201).build();
    }
    
    @PutMapping("/Reservation/update")
    public ResponseEntity put(@RequestBody Reservation reservation) {
        reservationServicio.guardarReservation(reservation);
        return ResponseEntity.status(201).build();
    }
    
    
    @DeleteMapping("/Reservation/{id}")
    public ResponseEntity delete(@PathVariable("id") Long id) {
        reservationServicio.eliminaridReservation(id);
        return ResponseEntity.status(204).build();
    }
}
