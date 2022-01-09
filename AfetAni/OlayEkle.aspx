<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OlayEkle.aspx.cs" Inherits="OlayEkle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SQLDS_Ihbarlar" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT IHBARLAR.id, IHBARLAR.ihbar_eden_telefon, IHBARLAR.ihbar_adresi, IHBARLAR.ihbar_eden_adi_soyadi, IHBARLAR.ihbar_zamani, IHBARLAR.ihbari_alan, IHBARLAR.ihbar_turu, IHBARLAR.ilce, IHBARLAR.aciklama, ILCELER.ilce_adi, VHKI_PERSONELI.adi_soyadi, Olay_Turleri.ihbar_turu_adi FROM IHBARLAR INNER JOIN ILCELER ON IHBARLAR.ilce = ILCELER.id INNER JOIN VHKI_PERSONELI ON IHBARLAR.ihbari_alan = VHKI_PERSONELI.id INNER JOIN Olay_Turleri ON IHBARLAR.ihbar_turu = Olay_Turleri.id WHERE IHBARLAR.id = @id">
        <SelectParameters>
            <asp:QueryStringParameter Name="id" QueryStringField="IhbarNo" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLDS_Olaylar" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' InsertCommand="INSERT INTO [OLAYLAR] ([olay_turu], [ilce], [adres], [harita_konum], [olay_zamani], [ekleyen], [bagli_oldugu_ihbar]) VALUES (@olay_turu, @ilce, @adres, @harita_konum, @olay_zamani, @ekleyen, @bagli_oldugu_ihbar)">
        <InsertParameters>
            <asp:ControlParameter ControlID="DdlOlayTurleri" Name="olay_turu" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="DdlIlceler" Name="ilce" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="TxtOlayAdresi" Name="adres" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TxtHaritaKonum" Name="harita_konum" PropertyName="Text" Type="String" />
            <asp:SessionParameter Name="ekleyen" SessionField="user_id" Type="Int32" />
            <asp:Parameter Name="bagli_oldugu_ihbar" Type="Int32"></asp:Parameter>
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLDS_Ilceler" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT * FROM [ILCELER]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLDS_OlayTurleri" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT * FROM [Olay_Turleri]"></asp:SqlDataSource>
<div class="col s9 m9 l9">
        <div class="card white">
            <div class="card-content">
                <span class="card-title">Yeni Olay Ekle</span>
                <div class="row">
                    <div class="input-field col s6">
                        <asp:DropDownList ClientIDMode="Static" ID="DdlOlayTurleri" runat="server" DataSourceID="SQLDS_OlayTurleri" DataTextField="ihbar_turu_adi" DataValueField="id"></asp:DropDownList>
                        <label for="DdlOlayTurleri">Olay Türü</label>
                    </div>
                    <div class="input-field col s6">
                         <i class="material-icons prefix">alarm</i>
                        <asp:TextBox ID="TxtOlayZamani" TextMode="DateTimeLocal" ClientIDMode="Static" runat="server"></asp:TextBox>
                        <label for="TxtOlayZamani" class="active">Olay Zamanı</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <asp:DropDownList ClientIDMode="Static" ID="DdlIlceler" runat="server" DataSourceID="SQLDS_Ilceler" DataTextField="ilce_adi" DataValueField="id"></asp:DropDownList>
                        <label for="DdlIlceler">Olay İlçesi</label>
                    </div>
                    <div class="input-field col s6">
                        <i class="material-icons prefix">map</i>
                        <asp:TextBox ID="TxtHaritaKonum" ClientIDMode="Static" runat="server" CssClass="validate"></asp:TextBox>
                        <label for="TxtHaritaKonum" id="TxtHaritaKonumLabel">Harita Konumu</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">map</i>
                        <asp:TextBox ID="TxtOlayAdresi" TextMode="MultiLine" ClientIDMode="Static" runat="server" CssClass="materialize-textarea"></asp:TextBox>
                        <label for="TxtOlayAdresi">Olay Adresi</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12 right-align">
                        <asp:LinkButton ID="BtnKaydet" runat="server" CssClass="waves-effect waves-light btn" OnClick="BtnKaydet_Click"><i class="material-icons left">done</i>Kaydet</asp:LinkButton>
                        <asp:HyperLink ID="BtnIptal" runat="server" CssClass="waves-effect red waves-light btn" NavigateUrl="~/AfetAni/OlayYonetimi.aspx"><i class="material-icons left">not_interested</i>İptal</asp:HyperLink>
                    </div>
                </div>
 <div id="harita_sec" class="modal">
    <div class="modal-content">
      <h4>Konum Seçiniz</h4>
      <div style="height: 300px;" id="harita_sec_konum"></div>
    </div>
    <div class="modal-footer">
      <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Tamam</a>
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
        <script type="text/javascript">
            $(document).ready(function () {
                var marker = null;
                var map = new google.maps.Map(document.getElementById('harita_sec_konum'), {
                    zoom: 10,
                    center: { lat: 39.9, lng: 32.8 }
                });

                map.addListener('click', function (e) {
                    if (marker) marker.setMap(null);
                    marker = new google.maps.Marker({
                        position: e.latLng,
                        map: map
                    });
                    var lat = marker.getPosition().lat();
                    var lng = marker.getPosition().lng();
                    $('#TxtHaritaKonumLabel').addClass('active');
                    $('#TxtHaritaKonum').val(lat + ',' + lng);

                });

                $('#TxtHaritaKonum').click(function () {
                    $('#TxtHaritaKonum').trigger('keydown');
                    $('#harita_sec').openModal();
                    google.maps.event.trigger(map, 'resize');
                });
            });
            
            
        </script>
</asp:Content>

