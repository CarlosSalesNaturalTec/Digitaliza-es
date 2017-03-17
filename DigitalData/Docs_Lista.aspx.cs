using System;

public partial class Docs_Lista : System.Web.UI.Page
{
    int TotalDeRegistros = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            RegistrosQuant();
        }
    }

    private void RegistrosQuant()
    {
        string datastatus = DateTime.Now.ToString("yyyy-MM-dd");
        string stringselect = "select ID_Doc from Tbl_Docs ";

        OperacaoBanco operacao = new OperacaoBanco();
        System.Data.SqlClient.SqlDataReader dados = operacao.Select(stringselect);

        while (dados.Read())
        {
            TotalDeRegistros++;
        }
        ConexaoBancoSQL.fecharConexao();
        
        Literal_Quant.Text = TotalDeRegistros.ToString();
        
    }
}