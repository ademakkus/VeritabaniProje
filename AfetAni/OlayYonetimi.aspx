<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OlayYonetimi.aspx.cs" Inherits="OlayYonetimi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:SqlDataSource ID="SQLDS_Olaylar" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' DeleteCommand="DELETE FROM [OLAYLAR] WHERE [id] = @id" InsertCommand="INSERT INTO [OLAYLAR] ([olay_turu], [ilce], [adres], [harita_konum], [olay_zamani], [ekleyen], [bagli_oldugu_ihbar]) VALUES (@olay_turu, @ilce, @adres, @harita_konum, @olay_zamani, @ekleyen, @bagli_oldugu_ihbar)" SelectCommand="SELECT OLAYLAR.id, OLAYLAR.olay_turu, OLAYLAR.ilce, OLAYLAR.adres, OLAYLAR.harita_konum, OLAYLAR.olay_zamani, OLAYLAR.ekleyen, OLAYLAR.bagli_oldugu_ihbar, Olay_Turleri.ihbar_turu_adi, ILCELER.ilce_adi, VHKI_PERSONELI.adi_soyadi FROM OLAYLAR INNER JOIN Olay_Turleri ON OLAYLAR.olay_turu = Olay_Turleri.id INNER JOIN ILCELER ON OLAYLAR.ilce = ILCELER.id INNER JOIN VHKI_PERSONELI ON OLAYLAR.ekleyen = VHKI_PERSONELI.id" UpdateCommand="UPDATE [OLAYLAR] SET [olay_turu] = @olay_turu, [ilce] = @ilce, [adres] = @adres, [harita_konum] = @harita_konum, [olay_zamani] = @olay_zamani, [ekleyen] = @ekleyen, [bagli_oldugu_ihbar] = @bagli_oldugu_ihbar WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="olay_turu" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="ilce" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="adres" Type="String"></asp:Parameter>
            <asp:Parameter Name="harita_konum" Type="String"></asp:Parameter>
            <asp:Parameter Name="olay_zamani" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="ekleyen" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="bagli_oldugu_ihbar" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLDS_Ihbarlar" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT IHBARLAR.id, IHBARLAR.ihbar_eden_telefon, IHBARLAR.ihbar_adresi, IHBARLAR.ihbar_eden_adi_soyadi, IHBARLAR.ihbar_zamani, IHBARLAR.ihbari_alan, IHBARLAR.ihbar_turu, IHBARLAR.ilce, IHBARLAR.aciklama, ILCELER.ilce_adi, VHKI_PERSONELI.adi_soyadi, Olay_Turleri.ihbar_turu_adi FROM IHBARLAR INNER JOIN ILCELER ON IHBARLAR.ilce = ILCELER.id INNER JOIN VHKI_PERSONELI ON IHBARLAR.ihbari_alan = VHKI_PERSONELI.id INNER JOIN Olay_Turleri ON IHBARLAR.ihbar_turu = Olay_Turleri.id"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLDS_OlayTurleri" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT * FROM [Olay_Turleri]"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="SQLDS_Ilceler" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT * FROM [ILCELER] order by ilce_adi"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLDS_Vhki" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT [id], [adi_soyadi] FROM [VHKI_PERSONELI]" CancelSelectOnNullParameter="False"></asp:SqlDataSource>
    <div class="col s9 m9 l9">
        <div class="card white">
    <div class="card-content">
    <div class="row">
    <div class="col s12 m12 l12">
    <span class="card-title"><strong>Olay Yönetimi</strong></span>
        <asp:GridView ID="GridView1" CssClass="striped" runat="server" DataSourceID="SQLDS_Olaylar" AutoGenerateColumns="False" DataKeyNames="id" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="#" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
                            <asp:TemplateField HeaderText="Olay Türü" SortExpression="olay_turu">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DdlOlayTurleri" runat="server" DataSourceID="SQLDS_OlayTurleri" DataTextField="ihbar_turu_adi" DataValueField="id" SelectedValue='<%# Bind("olay_turu") %>'></asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Bind("ihbar_turu_adi") %>' ID="Label10"></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>
                            <asp:BoundField DataField="adres" HeaderText="Adres" SortExpression="adres"></asp:BoundField>
                            <asp:TemplateField HeaderText="Olay Zamanı" SortExpression="olay_zamani">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%# Bind("olay_zamani", "{0:yyyy-MM-ddTHH:mm}") %>' ID="TextBox6" TextMode="DateTimeLocal"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Bind("olay_zamani", "{0:dd.MM.yyyy HH:mm}") %>' ID="Label8"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            <asp:TemplateField HeaderText="Bağlı Olduğu İhbar" SortExpression="bagli_oldugu_ihbar">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DdlIhbarlar" runat="server" DataSourceID="SQLDS_Ihbarlar" DataTextField="aciklama" DataValueField="id" SelectedValue='<%# Bind("bagli_oldugu_ihbar") %>'></asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# Bind("bagli_oldugu_ihbar") %>' ID="Label2"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="İlçe" SortExpression="ilce">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DdlIlceler" runat="server" DataSourceID="SQLDS_Ilceler" DataTextField="ilce_adi" DataValueField="id" SelectedValue='<%# Bind("ilce") %>'></asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Bind("ilce_adi") %>' ID="Label1"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            <asp:TemplateField HeaderText="Harita" SortExpression="harita_konum">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" Text='<%# Bind("harita_konum") %>' ID="TextBox1"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <a href="#!" class="tooltipped teal-text haritakonum" data-position="top" data-delay="50" data-tooltip='<%# Eval("harita_konum") %>'><i class="material-icons">map</i></a>
                        
                    </ItemTemplate>
                </asp:TemplateField>

                            <asp:TemplateField HeaderText="Ekleyen" SortExpression="ekleyen">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DdlVhki" runat="server" DataSourceID="SQLDS_Vhki" DataTextField="adi_soyadi" DataValueField="id" SelectedValue='<%# Bind("ekleyen") %>'></asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Bind("adi_soyadi") %>' ID="Label7"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:LinkButton runat="server" Text="" CommandName="Update" CausesValidation="True" ID="LbTamam">
                            <i class="material-icons green-text">done</i>
                                        </asp:LinkButton>&nbsp;
                        <asp:LinkButton runat="server" Text="" CommandName="Cancel" CausesValidation="False" ID="LbIptal" CssClass="GvLbIptal">
                            <i class="material-icons red-text">not_interested</i>
                        </asp:LinkButton>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" CausesValidation="False" ID="LbDuzenle" CssClass="GvLbDuzenle">
                            <i class="material-icons">mode_edit</i>
                                        </asp:LinkButton>&nbsp;
                        <asp:LinkButton runat="server" Text="Delete" CommandName="Delete" CausesValidation="False" ID="LbSil">
                            <i class="material-icons red-text">delete</i>
                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
            </Columns>
        </asp:GridView>
                </div>
            </div>
            <div class="row">
                <div class="col s12 m12 l12 right-align">
                    <asp:LinkButton ID="BtnIhbardanYeniOlay" ClientIDMode="Static" runat="server" CssClass="waves-effect waves-light btn amber lighten-2 black-text"><i class="material-icons left">control_point</i>İhbardan Yeni Olay Ekle</asp:LinkButton> 
                    <asp:HyperLink ID="BtnYeniOlay" runat="server" CssClass="waves-effect waves-light btn teal" NavigateUrl="~/AfetAni/OlayEkle.aspx"><i class="material-icons left">control_point</i>Yeni Olay Ekle</asp:HyperLink>
                </div>
            </div>

        </div>
            </div>
    </div>
    <div id="harita_modal" class="modal">
        <div class="modal-content" id="harita_content" style="height: 300px;">
        </div>
        <div class="modal-footer">
            <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Tamam</a>
        </div>
    </div>
