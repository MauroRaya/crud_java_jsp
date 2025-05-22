package modelo;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Mauro
 */
public class Livro {
    private static String id;
    private static String titulo;
    private static String autor;
    private static String editora;
    private static String ano;

    public static String getId() {
        return id;
    }

    public static void setId(String id) {
        Livro.id = id;
    }

    public static String getTitulo() {
        return titulo;
    }

    public static void setTitulo(String titulo) {
        Livro.titulo = titulo;
    }

    public static String getAutor() {
        return autor;
    }

    public static void setAutor(String autor) {
        Livro.autor = autor;
    }

    public static String getEditora() {
        return editora;
    }

    public static void setEditora(String editora) {
        Livro.editora = editora;
    }

    public static String getAno() {
        return ano;
    }

    public static void setAno(String ano) {
        Livro.ano = ano;
    }
}
