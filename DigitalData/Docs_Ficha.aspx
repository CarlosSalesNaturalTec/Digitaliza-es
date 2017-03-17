<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Docs_Ficha.aspx.cs" Inherits="Docs_Ficha" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Cadastro de Documento</title>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="~/vendors/bootstrap/dist/css/bootstrap.min.css">

    <script type="text/javascript" src="~/Scripts/jquery-3.1.1.min.js"></script>

    <style type="text/css">
        #results {
            float: right;
            margin: 5px;
            padding: 5px;
            border: 1px solid;
            background: #ccc;
        }
    </style>


</head>
<body>

    <form class="form-horizontal">
        <fieldset>
            <legend>Novo Documento</legend>

            <div class="form-group">
                <label for="inputData" class="col-md-2 control-label">Data</label>
                <div class="col-md-3">
                    <input type="text" class="form-control" id="inputData" readonly>
                </div>
            </div>

            <div class="form-group">
                <label for="inputSetor" class="col-md-2 control-label">Setor</label>
                <div class="col-md-5">
                    <input type="text" class="form-control" id="inputSetor">
                </div>
            </div>

            <div class="form-group">
                <label for="inputTipoDoc" class="col-md-2 control-label">Tipo Documento</label>
                <div class="col-md-5">
                    <input type="text" class="form-control" id="inputTipoDoc">
                </div>
            </div>

            <div class="form-group">
                <label for="inputCliente" class="col-md-2 control-label">Cliente</label>
                <div class="col-md-7">
                    <input type="text" class="form-control" id="inputCliente">
                </div>
            </div>

            <div class="form-group">
                <label for="inputProcAdm" class="col-md-2 control-label">N° Proc. Administrativo</label>
                <div class="col-md-3">
                    <input type="text" class="form-control" id="inputProcAdm">
                </div>
                <label for="inputPregao" class="col-md-2 control-label">N° Pregão</label>
                <div class="col-md-3">
                    <input type="text" class="form-control" id="inputPregao">
                </div>
            </div>

            <div class="form-group">
                <label for="inputContrato" class="col-md-2 control-label">N° Contrato</label>
                <div class="col-md-3">
                    <input type="text" class="form-control" id="inputContrato">
                </div>

                <label for="inputProcPag" class="col-md-2 control-label">N° Proc. Pagamento</label>
                <div class="col-md-3">
                    <input type="text" class="form-control" id="inputProcPag">
                </div>
            </div>

            <div class="form-group">
                <label for="inputResp" class="col-md-2 control-label">Responsável pelo Documento</label>
                <div class="col-md-5">
                    <input type="text" class="form-control" id="inputResp">
                </div>
                <label for="inputPag" class="col-md-1 control-label">N° Págs.</label>
                <div class="col-md-1">
                    <input type="text" class="form-control" id="inputPag">
                </div>
            </div>

            <div class="form-group">
                <label for="inputExt" class="col-md-2 control-label">Extensão Doc. Original</label>
                <div class="col-md-5">
                    <textarea class="form-control" rows="3" id="inputExt"></textarea>
                </div>
            </div>

            <div class="form-group">
                <label for="inputTeor" class="col-md-2 control-label">Teor do Documento</label>
                <div class="col-md-5">
                    <textarea class="form-control" rows="3" id="inputTeor"></textarea>
                </div>
            </div>

            <div class="form-group">
                <label for="inputObs" class="col-md-2 control-label">Observações</label>
                <div class="col-md-5">
                    <textarea class="form-control" rows="3" id="inputObs"></textarea>
                </div>
            </div>
            <br />

            <legend>Digitalização</legend>

            <!-- digitalização -->
            <br />
            <div id="results"></div>
            <div id="my_camera"></div>
            <br />
            <div class="row">
                <div class="col-md-1">
                </div>
                <div class="col-md-4">
                    <label for="filePicker">Carregar Documento:</label><br>
                    <input type="file" id="filePicker">
                </div>
            </div>
            <input id="Hidden1" name="fotouri" type="hidden" />
            <!-- digitalização -->             

            <legend></legend>

            <div class="form-group">
                <div class="col-md-5 col-md-offset-2">
                    <button type="reset" class="btn btn-block btn-primary" onclick="cancelar()"><i class="fa fa-undo"></i> CANCELAR</button>
                    <button type="button" class="btn btn-block btn-success" onclick="Salvar()" id="btsalvar"><i class="fa fa-floppy-o"></i> SALVAR</button>
                </div>
            </div>

        </fieldset>
    </form>

    <!-- Operações com Registro  -->
    <script type="text/javascript">

        function Salvar() {
            alert('Gravar');
            var v1 = document.getElementById("inputSetor").value;
            var v2 = document.getElementById("inputTipoDoc").value;
            var v3 = document.getElementById("inputCliente").value;

            var v4 = document.getElementById("inputProcAdm").value;
            var v5 = document.getElementById("inputPregao").value;
            var v6 = document.getElementById("inputContrato").value;

            var v7 = document.getElementById("inputProcPag").value;
            var v8 = document.getElementById("inputResp").value;
            var v9 = document.getElementById("inputPag").value;

            var v10 = document.getElementById("inputTeor").value;
            var v11 = document.getElementById("inputExt").value;
            var v12 = document.getElementById("inputObs").value;

            var v13 = document.getElementById("Hidden1").value;

            var v14 = "Aleluia! Toda Gloria seja dada a Jesus Cristo."

            document.getElementById("btSalvar").disabled = true;
            $("body").css("cursor", "progress");

            $.ajax({
                type: "POST",
                url: "WebService.asmx/DocSalvar",
                data: '{param1: "' + v1 + '", param2: "' + v2 + '", param3: "' + v3 + '", param4: "' + v4 + '", param5: "' + v5 +
                    '", param6: "' + v6 + '", param7: "' + v7 + '", param8: "' + v8 + '", param9: "' + v9 + '", param10: "' + v10 +
                    '", param11: "' + v11 + '", param12: "' + v12 + '", param13: "' + v13 +
                    '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $("body").css("cursor", "default");                    
                    window.location.href = response.d;
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        }
        function cancelar() {
            var linkurl = "Docs_Lista.aspx";
            window.location.href = linkurl;
        }
    </script>
    <!-- Operações com Registro  -->


    <!-- Scripts Camera -->
    <script type="text/javascript"></script>
    <script language="JavaScript">
        var handleFileSelect = function (evt) {
            var files = evt.target.files;
            var file = files[0];
            if (files && file) {
                var reader = new FileReader();
                reader.onload = function (readerEvt) {
                    var binaryString = readerEvt.target.result;
                    var data_uri = "data:image/png;base64," + btoa(binaryString);
                    document.getElementById('results').innerHTML = '<img src="' + data_uri + '"/>';
                    document.getElementById("Hidden1").value = data_uri
                };
                reader.readAsBinaryString(file);
            }
        };
        if (window.File && window.FileReader && window.FileList && window.Blob) {
            document.getElementById('filePicker').addEventListener('change', handleFileSelect, false);
        } else {
            alert('The File APIs are not fully supported in this browser.');
        }
    </script>
    <!-- Scripts Camera -->


    <!-- Foco  -->
    <script type="text/javascript">
        document.getElementById("inputSetor").focus();
    </script>
    <!-- Foco  -->

</body>
</html>
