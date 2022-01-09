<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="IhbarEkle.aspx.cs" Inherits="AfetAni_IhbarEkle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SQLDS_Ihbarlar" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' InsertCommand="INSERT INTO [IHBARLAR] ([ihbar_eden_telefon], [ihbar_adresi], [ihbar_eden_adi_soyadi], [ihbar_zamani], [ihbari_alan], [ihbar_turu], [ilce], [aciklama]) VALUES (@ihbar_eden_telefon, @ihbar_adresi, @ihbar_eden_adi_soyadi, @ihbar_zamani, @ihbari_alan, @ihbar_turu, @ilce, @aciklama)">
        <InsertParameters>
            <asp:ControlParameter ControlID="TxtTelefon" Name="ihbar_eden_telefon" PropertyName="Text" />
            <asp:ControlParameter ControlID="TxtIhbarAdresi" Name="ihbar_adresi" PropertyName="Text" />
            <asp:ControlParameter ControlID="TxtAdiSoyadi" Name="ihbar_eden_adi_soyadi" PropertyName="Text" />
            <asp:SessionParameter Name="ihbari_alan" SessionField="user_tckimlik" />
            <asp:ControlParameter ControlID="DdlOlayTurleri" Name="ihbar_turu" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DdlIlceler" Name="ilce" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="TxtAciklama" Name="aciklama" PropertyName="Text" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLDS_Ilceler" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT * FROM [ILCELER]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLDS_OlayTurleri" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT * FROM [Olay_Turleri]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLDS_Vhki" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT [id], [adi_soyadi] FROM [VHKI_PERSONELI]"></asp:SqlDataSource>
<div class="col s9 m9 l9" id="icerik">
    <div class="col s9 m9 l9">
        <div class="card white">
            <div class="card-content">
                <span class="card-title">Yeni İhbar Ekle</span>
                <div class="row">
                    <div class="input-field col s6">
                        <asp:DropDownList ID="DdlOlayTurleri" runat="server" DataSourceID="SQLDS_OlayTurleri" DataTextField="ihbar_turu_adi" DataValueField="id"></asp:DropDownList>
                        <label for="DdlOlayTurleri">İhbar Türü</label>
                    </div>
                    <div class="input-field col s6">
                        <i class="material-icons prefix">account_box</i>
                        <asp:TextBox ID="TxtAdiSoyadi" ClientIDMode="Static" runat="server" CssClass="validate"></asp:TextBox>
                        <label for="TxtAdiSoyadi">İhbar Eden Adı Soyadı</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">phone</i>
                        <asp:TextBox ID="TxtTelefon" ClientIDMode="Static" runat="server" CssClass="validate"></asp:TextBox>
                        <label for="TxtTelefon">İhbar Eden Telefon Numarası</label>
                    </div>
                    <div class="input-field col s6">
                         <i class="material-icons prefix">alarm</i>
                        <asp:TextBox ID="TxtIhbarZamani" TextMode="DateTimeLocal" ClientIDMode="Static" runat="server"></asp:TextBox>
                        <label for="TxtIhbarZamani" class="active">İhbar Zamanı</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">map</i>
                        <asp:TextBox ID="TxtIhbarAdresi" TextMode="MultiLine" ClientIDMode="Static" runat="server" CssClass="materialize-textarea"></asp:TextBox>
                        <label for="TxtIhbarAdresi">İhbar Adresi</label>
                    </div>
                    <div class="input-field col s6">
                        <asp:DropDownList ID="DdlIlceler" runat="server" DataSourceID="SQLDS_Ilceler" DataTextField="ilce_adi" DataValueField="id"></asp:DropDownList>
                        <label for="DdlIlceler">İlçe</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                       <i class="material-icons prefix">description</i>
                        <asp:TextBox ID="TxtAciklama" TextMode="MultiLine" ClientIDMode="Static" runat="server" CssClass="materialize-textarea"></asp:TextBox>
                        <label for="TxtAciklama">Açıklama</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12 right-align">
                        <asp:LinkButton ID="BtnKaydet" runat="server" CssClass="waves-effect waves-light btn" OnClick="BtnKaydet_Click"><i class="material-icons left">done</i>Kaydet</asp:LinkButton>
                        <asp:HyperLink ID="BtnIptal" runat="server" CssClass="waves-effect red waves-light btn" NavigateUrl="~/AfetAni/IhbarYonetimi.aspx"><i class="material-icons left">not_interested</i>İptal</asp:HyperLink>
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
    </div>

</asp:Content>

