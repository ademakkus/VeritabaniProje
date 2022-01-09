<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PersonelEkle.aspx.cs" Inherits="AfetOncesi_PersonelEkle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:SqlDataSource ID="SQLDS_Personel" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' InsertCommand="INSERT INTO [AFAD_PERSONELI] ([tc_kimlik], [telefon], [email], [kan_grubu], [adi_soyadi], [personel_turu], [ekleyen]) VALUES (@tc_kimlik, @telefon, @email, @kan_grubu, @adi_soyadi, @personel_turu, @ekleyen)">
        <InsertParameters>
            <asp:ControlParameter ControlID="TxtTcKimlik" Name="tc_kimlik" PropertyName="Text" Type="Int64" />
            <asp:ControlParameter ControlID="TxtTelefon" Name="telefon" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TxtEmail" Name="email" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="DdlKanGrubu" Name="kan_grubu" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="TxtAdiSoyadi" Name="adi_soyadi" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="DdlPersonelTuru" Name="personel_turu" PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="ekleyen" Type="Int32"></asp:Parameter>
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLDS_PersonelTurleri" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT * FROM [Personel_Turleri] ORDER BY personel_turu"></asp:SqlDataSource>
    <div class="col s9 m9 l9">
        <div class="card white">
            <div class="card-content">
                <span class="card-title">Yeni Personel Ekle</span>
                <div class="row">
                    <div class="input-field col s4">
                        <i class="material-icons prefix">account_box</i>
                        <asp:TextBox ID="TxtTcKimlik" ClientIDMode="Static" runat="server" CssClass="validate"></asp:TextBox>
                        <label for="TxtTcKimlik">TC Kimlik Numarası</label>
                    </div>
                    <div class="input-field col s8">
                        <asp:TextBox ID="TxtAdiSoyadi" ClientIDMode="Static" runat="server" CssClass="validate"></asp:TextBox>
                        <label for="TxtAdiSoyadi">Adı Soyadı</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s4">
                        <i class="material-icons prefix">phone</i>
                        <asp:TextBox ID="TxtTelefon" ClientIDMode="Static" runat="server" CssClass="validate"></asp:TextBox>
                        <label for="TxtTelefon">Telefon Numarası</label>
                    </div>
                    <div class="input-field col s8">
                        <i class="material-icons prefix">email</i>
                        <asp:TextBox ID="TxtEmail" TextMode="Email" ClientIDMode="Static" runat="server" CssClass="validate"></asp:TextBox>
                        <label for="TxtEmail" data-error="Lütfen geçerli bir e-posta adresi giriniz.">E-posta Adresi</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s4">
                        <asp:DropDownList ID="DdlKanGrubu" runat="server" ClientIDMode="Static">
                            <asp:ListItem Value="0 Rh (-)">0 Rh (-)</asp:ListItem>
                            <asp:ListItem Value="0 Rh (+)">0 Rh (+)</asp:ListItem>
                            <asp:ListItem Value="A Rh (-)">A Rh (-)</asp:ListItem>
                            <asp:ListItem Value="A Rh (+)">A Rh (+)</asp:ListItem>
                            <asp:ListItem Value="B Rh (-)">B Rh (-)</asp:ListItem>
                            <asp:ListItem Value="B Rh (+)">B Rh (+)</asp:ListItem>
                            <asp:ListItem Value="AB Rh (-)">AB Rh (-)</asp:ListItem>
                            <asp:ListItem Value="AB Rh (+)">AB Rh (+)</asp:ListItem>
                        </asp:DropDownList>
                        <label>Kan Grubu</label>
                    </div>
                    <div class="input-field col s8">
                            <asp:DropDownList ClientIDMode="Static" ID="DdlPersonelTuru" runat="server" DataSourceID="SQLDS_PersonelTurleri" DataTextField="personel_turu" DataValueField="id"></asp:DropDownList>
                        <label>Personel Türü</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12 right-align">
                        <asp:LinkButton ID="BtnKaydet" runat="server" CssClass="waves-effect waves-light btn" OnClick="BtnKaydet_Click"><i class="material-icons left">done</i>Kaydet</asp:LinkButton>
                        <asp:HyperLink ID="BtnIptal" runat="server" CssClass="waves-effect red waves-light btn" NavigateUrl="~/AfetOncesi/PersonelYonetimi.aspx"><i class="material-icons left">not_interested</i>İptal</asp:HyperLink>
                    </div>
                </div>
                

        <asp:Placeholder ID="PlcBasarili" runat="server" Visible="false">
        <div id="ekleme_basarili" class="modal">
    <div class="modal-content">
      <h4>Başarılı</h4>
      <p>Kayıt başarıyla eklendi</p>
    </div>
    <div class="modal-footer">
      <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Tamam</a>
    </div>
            <script type="text/javascript">
                $('#ekleme_basarili').openModal();
            </script>
  </div>
        </asp:Placeholder>
        <asp:Placeholder ID="PlcBasarisiz" runat="server" Visible="false">
 <div id="ekleme_basarisiz" class="modal">
    <div class="modal-content red white-text">
      <h4>Hata</h4>
      <p>
          <asp:Label ID="PlcHataMesaji" runat="server" Text="Label"></asp:Label></p>
    </div>
    <div class="modal-footer">
      <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Tamam</a>
    </div>
  </div>
            <script type="text/javascript">
                $('#ekleme_basarisiz').openModal();
            </script>
</asp:Placeholder>
            </div>
        </div>
    </div>
</asp:Content>

