<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Setores_Lista.aspx.cs" Inherits="Setores_Lista" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="~/vendors/bootstrap/dist/css/bootstrap.min.css">
    <script src="~/vendors/jquery/dist/jquery.min.js"></script>
    <script src="~/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">

</head>

<body>

    <h3>Cadastro de Setores</h3>

    <div class="row">
        <div class="col-md-3">
            <div class="well">
                <h4>
                    <p>Quant. Total</p>
                </h4>
                <h3 class="text-primary"><b>
                <asp:Literal ID="Literal_Saldo" runat="server"></asp:Literal></b></h3>
                <a href="Setores_Novo.aspx" class="btn btn-primary">NOVO SETOR</a>
                <p></p>
            </div>
        </div>

        <div class="col-md-3">
            <div class="well">
                <h4>
                    <p>Relatórios</p>
                </h4>
                <h3 class="text-primary"><i class="fa fa-bar-chart"></i></h3>
                <a href="PainelPrincipal.aspx" class="btn btn-success">RELATÓRIOS</a>
                <p></p>
            </div>
        </div>
        
    </div>
    <br />

    <!-- Planilha  -->
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
    <!-- Planilha  -->

    <!-- Busca e Paginação modelo: datatables.net -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    <link rel="stylesheet" href="//cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css">
    <script src="//cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.10/css/dataTables.bootstrap.min.css">

    <script>
        $(document).ready(function () {
            $('#tabela').DataTable({
                "language": {
                    "lengthMenu": "Mostrando _MENU_ registros por página",
                    "zeroRecords": "Nada encontrado",
                    "info": " _MAX_ registros no total",
                    "infoEmpty": "Nenhum registro disponível",
                    "infoFiltered": "(filtrado de _MAX_ registros no total)",
                    "search": "Pesquisa:"
                }
            });
        });
    </script>

</body>
</html>