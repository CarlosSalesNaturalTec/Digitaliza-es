﻿using System;
using System.Web.Services;
using System.Data.SqlClient;

/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://digitaldata.azurewebsites.net/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{

    public WebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string Identificador(string user, string pwd)
    {

        string url = "#signup";

        // localiza usuario
        string stringSelect = "select senha,nome from Tbl_Usuarios where usuario = '" + user + "'";
        OperacaoBanco operacao = new OperacaoBanco();
        System.Data.SqlClient.SqlDataReader rcrdset = operacao.Select(stringSelect);
        while (rcrdset.Read())
        {
            if (pwd == Convert.ToString(rcrdset[0]))
            {

                string vValida1, vValida2;
                vValida1 = DateTime.Now.ToString("dd");
                vValida2 = DateTime.Now.ToString("MM");
                int vValida3 = Convert.ToInt16(vValida1) * Convert.ToInt16(vValida2);
                string vValida4 = vValida3.ToString();

                url = "Index.aspx?p1=" + vValida4 + "&p2=" + Convert.ToString(rcrdset[1]);
            }
            else
            {
                url = "#signup";
            }
        }
        ConexaoBancoSQL.fecharConexao();

        return url;

    }

    [WebMethod]
    public string SetorNovo(string param1)
    {
        string url = "";
        OperacaoBanco operacao = new OperacaoBanco();
        bool inserir = operacao.Insert(@"INSERT INTO Tbl_Setores (descricao) " +
            "VALUES ('" + param1 + "')");
        ConexaoBancoSQL.fecharConexao();
        if (inserir == true)
        {
            url = "Setores_Lista.aspx";
        }
        else
        {
            url = "Sorry.aspx";
        }

        return url;
    }

    [WebMethod]
    public string DocSalvar(string param1, string param2, string param3, string param4, string param5, string param6, string param7, string param8, string param9, string param10,
            string param11, string param12, string param13)
    {
        string stringinsert = "insert into Tbl_Docs  (Setor ,TipoDoc ,Cliente ,ProcessoADM ,Pregao ,Contrato ,ProcessoPAG, " +
            "Responsavel, QuantPag , TeorDoc, Extensao, Observacoes , FotoDataURI " +
            ") values " +
            "('" + param1 + "', '" + param2 + "','" + param3 + "','" + param4 + "','" + param5 + "','" + param6 + "','" + param7 + 
            "','" + param8 + "'," + param9 + ",'" + param10 +
            "','" + param11 + "', '" + param12 + "','" + param13 +
            "')";
        string url = "Sorry.aspx";

        OperacaoBanco operacao = new OperacaoBanco();
        bool inserir = operacao.Insert(stringinsert);
        ConexaoBancoSQL.fecharConexao();

        if (inserir == true)
        {
            url = "Docs_Lista.aspx";
        }
        else
        {
            url = "Sorry.aspx";
        }

        return url;
    }
}

public class ConexaoBancoSQL
{
    private static SqlConnection objConexao = null;
    private string stringconnection1;

    public void tentarAbrirConexaoRemota()
    {
        objConexao = new SqlConnection();
        objConexao.ConnectionString = stringconnection1;
        objConexao.Open();
    }

    public ConexaoBancoSQL()
    {
        // *** STRING DE CONEXÃO COM BANCO DE DADOS - Atenção! Alterar dados conforme seu servidor
        stringconnection1 = "Server=tcp:serverdigitaldata.database.windows.net,1433;Initial Catalog=dbDigitalData;Persist Security Info=False;User ID=admdeveloper;Password=pwd@1973;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;";
        try
        {
            tentarAbrirConexaoRemota();
        }
        catch
        {
            Console.WriteLine("Atenção! Não foi possível Conectar ao Servidor de Banco de Dados.");
        }
    }

    public static SqlConnection getConexao()
    {
        new ConexaoBancoSQL();
        return objConexao;
    }
    public static void fecharConexao()
    {
        objConexao.Close();
    }
}

public class OperacaoBanco
{
    private SqlCommand TemplateMethod(String query)
    {
        SqlConnection Conexao = ConexaoBancoSQL.getConexao();
        SqlCommand Commando = new SqlCommand(query, Conexao);
        try
        {
            Commando.ExecuteNonQuery();
            return Commando;
        }
        catch
        {
            return Commando;
        }
    }

    public SqlDataReader Select(String query)
    {
        SqlDataReader dadosObtidos = TemplateMethod(query).ExecuteReader();
        return dadosObtidos;
    }

    public Boolean Insert(String query)
    {
        SqlConnection Conexao = ConexaoBancoSQL.getConexao();
        SqlCommand Commando = new SqlCommand(query, Conexao);
        try
        {
            Commando.ExecuteNonQuery();
            return true;
        }
        catch
        {
            return false;
        }
    }

    public Boolean Update(String query)
    {
        SqlConnection Conexao = ConexaoBancoSQL.getConexao();
        SqlCommand Commando = new SqlCommand(query, Conexao);
        try
        {
            Commando.ExecuteNonQuery();
            return true;
        }
        catch
        {
            return false;
        }
    }

    public Boolean Delete(String query)
    {
        SqlConnection Conexao = ConexaoBancoSQL.getConexao();
        SqlCommand Commando = new SqlCommand(query, Conexao);
        try
        {
            Commando.ExecuteNonQuery();
            return true;
        }
        catch
        {
            return false;
        }
    }

}