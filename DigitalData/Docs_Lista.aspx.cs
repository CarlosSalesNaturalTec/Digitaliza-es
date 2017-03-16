using System;
using System.Globalization;
using System.Text;

public partial class Docs_Lista : System.Web.UI.Page
{
    StringBuilder str = new StringBuilder();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CalculaTotais();

            montaCabecalho();
            dadosCorpo();
            montaRodape();

            Literal1.Text = str.ToString();
        }
    }

    private void CalculaTotais()
    {
        Literal_Saldo.Text = "XXX";
    }

    private void montaCabecalho()
    {
        string stringcomaspas = "<table id=\"tabela\" class=\"table table-striped table-hover \">" +
            "<thead>" +
            "<tr>" +
            "<th>SETOR</th>" +
            "<th>TIPO</th>" +
            "<th>CLIENTE</th>" +
            "<th>PROC.ADM.</th>" +
            "<th>PREGÃO</th>" +
            "<th>CONTRATO</th>" +
            "<th>PROC.PAGAM.</th>" +
            "<th>PÁGINAS</th>" +
            "<th>EXT.ORIGINAL</th>" +
            "<th>RESP.DOC.</th>" +
            "</tr>" +
            "</thead>" +
            "<tbody>";
        str.Clear();
        str.Append(stringcomaspas);
    }

    private void dadosCorpo()
    {
        string datastatus = DateTime.Now.ToString("yyyy-MM-dd");
        string stringselect = "select Setor, TipoDoc,Cliente ,ProcessoADM,Pregao ,Contrato,ProcessoPAG ,QuantPag ,Extensao,Responsavel  " +
                " from Tbl_Docs " +
                " order by Setor,TipoDoc";

        OperacaoBanco operacao = new OperacaoBanco();
        System.Data.SqlClient.SqlDataReader dados = operacao.Select(stringselect);

        while (dados.Read())
        {

            string Coluna1 = Convert.ToString(dados[0]);  
            string Coluna2 = Convert.ToString(dados[1]);
            string Coluna3 = Convert.ToString(dados[2]);
            string Coluna4 = Convert.ToString(dados[3]);
            string Coluna5 = Convert.ToString(dados[4]);
            string Coluna6 = Convert.ToString(dados[5]);
            string Coluna7 = Convert.ToString(dados[6]);
            string Coluna8 = Convert.ToString(dados[7]);
            string Coluna9 = Convert.ToString(dados[8]);
            string Coluna10 = Convert.ToString(dados[9]);


            string stringcomaspas = "<tr>" +
                "<td>" + Coluna1 + "</td>" +
                "<td>" + Coluna2 + "</td>" +
                "<td>" + Coluna3 + "</td>" +
                "<td>" + Coluna4 + "</td>" +
                "<td>" + Coluna5 + "</td>" +
                "<td>" + Coluna6 + "</td>" +
                "<td>" + Coluna7 + "</td>" +
                "<td>" + Coluna8 + "</td>" +
                "<td>" + Coluna9 + "</td>" +
                "<td>" + Coluna10 + "</td>" +
                "</tr>";

            str.Append(stringcomaspas);
        }
        ConexaoBancoSQL.fecharConexao();
        
    }

    private void montaRodape()
    {
        string footer = "</tbody></table>";
        str.Append(footer);
    }
}