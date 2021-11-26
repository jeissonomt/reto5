/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/springframework/Service.java to edit this template
 */
package co.gov.mintic.g43.reto3MinticG43.servicios;

import co.gov.mintic.g43.reto3MinticG43.crud.LibraryRepositorio;
import co.gov.mintic.g43.reto3MinticG43.entidades.Library;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Lineth
 */
@Service
public class LibraryServicio {
    @Autowired
    LibraryRepositorio libraryRepo;
    
    public void guardarLibrary(Library library){
        libraryRepo.save(library);
    }
    
    public List<Library> buscarTodoLibrary(){
        return (List<Library>)libraryRepo.findAll();
    }
    
    public Library buscarpoidLibrary(Long id){
        return libraryRepo.findAllById(id);
    }
    
    public void eliminaridLibrary(Long id){
        libraryRepo.deleteById(id);
    }
    
    
}
