<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 10-Apr-19
  Time: 2:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Barlow" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Kanit:400,700" rel="stylesheet">
    <script>
        var doc = new jsPDF();
        var specialElementHandlers = {
            '#editor': function (element, renderer) {
                return true;
            }
        };

        $('#cmd').click(function () {
            doc.fromHTML($('#content1').html(), 15, 15, {
                'width': 170,
                'elementHandlers': specialElementHandlers
            });
            doc.save('sample-file.pdf');
        });
    </script>
</head>
<style>
    #content {
        text-align: center;
        display: block;
        width: 100%;
        background: #fff;
        padding: 15px 15px;
        padding-bottom: 15px;
        -webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 2px 0px;
        -moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 2px 0px;
        box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 2px 0px;
    }

    dt, dd {
        margin: auto;
        width: 50%;
        padding: 5px;
        margin-left: 50px;
    }

    #Box {
        margin: auto;
        width: 50%;
        padding: 10px;
    }
    .panel-default {
        border-color: none;
    }
    footer {
        text-align: center;
    }
    hr {
        display: block;
        height: 1px;
        border: 0;
        border-top: 1px solid #0a0329;
        margin: 1em 0;
        padding: 0;
    }
</style>
<body style="background-color: #EBF6F7">
<div  style="margin-top:120px;"class="col-md-6 col-md-offset-3">
    <div class="panel-group">
        <div class="panel panel-default">
            <div class="panel-body">

                <div class="col-md-12" >
                    <div class="col-md-10 col-md-offset-1" >
                    <h1 style="font-family: 'Roboto', sans-serif;">Transaction Details</h1>

                    <h4 style="font-family: 'Roboto', sans-serif;"> <span class="glyphicon glyphicon-list-alt"></span> <b>Transfer  Details</b></h4>


            </div>
                <div id="content1" style="background-color: #F1F1F1" class="col-md-10  col-md-offset-1" >

                    <div class="row" >

                        <table class="table">


                            <tr>
                                <td><b>Wallet Id:</b></td>

                                <td style="text-align: right">WL000034 </td>
                            </tr>
                            <tr>
                                <td >Transction ID:</td>
                                <td style="text-align: right;font-family: 'Kanit', sans-serif; font-size: 20px">CD000811</td>
                            </tr>
                            <tr>
                                <td>Narration</td>
                                <td style="text-align: right">Send Money</td>
                            </tr>
                            <tr>
                                <td>Amount</td>

                                <td style="text-align: right">Tk 10000</td>
                            </tr>
                            <tr>
                                <td>Charge/Fee</td>

                                <td style="text-align: right">Tk 5</td>
                            </tr>
                            <tr>
                                <td>Net Amount</td>
                                <td style="text-align: right">Tk 5</td>
                            </tr>
                        </table>
                        <div id="editor"></div>
                    </div>
                    <button id="cmd">generate PDF</button>
                    <script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>
                </div>
                </div>

        </div>
    </div>
</div>
</body>
</html>