<div id="ihbarsec_modal" class="modal">
        <div class="modal-content" id="ihbarsec_content" style=" width: 600px; height: 400px;">
            <h4>İhbar Seçiniz</h4>
            <asp:GridView ID="GridView2" CssClass="striped" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SQLDS_Ihbarlar" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">

                            <Columns>
                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                                <asp:BoundField DataField="id" HeaderText="#" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
                                <asp:TemplateField HeaderText="İhbar Türü" SortExpression="ihbar_turu">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DdlOlayTurleri" runat="server" DataSourceID="SQLDS_OlayTurleri" DataTextField="ihbar_turu_adi" DataValueField="id" SelectedValue='<%# Bind("ihbar_turu") %>'></asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Bind("ihbar_turu_adi") %>' ID="Label3"></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="ihbar_eden_adi_soyadi" HeaderText="İhbar Eden Adı Soyadı" SortExpression="ihbar_eden_adi_soyadi"></asp:BoundField>
                                <asp:BoundField DataField="ihbar_adresi" HeaderText="İhbar Adresi" SortExpression="ihbar_adresi"></asp:BoundField>
                                <asp:BoundField DataField="ilce_adi" HeaderText="İlçe" SortExpression="ilce_adi"></asp:BoundField>
                                <asp:BoundField DataField="ihbar_zamani" HeaderText="İhbar Zamanı" SortExpression="ihbar_zamani"></asp:BoundField>
                                <asp:TemplateField HeaderText="İhbar Zamanı" SortExpression="ihbar_zamani">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Bind("ihbar_zamani", "{0:dd.MM.yyyy HH:mm}") %>' ID="Label4"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="aciklama" HeaderText="Açıklama" SortExpression="aciklama"></asp:BoundField>
                                
                            </Columns>
                        </asp:GridView>
        </div>
        <div class="modal-footer">
            <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Tamam</a>
        </div>
    </div>

    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>
    <script type="text/javascript">
        var haritacont = document.getElementById('harita_content');
        var map = null;
        var marker = null;

        $('#BtnIhbardanYeniOlay').click(function (e) {
            e.preventDefault();

            $('#ihbarsec_modal').openModal();
        });

        $('.haritakonum').click(function () {
            var LatLng = {
                lat: parseFloat($(this).data('tooltip').split(',')[0]),
                lng: parseFloat($(this).data('tooltip').split(',')[1])
            };

            if (map == null || marker == null) {
                map = new google.maps.Map(haritacont, {
                    zoom: 10,
                    center: LatLng
                });
                marker = new google.maps.Marker({
                    position: LatLng,
                    map: map,
                    title: $(this).data('baslik')
                });
            }
            else {
                map.setCenter(LatLng);
                marker.setPosition(LatLng);
            }

            $('#harita_modal').openModal();
        });
    </script>
</asp:Content>

