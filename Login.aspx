<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <link href="~/css/custom.css" rel="stylesheet" type="text/css" />
    <link type="text/css" rel="stylesheet" href="~/css/materialize.min.css" media="screen,projection" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>AFET YÖNETİM SİSTEMİ - OTURUM AÇ</title>
</head>

<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SQLDS_Login" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT [id], [tc_kimlik], [adi_soyadi] FROM [VHKI_PERSONELI] WHERE (([tc_kimlik] = @tc_kimlik) AND ([sifre] = @sifre))">
            <SelectParameters>
                <asp:ControlParameter ControlID="TxtTcKimlik" PropertyName="Text" Name="tc_kimlik" Type="Int64"></asp:ControlParameter>
                <asp:ControlParameter ControlID="TxtSifre" PropertyName="Text" Name="sifre" Type="String"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
        <div class="row">
            <div class="col s4 offset-s4">
                <div class="card-panel white">
                    <h4 class="center-align">Giriş</h4>
                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">fingerprint</i>
                            <asp:TextBox ClientIDMode="Static" ID="TxtTcKimlik" runat="server" CssClass="validate"></asp:TextBox>
                            <label for="TxtTcKimlik" class="active">TC Kimlik No</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">offline_pin</i>
                            <asp:TextBox ClientIDMode="Static" ID="TxtSifre" runat="server" TextMode="Password" CssClass="validate"></asp:TextBox>
                            <label for="TxtSifre" class="active">Şifre</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s12">
                            <p class="center-align">
                                <asp:Button CssClass="btn waves-effect waves-light" ID="BtnGirisYap" runat="server" Text="Giriş Yap" OnClick="BtnGirisYap_Click" />
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                        <asp:PlaceHolder ID="PlcBasarisiz" runat="server" Visible="false">
                            <div id="ekleme_basarisiz" class="modal">
                                <div class="modal-content red white-text">
                                    <h4>Hata</h4>
                                    <p>
                                        <asp:Label ID="PlcHataMesaji" runat="server" Text="Label"></asp:Label>
                                    </p>
                                </div>
                                <div class="modal-footer">
                                    <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Tamam</a>
                                </div>
                            </div>
                            <script type="text/javascript">
                                $('#ekleme_basarisiz').openModal();
                            </script>
                        </asp:PlaceHolder>

        <asp:ScriptManager ID="ScriptManager1" runat="server">

            <Scripts>
                <asp:ScriptReference Path="~/js/jquery-2.1.1.min.js" />
                <asp:ScriptReference Path="~/js/materialize.min.js" />
                <asp:ScriptReference Path="~/js/custom.js" />
            </Scripts>
        </asp:ScriptManager>
    </form>
</body>
</html>
