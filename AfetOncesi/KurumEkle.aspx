<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="KurumEkle.aspx.cs" Inherits="KurumEkle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SQLDS_Kurumlar" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' InsertCommand="INSERT INTO [KURUMLAR] ([kurum_adi], [telefon], [bulundugu_ilce], [kurum_temsilcisi], [harita_konum]) VALUES (@kurum_adi, @telefon, @bulundugu_ilce, @kurum_temsilcisi, @harita_konum)">
        <InsertParameters>
            <asp:ControlParameter ControlID="TxtKurumAdi" Name="kurum_adi" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TxtTelefon" Name="telefon" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="DdlIlceler" Name="bulundugu_ilce" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="DdlKurumTemsilcisi" Name="kurum_temsilcisi" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="TxtHaritaKonum" Name="harita_konum" PropertyName="Text" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLDS_Kurum_Temsilcileri" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT * FROM [KURUM_TEMSILCILERI] order by adi_soyadi">
    </asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="SQLDS_Ilceler" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT * FROM [ILCELER] order by ilce_adi"></asp:SqlDataSource>
<div class="col s9 m9 l9">
        <div class="card white">
            <div class="card-content">
                <span class="card-title">Yeni Kurum Ekle</span>
                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">account_box</i>
                        <asp:TextBox ID="TxtKurumAdi" ClientIDMode="Static" runat="server" CssClass="validate"></asp:TextBox>
                        <label for="TxtKurumAdi">Kurum Adı</label>
                    </div>
                    <div class="input-field col s6">
                        <i class="material-icons prefix">phone</i>
                        <asp:TextBox ID="TxtTelefon" ClientIDMode="Static" runat="server" CssClass="validate"></asp:TextBox>
                        <label for="TxtTelefon">Telefon Numarası</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <asp:DropDownList ClientIDMode="Static" ID="DdlIlceler" runat="server" DataSourceID="SQLDS_Ilceler" DataTextField="ilce_adi" DataValueField="id"></asp:DropDownList>
                        <label for="DdlIlceler">Bulunduğu İlçe</label>
                    </div>
                    <div class="input-field col s6">
                        <asp:DropDownList ClientIDMode="Static" ID="DdlKurumTemsilcisi" runat="server" DataSourceID="SQLDS_Kurum_Temsilcileri" DataTextField="adi_soyadi" DataValueField="id"></asp:DropDownList>
                        <label for="DdlKurumTemsilcisi">Kurum Temsilcisi</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">map</i>
                        <asp:TextBox ID="TxtHaritaKonum" ClientIDMode="Static" runat="server" CssClass="validate"></asp:TextBox>
                        <label for="TxtHaritaKonum" id="TxtHaritaKonumLabel">Harita Konumu</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12 right-align">
                        <asp:LinkButton ID="BtnKaydet" runat="server" CssClass="waves-effect waves-light btn" OnClick="BtnKaydet_Click"><i class="material-icons left">done</i>Kaydet</asp:LinkButton>
                        <asp:HyperLink ID="BtnIptal" runat="server" CssClass="waves-effect red waves-light btn" NavigateUrl="~/AfetOncesi/KurumlarYonetimi.aspx"><i class="material-icons left">not_interested</i>İptal</asp:HyperLink>
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

