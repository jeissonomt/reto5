/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/springframework/RestController.java to edit this template
 */
package co.gov.mintic.g43.reto3MinticG43.controladores;

import co.gov.mintic.g43.reto3MinticG43.entidades.Client;
import co.gov.mintic.g43.reto3MinticG43.servicios.ClientServicio;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

/**
 *
 * @author Lineth
 */
@RestController
@RequestMapping("/api")
public class ControladorClient {
    
    @Autowired
    ClientServicio clientServicio;
    
    @GetMapping("/Client/all")
    public List<Client> buscartodo() {
        return clientServicio.buscarTodoClient();
    }
    
    @GetMapping("/Client/{id}")
    public Object get(@PathVariable("id") Long id) {
        return clientServicio.buscarpoidClient(id);
    }
    
    @PostMapping("/Client/save")
    public ResponseEntity post(@RequestBody Client client) {
        clientServicio.guardarClient(client);
        return ResponseEntity.status(201).build();
    }
    
    @PutMapping("/Client/update")
    public ResponseEntity put(@RequestBody Client client) {
        clientServicio.guardarClient(client);
        return ResponseEntity.status(201).build();
    }
    
    @DeleteMapping("/Client/{id}")
    public ResponseEntity<?> delete(@PathVariable("id") Long id) {
        clientServicio.eliminaridClient(id);
        return ResponseEntity.status(204).build();
    }
    
}
