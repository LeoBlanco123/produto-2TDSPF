package br.com.fiap;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class Main {

    public static void main(String[] args) {

        String dia = LocalDate.now().getDayOfWeek().equals(DayOfWeek.MONDAY) ? "fiap" : "casa";

        EntityManagerFactory factory = Persistence.createEntityManagerFactory(dia);
        EntityManager manager = factory.createEntityManager();

        Sabor manjericao = new Sabor();
        manjericao.setNome("Manjericão");
        manjericao.setDescricao("Maravilhoso manjericão plantado e colhido pelos mais belos agricultores do Alegrete.");


        Sabor calabresa = Sabor.builder()
                .nome( "Calabresa" )
                .descricao( "A mais saborosa calabresa da praça" ).build();


        Sabor frangoComCatupiri = Sabor.builder()
                .nome( "Frango com Catupiri" )
                .descricao( "Aqui ninguém tem pena" )
                .build();


        Opcional bordaDeCatupiri = new Opcional(null, "Borda de Catupiri", 9.99);

        Opcional bordaPaozinho = new Opcional(null, "Borda paozinho", 19.99);

        Opcional cocaCola = new Opcional(null, "Coca Cola", 19.99);

        Set<Opcional> opcionals = Stream
                .of(cocaCola, bordaPaozinho, bordaDeCatupiri)
                .collect(Collectors.toSet());

        Produto pizzaDeManjericao = new Produto();
        pizzaDeManjericao.setNome("Pizza");
        pizzaDeManjericao.setPreco(69.99);
        pizzaDeManjericao.setSabor(manjericao);
        pizzaDeManjericao.setOpcionais(opcionals);


        Produto pizzaDeCalabresa = Produto.builder()
                .nome( "Pizza de Calabresa" )
                .sabor( calabresa )
                .preco( 49.99 )
                .opcionais( opcionals )
                .build();

        Produto pizzaDeFrangoComCatupiri = Produto.builder()
                .sabor( frangoComCatupiri )
                .nome( "Pizza de Frango com Catupiri" )
                .preco( 69.99 )
                .opcionais( opcionals )
                .build();


        Set<Produto> cardapio = Stream.of( pizzaDeManjericao,pizzaDeCalabresa,pizzaDeFrangoComCatupiri )
                .collect( Collectors.toSet());

        Pizzaria pizzaria = new Pizzaria();
        pizzaria.setNome( "Benezinho's pizzaria" );
        pizzaria.setCardapio( cardapio );


        Pizzaria damaEDomino = Pizzaria.builder().nome( "Dama e Dominó" )
                .cardapio( cardapio )
                .build();


        manager.getTransaction().begin();

        manager.persist( pizzaria );
        manager.persist( damaEDomino );
        manager.getTransaction().commit();

        factory.close();
        manager.close();

    }
}