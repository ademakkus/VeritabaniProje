<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="KurumlarYonetimi.aspx.cs" Inherits="PartneKurumlarYonetimi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SQLDS_Kurumlar" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' DeleteCommand="DELETE FROM [KURUMLAR] WHERE [id] = @id" SelectCommand="SELECT KURUMLAR.id, KURUMLAR.kurum_adi, KURUMLAR.telefon, KURUMLAR.bulundugu_ilce, KURUMLAR.kurum_temsilcisi, KURUMLAR.harita_konum, ILCELER.id AS ilce_id, ILCELER.ilce_adi, KURUM_TEMSILCILERI.id AS temsilci_id, KURUM_TEMSILCILERI.adi_soyadi FROM KURUMLAR INNER JOIN ILCELER ON KURUMLAR.bulundugu_ilce = ILCELER.id INNER JOIN KURUM_TEMSILCILERI ON KURUMLAR.kurum_temsilcisi = KURUM_TEMSILCILERI.id" UpdateCommand="UPDATE [KURUMLAR] SET [kurum_adi] = @kurum_adi, [telefon] = @telefon, [bulundugu_ilce] = @bulundugu_ilce, [kurum_temsilcisi] = @kurum_temsilcisi, [harita_konum] = @harita_konum WHERE [id] = @id">

        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="kurum_adi" Type="String"></asp:Parameter>
            <asp:Parameter Name="telefon" Type="String"></asp:Parameter>
            <asp:Parameter Name="bulundugu_ilce" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="kurum_temsilcisi" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="harita_konum" Type="String"></asp:Parameter>
            <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLDS_Kurum_Temsilcileri" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT * FROM [KURUM_TEMSILCILERI] ORDER BY [adi_soyadi]" DeleteCommand="DELETE FROM [KURUM_TEMSILCILERI] WHERE [id] = @id" InsertCommand="INSERT INTO [KURUM_TEMSILCILERI] ([adi_soyadi], [telefon], [kan_grubu], [email]) VALUES (@adi_soyadi, @telefon, @kan_grubu, @email)" UpdateCommand="UPDATE [KURUM_TEMSILCILERI] SET [adi_soyadi] = @adi_soyadi, [telefon] = @telefon, [kan_grubu] = @kan_grubu, [email] = @email WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="adi_soyadi" Type="String"></asp:Parameter>
            <asp:Parameter Name="telefon" Type="String"></asp:Parameter>
            <asp:Parameter Name="kan_grubu" Type="String"></asp:Parameter>
            <asp:Parameter Name="email" Type="String"></asp:Parameter>
            <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="SQLDS_Ilceler" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT * FROM [ILCELER] order by ilce_adi"></asp:SqlDataSource>
