<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BagisEkle.aspx.cs" Inherits="BagisEkle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:SqlDataSource ID="SQLDS_Bagislar" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' InsertCommand="INSERT INTO [BAGISLAR] ([bagisi_yapan_tc_kimlik], [bagisi_yapan_adi_soyadi], [bagis_turu], [bagis_miktari], [telefon], [ekleyen]) VALUES (@bagisi_yapan_tc_kimlik, @bagisi_yapan_adi_soyadi, @bagis_turu, @bagis_miktari, @telefon, @ekleyen)">
        <InsertParameters>
            <asp:ControlParameter ControlID="TxtTcKimlik" Name="bagisi_yapan_tc_kimlik" PropertyName="Text" Type="Int64" />
            <asp:ControlParameter ControlID="TxtAdiSoyadi" Name="bagisi_yapan_adi_soyadi" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="DdlBagisTurleri" Name="bagis_turu" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="TxtBagisMiktari" Name="bagis_miktari" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="TxtTelefon" Name="telefon" PropertyName="Text" Type="String" />
            <asp:SessionParameter Name="ekleyen" SessionField="user_id" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLDS_BagisTurleri" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT * FROM [Bagis_Turleri]"></asp:SqlDataSource>
<div class="col s9 m9 l9">
        <div class="card white">
            <div class="card-content">
                <span class="card-title">Yeni Kurum Ekle</span>
                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">fingerprint</i>
                        <asp:TextBox ID="TxtTcKimlik" ClientIDMode="Static" runat="server" CssClass="validate"></asp:TextBox>
                        <label for="TxtTcKimlik">Bağışı Yapan TC Kimlik</label>
                    </div>
                    <div class="input-field col s6">
                        <i class="material-icons prefix">account_box</i>
                        <asp:TextBox ID="TxtAdiSoyadi" ClientIDMode="Static" runat="server" CssClass="validate"></asp:TextBox>
                        <label for="TxtAdiSoyadi">Adı Soyadı</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <asp:DropDownList ClientIDMode="Static" ID="DdlBagisTurleri" runat="server" DataSourceID="SQLDS_BagisTurleri" DataTextField="bagis_turu_adi" DataValueField="id"></asp:DropDownList>
                        <label for="DdlBagisTurleri">Bağış Şekli</label>
                    </div>
                    <div class="input-field col s6">
                        <i class="material-icons prefix">attach_money</i>
                        <asp:TextBox ID="TxtBagisMiktari" ClientIDMode="Static" runat="server" CssClass="validate" TextMode="Number"></asp:TextBox>
                        <label for="TxtBagisMiktari">Miktar</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">phone</i>
                        <asp:TextBox ID="TxtTelefon" ClientIDMode="Static" runat="server" CssClass="validate"></asp:TextBox>
                        <label for="TxtTelefon">Telefon</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12 right-align">
                        <asp:LinkButton ID="BtnKaydet" runat="server" CssClass="waves-effect waves-light btn" OnClick="BtnKaydet_Click"><i class="material-icons left">done</i>Kaydet</asp:LinkButton>
                        <asp:HyperLink ID="BtnIptal" runat="server" CssClass="waves-effect red waves-light btn" NavigateUrl="~/AfetOncesi/KurumlarYonetimi.aspx"><i class="material-icons left">not_interested</i>İptal</asp:HyperLink>
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

