package modelo;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.*;

/**
 *
 * @author Mauro
 */

public class DAL {

    private static Connection conn;

    static {
        try {
            Class.forName("org.sqlite.JDBC");
            conn = DriverManager.getConnection("jdbc:sqlite:biblioteca.db");

            String sqlCreate = "CREATE TABLE IF NOT EXISTS Livro (" +
                   "id INTEGER PRIMARY KEY, " +
                   "titulo TEXT NOT NULL, " +
                   "autor TEXT NOT NULL, " +
                   "editora TEXT NOT NULL, " +
                   "ano INTEGER NOT NULL" +
                   ");";

            try (Statement stmt = conn.createStatement()) {
                stmt.execute(sqlCreate);
                System.out.println("Tabela criada ou já existente.");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void get() {
        String sql = "SELECT * FROM Livro WHERE id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, Integer.parseInt(Livro.getId()));
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Livro.setId(String.valueOf(rs.getInt("id")));
                    Livro.setTitulo(rs.getString("titulo"));
                    Livro.setAutor(rs.getString("autor"));
                    Livro.setEditora(rs.getString("editora"));
                    Livro.setAno(String.valueOf(rs.getInt("ano")));
                } else {
                    Livro.setTitulo(null);
                    Livro.setAutor(null);
                    Livro.setEditora(null);
                    Livro.setAno(null);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void add() {
        String sql = "INSERT INTO Livro (id, titulo, autor, editora, ano) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, Integer.parseInt(Livro.getId()));
            pstmt.setString(2, Livro.getTitulo());
            pstmt.setString(3, Livro.getAutor());
            pstmt.setString(4, Livro.getEditora());
            pstmt.setInt(5, Integer.parseInt(Livro.getAno()));
            pstmt.executeUpdate();

            System.out.println("Livro adicionado com sucesso.");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static int update() {
        String sql = "UPDATE Livro SET titulo = ?, autor = ?, editora = ?, ano = ? WHERE id = ?";
        int rowsAffected = 0;

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, Livro.getTitulo());
            pstmt.setString(2, Livro.getAutor());
            pstmt.setString(3, Livro.getEditora());
            pstmt.setInt(4, Integer.parseInt(Livro.getAno()));
            pstmt.setInt(5, Integer.parseInt(Livro.getId()));
            
            rowsAffected = pstmt.executeUpdate();

            System.out.println("Livro atualizado com sucesso.");

        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return rowsAffected;
    }

    public static int delete() {
        String sql = "DELETE FROM Livro WHERE id = ?";
        int rowsAffected = 0;

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, Integer.parseInt(Livro.getId()));
            rowsAffected = pstmt.executeUpdate();

            System.out.println("Livro deletado com sucesso.");

        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return rowsAffected;
    }

    public static void close() {
        try {
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

