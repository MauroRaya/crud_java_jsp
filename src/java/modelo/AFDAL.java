/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.*;
import java.io.*;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
/**
/**
 *
 * @author asenj
 */
public class AFDAL {
    private static Connection con;

    public static void conecta(String _bd) {
        Erro.setErro(false);
        try {
            Class.forName("org.sqlite.JDBC");
            con = DriverManager.getConnection("jdbc:sqlite:" + _bd);
        } catch (Exception e) {
            Erro.setErro(e.getMessage());
        }
    }

    public static void desconecta() {
        Erro.setErro(false);
        try {
            con.close();
        } catch (Exception e) {
            Erro.setErro(e.getMessage());
        }
    }

    public static void executeSQL(String _sql) {
        Erro.setErro(false);
        try {
            Statement st = con.createStatement();
            st.executeUpdate(_sql);
            st.close();
        } catch (Exception e) {
            Erro.setErro(e.getMessage());
        }
    }

    public static void executeSelect(String _sql, Object obj) {
        ResultSet rs;
        Erro.setErro(false);
        try {
            PreparedStatement st = con.prepareStatement(_sql);
            rs = st.executeQuery();
            if (rs.next()) {
                Field[] f = obj.getClass().getDeclaredFields();
                Method mtd;
                String aux;
                for (int i = 0; i < f.length; ++i) {
                    aux = "set" + f[i].getName().substring(0, 1).toUpperCase() + f[i].getName().substring(1);
                    try {
                        mtd = obj.getClass().getMethod(aux, new Class[]{f[i].getType()});
                        mtd.invoke(obj, new Object[]{rs.getString(f[i].getName())});
                    } catch (Exception e) {}
                }
            } else {
                Erro.setErro(obj.getClass().getSimpleName() + " não localizado.");
                return;
            }
            st.close();
        } catch (Exception e) {
            Erro.setErro(e.getMessage());
        }
    }
}