<div class="col s9 m9 l9">
    <div class="card-panel white">
        <div class="row">
    <div class="col s12">
      <ul class="tabs">
        <li class="tab col s6"><asp:HyperLink ID="HyperLinkKurumlar" runat="server" NavigateUrl="#tab_kurumlar"><strong>KURUMLAR</strong></asp:HyperLink></li>
        <li class="tab col s6"><asp:HyperLink ID="HyperLinkTemsilciler" runat="server" NavigateUrl="#tab_kurum_temsilcileri"><strong>KURUM TEMSİLCİLERİ</strong></asp:HyperLink></li>
      </ul>
    </div>
    <div id="tab_kurumlar" class="col s12">
        
        <div class="row">
    <div class="col s12 m12 l12">
        <asp:GridView CssClass="striped" ID="GrdKurumlar" runat="server" AutoGenerateColumns="False" DataKeyNames="id,ilce_id,temsilci_id" DataSourceID="SQLDS_Kurumlar" OnRowCommand="GrdKurumlar_RowCommand">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="#" ReadOnly="True" InsertVisible="False" SortExpression="kurum_id"></asp:BoundField>
                <asp:BoundField DataField="kurum_adi" HeaderText="Kurum Adı" SortExpression="kurum_adi"></asp:BoundField>
                <asp:BoundField DataField="bulundugu_ilce" HeaderText="bulundugu_ilce" SortExpression="bulundugu_ilce" Visible="False"></asp:BoundField>
                <asp:BoundField DataField="ilce_id" HeaderText="ilce_id" SortExpression="ilce_id" Visible="False" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                <asp:BoundField DataField="telefon" HeaderText="Telefon" SortExpression="telefon"></asp:BoundField>
                <asp:TemplateField HeaderText="Bul. İlçe" SortExpression="ilce_adi">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DdlIlceler" runat="server" DataSourceID="SQLDS_Ilceler" DataTextField="ilce_adi" DataValueField="id" SelectedValue='<%# Bind("bulundugu_ilce") %>'></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("ilce_adi") %>' ID="Label2"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Kurum Tems." SortExpression="adi_soyadi">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DdlKurumTemsilcisi" runat="server" DataSourceID="SQLDS_Kurum_Temsilcileri" DataTextField="adi_soyadi" DataValueField="id" SelectedValue='<%# Bind("kurum_temsilcisi") %>'></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("adi_soyadi") %>' ID="Label1"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Harita" SortExpression="harita_konum">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" Text='<%# Bind("harita_konum") %>' ID="TextBox1"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <a runat="server" href="#!" class="tooltipped teal-text haritakonum" data-position="top" data-delay="50" data-tooltip='<%# Eval("harita_konum") %>'><i class="material-icons">map</i></a>
                        
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
                        <asp:LinkButton runat="server" Text="" CommandName="Edit" CausesValidation="False" ID="LbDuzenle" CssClass="GvLbDuzenle">
                            <i class="material-icons">mode_edit</i>
                        </asp:LinkButton>&nbsp;
                        <asp:LinkButton runat="server" Text="" CommandName="Delete" CausesValidation="False" ID="LbSil">
                            <i class="material-icons red-text">delete</i>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
        </div>
            </div>
        <div class="row">
    <div class="col s12 m12 l12">
        <asp:HyperLink ID="BtnYeniKurum" runat="server" CssClass="waves-effect waves-light btn right teal" NavigateUrl="~/AfetOncesi/KurumEkle.aspx"><i class="material-icons left">control_point</i>Yeni Kurum</asp:HyperLink>
       </div>
       </div>
        
    </div>

    <div id="tab_kurum_temsilcileri" class="col s12">
        <div class="row">
    <div class="col s12 m12 l12">
        <asp:GridView CssClass="striped" ID="GrdKurumTemsilcileri" runat="server" DataSourceID="SQLDS_Kurum_Temsilcileri" AutoGenerateColumns="False" DataKeyNames="id" OnRowCommand="GrdKurumTemsilcileri_RowCommand">

            <Columns>
                <asp:BoundField DataField="id" HeaderText="#" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
                <asp:BoundField DataField="adi_soyadi" HeaderText="Adı Soyadı" SortExpression="adi_soyadi"></asp:BoundField>
                <asp:BoundField DataField="telefon" HeaderText="Telefon" SortExpression="telefon"></asp:BoundField>
                <asp:TemplateField HeaderText="Kan Grubu" SortExpression="kan_grubu">
                    <EditItemTemplate>
                        <asp:DropDownList SelectedValue='<%# Bind("kan_grubu") %>' ID="DdlKanGrubu" runat="server">
                            <asp:ListItem Value="0 Rh (-)">0 Rh (-)</asp:ListItem>
                            <asp:ListItem Value="0 Rh (+)">0 Rh (+)</asp:ListItem>
                            <asp:ListItem Value="A Rh (-)">A Rh (-)</asp:ListItem>
                            <asp:ListItem Value="A Rh (+)">A Rh (+)</asp:ListItem>
                            <asp:ListItem Value="B Rh (-)">B Rh (-)</asp:ListItem>
                            <asp:ListItem Value="B Rh (+)">B Rh (+)</asp:ListItem>
                            <asp:ListItem Value="AB Rh (-)">AB Rh (-)</asp:ListItem>
                            <asp:ListItem Value="AB Rh (+)">AB Rh (+)</asp:ListItem>
                        </asp:DropDownList>
                   
                        </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("kan_grubu") %>' ID="Label3"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="email" HeaderText="E-posta" SortExpression="email"></asp:BoundField>
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
                        <asp:LinkButton runat="server" Text="" CommandName="Edit" CausesValidation="False" ID="LbDuzenle" CssClass="GvLbDuzenle">
                            <i class="material-icons">mode_edit</i>
                        </asp:LinkButton>&nbsp;
                        <asp:LinkButton runat="server" Text="" CommandName="Delete" CausesValidation="False" ID="LbSil">
                            <i class="material-icons red-text">delete</i>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        </div></div>
        <div class="row">
    <div class="col s12 m12 l12">
        <asp:HyperLink ID="BtnKurumTemsilcisiEkle" runat="server" CssClass="waves-effect waves-light btn right teal" NavigateUrl="~/AfetOncesi/KurumTemsilcisiEkle.aspx"><i class="material-icons left">control_point</i>Yeni Kurum Temsilcisi</asp:HyperLink>
       </div>
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
 
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>
        <script type="text/javascript">
            var haritacont = document.getElementById('harita_content');
            var map = null;
            var marker = null;

            $('.haritakonum').click(function () {
                var LatLng = {
                    lat: parseFloat($(this).data('tooltip').split(',')[0]),
                    lng: parseFloat($(this).data('tooltip').split(',')[1])
                };

                if (map == null || marker == null) {
                    map = new google.maps.Map(haritacont, {
                        zoom: 15,
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

