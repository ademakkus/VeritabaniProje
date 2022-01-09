<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AfetzedeEkle.aspx.cs" Inherits="AfetzedeEkle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <asp:SqlDataSource ID="SQLDS_Afetzede" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' InsertCommand="INSERT INTO [AFETZEDELER] ([tc_kimlik], [adi_soyadi], [durum_bilgisi], [ilgilenen]) VALUES (@tc_kimlik, @adi_soyadi, @durum_bilgisi, @ilgilenen)">
            <InsertParameters>
                <asp:ControlParameter ControlID="TxtTcKimlik" Name="tc_kimlik" PropertyName="Text" Type="Int64" />
                <asp:ControlParameter ControlID="TxtAdiSoyadi" Name="adi_soyadi" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TxtDurum" Name="durum_bilgisi" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="DdlIlgilenen" Name="ilgilenen" PropertyName="SelectedValue" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLDS_Personel" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT * FROM [AFAD_PERSONELI] WHERE ([personel_turu] = @personel_turu)">
        <SelectParameters>
            <asp:Parameter DefaultValue="3" Name="personel_turu" Type="Int32"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
<div class="col s9 m9 l9">
        <div class="card white">
            <div class="card-content">
                <span class="card-title">Yeni Afetzede Ekle</span>
                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">fingerprint</i>
                        <asp:TextBox ID="TxtTcKimlik" ClientIDMode="Static" runat="server" CssClass="validate"></asp:TextBox>
                        <label for="TxtTcKimlik">TC Kimlik No</label>
                    </div>
                    <div class="input-field col s6">
                        <i class="material-icons prefix">account_box</i>
                        <asp:TextBox ID="TxtAdiSoyadi" ClientIDMode="Static" runat="server" CssClass="validate"></asp:TextBox>
                        <label for="TxtAdiSoyadi">Adı Soyadı</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix"></i>
                        <asp:TextBox ID="TxtDurum" ClientIDMode="Static" runat="server" CssClass="validate"></asp:TextBox>
                        <label for="TxtDurum">Durum Bilgisi</label>
                    </div>
                    <div class="input-field col s6">
                        <asp:DropDownList ClientIDMode="Static" ID="DdlIlgilenen" runat="server" DataSourceID="SQLDS_Personel" DataTextField="adi_soyadi" DataValueField="id"></asp:DropDownList>
                        <label for="DdlIlgilenen">İlgilenecek PDR Personeli</label>
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

