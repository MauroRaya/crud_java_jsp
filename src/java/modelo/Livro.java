package modelo;

/**
 *
 * @author MauricioAsenjo
 */
public class Livro {
    private String codigo;
    private String titulo;
    private String autor;
    private String editora;
    private String ano;
    private String localizacao;

    public Livro() {}

    public void setCodigo(String _codigo) { codigo = _codigo; }
    public void setTitulo(String _titulo) { titulo = _titulo; }
    public void setAutor(String _autor) { autor = _autor; }
    public void setEditora(String _editora) { editora = _editora; }
    public void setAno(String _ano) { ano = _ano; }
    public void setLocalizacao(String _localizacao) { localizacao = _localizacao; }

    public String getCodigo() { return codigo; }
    public String getTitulo() { return titulo; }
    public String getAutor() { return autor; }
    public String getEditora() { return editora; }
    public String getAno() { return ano; }
    public String getLocalizacao() { return localizacao; }
}
