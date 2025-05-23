/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author Mauro
 */
public class Config {
    public static final String DATABASE_FILE = "Livros.db";
    public static final String TABLE_PREFIX = "Tab";

    public static String getTableName(Class<?> clazz) {
        return TABLE_PREFIX + clazz.getSimpleName();
    }
}

