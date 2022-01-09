<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BarinmaKaynakYonetimi.aspx.cs" Inherits="BarinmaKaynakYonetimi" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="col s9 m9 l9">
    <div class="card white">
    <div class="card-content">
        <span class="card-title">Barınma Kaynakları</span>
        <asp:SqlDataSource ID="SQLDS_Barinma" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' DeleteCommand="DELETE FROM [BARINMA_KAYNAKLARI] WHERE [id] = @id" SelectCommand="SELECT BARINMA_KAYNAKLARI.*, KURUMLAR.kurum_adi, Barinma_Kaynak_Turleri.barinma_kaynak_turu_adi FROM BARINMA_KAYNAKLARI INNER JOIN Barinma_Kaynak_Turleri ON BARINMA_KAYNAKLARI.barinma_kaynak_turu = Barinma_Kaynak_Turleri.id INNER JOIN KURUMLAR ON BARINMA_KAYNAKLARI.bulundugu_kurum = KURUMLAR.id" UpdateCommand="UPDATE [BARINMA_KAYNAKLARI] SET [bulundugu_kurum] = @bulundugu_kurum, [kapasite] = @kapasite, [harita_konum] = @harita_konum, [adres] = @adres, [barinma_kaynak_turu] = @barinma_kaynak_turu WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="bulundugu_kurum" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="kapasite" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="harita_konum" Type="String"></asp:Parameter>
                <asp:Parameter Name="adres" Type="String"></asp:Parameter>
                <asp:Parameter Name="barinma_kaynak_turu" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SQLDS_Kurumlar" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT [kurum_adi], [id] FROM [KURUMLAR]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SQLDS_BarinmaKaynakTurleri" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT * FROM [Barinma_Kaynak_Turleri]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" CssClass="striped" runat="server" DataSourceID="SQLDS_Barinma" AutoGenerateColumns="False" DataKeyNames="id" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="#" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
                <asp:TemplateField HeaderText="Kaynak Türü" SortExpression="barinma_kaynak_turu">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DdlBarinmaKaynakTurleri" runat="server" DataSourceID="SQLDS_BarinmaKaynakTurleri" DataTextField="barinma_kaynak_turu_adi" DataValueField="id" SelectedValue='<%# Bind("barinma_kaynak_turu") %>'></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("barinma_kaynak_turu_adi") %>' ID="Label3"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bulunduğu Kurum" SortExpression="bulundugu_kurum">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DdlKurumlar" runat="server" DataSourceID="SQLDS_Kurumlar" DataTextField="kurum_adi" DataValueField="id" SelectedValue='<%# Bind("bulundugu_kurum") %>'></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("kurum_adi") %>' ID="Label1"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Kapasite" SortExpression="kapasite">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" TextMode="Number" Text='<%# Bind("kapasite") %>' ID="TextBox2"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("kapasite") %>' ID="Label2"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Harita" SortExpression="harita_konum">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" Text='<%# Bind("harita_konum") %>' ID="TextBox1"></asp:TextBox>

                    </EditItemTemplate>
                    <ItemTemplate>
                        <a runat="server" class="tooltipped teal-text haritakonum" data-position="top" data-delay="50" data-tooltip='<%# Eval("harita_konum") %>'><i class="material-icons">map</i></a>

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="adres" HeaderText="Adres" SortExpression="adres"></asp:BoundField>
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
    <div class="col s12 m12 l12">
        <asp:HyperLink ID="BtnBarinmaKaynagiEkle" runat="server" CssClass="waves-effect waves-light btn right teal" NavigateUrl="~/AfetAni/BarinmaKaynagiEkle.aspx"><i class="material-icons left">control_point</i>Yeni Barinma Kaynağı</asp:HyperLink>
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

