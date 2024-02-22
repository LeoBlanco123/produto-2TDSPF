package br.com.fiap;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

import java.time.DayOfWeek;
import java.time.LocalDate;

public class Main {

    public static void main(String[] args) {

        String dia = LocalDate.now().getDayOfWeek().equals( DayOfWeek.THURSDAY ) ? "casa" : "fiap";
        EntityManagerFactory factory = Persistence.createEntityManagerFactory( dia );
        EntityManager manager = factory.createEntityManager();

        Sabor manjericao = new Sabor();
        manjericao.setNome( "Manjericão" );
        manjericao.setDescricao( "Maravilhoso manjericão plantado e colhido pelos mais belos agricultores do Alegrete." );


        Produto produto = new Produto();
        produto.setNome( "Pizza" ).setPreco( 69.99 );
        produto.setSabor( manjericao );

        manager.getTransaction().begin();
        manager.persist( manjericao );
        manager.persist( produto );
        manager.getTransaction().commit();

        factory.close();
        manager.close();
    }
}