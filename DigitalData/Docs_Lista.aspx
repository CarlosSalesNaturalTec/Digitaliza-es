<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Docs_Lista.aspx.cs" Inherits="Docs_Lista" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="~/vendors/bootstrap/dist/css/bootstrap.min.css">
    
    <script src="~/vendors/jquery/dist/jquery.min.js"></script>
    <script src="~/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
   

</head>

<body>

    <h3>Cadastro de Documentos</h3>

    <div class="row">
        <div class="col-md-3">
            <div class="well">
                <h4>
                    <p>Quant. Total</p>
                </h4>
                <h3 class="text-primary"><b><i class="fa fa-files-o"></i>
                <asp:Literal ID="Literal_Quant" runat="server"></asp:Literal></b></h3>
                <a href="Docs_Ficha.aspx?p1=new" class="btn btn-block btn-success">NOVO DOCUMENTO</a>
                <p></p>
            </div>
        </div>

        <div class="col-md-3">
            <div class="well">
                <h4>
                    <p>Relatórios</p>
                </h4>
                <h3 class="text-primary"><i class="fa fa-bar-chart"></i></h3>
                <a href="PainelPrincipal.aspx" class="btn btn-block btn-success"> RELATÓRIOS</a>
                <p></p>
            </div>
        </div>
        
    </div>

</body>
</html>