<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MotorluAracEkle.aspx.cs" Inherits="AfetOncesi_MotorluAracEkle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:SqlDataSource ID="SQLDS_MotorluAraclar" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' InsertCommand="INSERT INTO [MOTORLU_ARACLAR] ([sorumlu_tc_no], [sorumlu_adi_soyadi], [sorumlu_telefon], [tasit_turu], [yolcu_kapasitesi], [plaka]) VALUES (@sorumlu_tc_no, @sorumlu_adi_soyadi, @sorumlu_telefon, @tasit_turu, @yolcu_kapasitesi, @plaka)">
        <InsertParameters>
            <asp:ControlParameter ControlID="TxtTcKimlik" Name="sorumlu_tc_no" PropertyName="Text" Type="Int64" />
            <asp:ControlParameter ControlID="TxtAdiSoyadi" Name="sorumlu_adi_soyadi" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TxtTelefon" Name="sorumlu_telefon" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="DdlTasitTuru" Name="tasit_turu" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="TxtKapasite" Name="yolcu_kapasitesi" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="TxtPlaka" Name="plaka" PropertyName="Text" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLDS_TasitTurleri" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT * FROM [Tasit_Turleri] ORDER BY [tasit_turu_adi]"></asp:SqlDataSource>
    <div class="col s9 m9 l9">
        <div class="card white">
            <div class="card-content">
                <span class="card-title">Yeni Motorlu Araç Ekle</span>
                
                <div class="row">
                    <div class="input-field col s5">
                            <asp:DropDownList ClientIDMode="Static" ID="DdlTasitTuru" runat="server" DataSourceID="SQLDS_TasitTurleri" DataTextField="tasit_turu_adi" DataValueField="id"></asp:DropDownList>
                        <label>Taşıt Türü</label>
                    </div>
                        <div class="input-field col s7">
                        <i class="material-icons prefix">directions_car</i>
                        <asp:TextBox ID="TxtPlaka" ClientIDMode="Static" runat="server" CssClass="validate"></asp:TextBox>
                        <label for="TxtPlaka">Plaka</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s5">
                        <i class="material-icons prefix">fingerprint</i>
                        <asp:TextBox ID="TxtTcKimlik" ClientIDMode="Static" runat="server" CssClass="validate"></asp:TextBox>
                        <label for="TxtTcKimlik">Sorumlu TC Kimlik Numarası</label>
                    </div>
                    <div class="input-field col s7">
                        <i class="material-icons prefix">account_box</i>
                        <asp:TextBox ID="TxtAdiSoyadi" ClientIDMode="Static" runat="server" CssClass="validate"></asp:TextBox>
                        <label for="TxtAdiSoyadi">Sorumlu Adı Soyadı</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s5">
                        <i class="material-icons prefix">phone</i>
                        <asp:TextBox ID="TxtTelefon" ClientIDMode="Static" runat="server" CssClass="validate"></asp:TextBox>
                        <label for="TxtTelefon">Sorumlu Telefon Numarası</label>
                    </div>
                    <div class="input-field col s3">
                        <i class="material-icons prefix">airline_seat_recline_normal
</i>
                        <asp:TextBox ID="TxtKapasite" TextMode="Number" ClientIDMode="Static" runat="server" CssClass="validate"></asp:TextBox>
                        <label for="TxtKapasite">Yolcu Kapasitesi</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12 right-align">
                        <asp:LinkButton ID="BtnKaydet" runat="server" CssClass="waves-effect waves-light btn" OnClick="BtnKaydet_Click"><i class="material-icons left">done</i>Kaydet</asp:LinkButton>
                        <asp:HyperLink ID="BtnIptal" runat="server" CssClass="waves-effect red waves-light btn" NavigateUrl="~/AfetOncesi/MotorluAraclarYonetimi.aspx"><i class="material-icons left">not_interested</i>İptal</asp:HyperLink>
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

