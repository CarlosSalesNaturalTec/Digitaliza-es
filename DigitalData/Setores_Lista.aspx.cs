using System;
using System.Globalization;
using System.Text;

public partial class Setores_Lista : System.Web.UI.Page
{
    StringBuilder str = new StringBuilder();
    int TotalDeRegistros = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            montaCabecalho();
            dadosCorpo();
            montaRodape();
            Literal1.Text = str.ToString();
        }
    }

    private void montaCabecalho()
    {
        string stringcomaspas = "<table id=\"tabela\" class=\"table table-striped table-hover \">" +
            "<thead>" +
            "<tr>" +
            "<th>ID</th>" +
            "<th>SETOR</th>" +
            "</tr>" +
            "</thead>" +
            "<tbody>";
        str.Clear();
        str.Append(stringcomaspas);
    }

    private void dadosCorpo()
    {
        string datastatus = DateTime.Now.ToString("yyyy-MM-dd");
        string stringselect = "select ID_Setor, descricao " +
                " from Tbl_Setores " +
                " order by descricao";

        OperacaoBanco operacao = new OperacaoBanco();
        System.Data.SqlClient.SqlDataReader dados = operacao.Select(stringselect);

        while (dados.Read())
        {

            string Coluna1 = Convert.ToString(dados[0]);  
            string Coluna2 = Convert.ToString(dados[1]);  
            

            string stringcomaspas = "<tr>" +
                "<td>" + Coluna1 + "</td>" +
                "<td>" + Coluna2 + "</td>" +
                "</tr>";

            str.Append(stringcomaspas);
            TotalDeRegistros++;
        }
        ConexaoBancoSQL.fecharConexao();
        Literal_Quant.Text = TotalDeRegistros.ToString();
    }

    private void montaRodape()
    {
        string footer = "</tbody></table>";
        str.Append(footer);
    }
}