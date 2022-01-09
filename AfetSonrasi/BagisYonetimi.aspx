<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BagisYonetimi.aspx.cs" Inherits="AfetSonrasi_BagisYonetimi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SQLDS_Bagislar" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' DeleteCommand="DELETE FROM [BAGISLAR] WHERE [id] = @id" InsertCommand="INSERT INTO [BAGISLAR] ([bagisi_yapan_tc_kimlik], [bagisi_yapan_adi_soyadi], [bagis_turu], [bagis_miktari], [telefon], [ekleyen]) VALUES (@bagisi_yapan_tc_kimlik, @bagisi_yapan_adi_soyadi, @bagis_turu, @bagis_miktari, @telefon, @ekleyen)" SelectCommand="SELECT BAGISLAR.id, BAGISLAR.bagisi_yapan_tc_kimlik, BAGISLAR.bagisi_yapan_adi_soyadi, BAGISLAR.bagis_turu, BAGISLAR.bagis_miktari, BAGISLAR.telefon, BAGISLAR.ekleyen, Bagis_Turleri.bagis_turu_adi, VHKI_PERSONELI.adi_soyadi FROM BAGISLAR INNER JOIN Bagis_Turleri ON BAGISLAR.bagis_turu = Bagis_Turleri.id INNER JOIN VHKI_PERSONELI ON BAGISLAR.ekleyen = VHKI_PERSONELI.id" UpdateCommand="UPDATE [BAGISLAR] SET [bagisi_yapan_tc_kimlik] = @bagisi_yapan_tc_kimlik, [bagisi_yapan_adi_soyadi] = @bagisi_yapan_adi_soyadi, [bagis_turu] = @bagis_turu, [bagis_miktari] = @bagis_miktari, [telefon] = @telefon, [ekleyen] = @ekleyen WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="bagisi_yapan_tc_kimlik" Type="Int64"></asp:Parameter>
            <asp:Parameter Name="bagisi_yapan_adi_soyadi" Type="String"></asp:Parameter>
            <asp:Parameter Name="bagis_turu" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="bagis_miktari" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="telefon" Type="String"></asp:Parameter>
            <asp:Parameter Name="ekleyen" Type="Int32"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="bagisi_yapan_tc_kimlik" Type="Int64"></asp:Parameter>
            <asp:Parameter Name="bagisi_yapan_adi_soyadi" Type="String"></asp:Parameter>
            <asp:Parameter Name="bagis_turu" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="bagis_miktari" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="telefon" Type="String"></asp:Parameter>
            <asp:Parameter Name="ekleyen" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLDS_BagisTurleri" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT * FROM [Bagis_Turleri]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLDS_Vhki" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT [id], [adi_soyadi] FROM [VHKI_PERSONELI]"></asp:SqlDataSource>
<div class="col s9 m9 l9">
    <div class="card white">
    <div class="card-content">
        <span class="card-title">Bağış Yönetimi</span>
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SQLDS_Bagislar" CssClass="striped">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="#" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
                <asp:TemplateField HeaderText="Bağış Şekli" SortExpression="bagis_turu">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SQLDS_BagisTurleri" DataTextField="bagis_turu_adi" DataValueField="id" SelectedValue='<%# Bind("bagis_turu") %>'></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("bagis_turu_adi") %>' ID="Label1"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:BoundField DataField="bagisi_yapan_tc_kimlik" HeaderText="Bağış Yapan TC No" SortExpression="bagisi_yapan_tc_kimlik"></asp:BoundField>
                <asp:BoundField DataField="bagisi_yapan_adi_soyadi" HeaderText="Bağış Yapan Adı Soyadı" SortExpression="bagisi_yapan_adi_soyadi"></asp:BoundField>
                <asp:BoundField DataField="bagis_miktari" HeaderText="Bağış Miktarı" SortExpression="bagis_miktari"></asp:BoundField>
                <asp:BoundField DataField="telefon" HeaderText="Telefon" SortExpression="telefon"></asp:BoundField>
                <asp:TemplateField HeaderText="Ekleyen" SortExpression="ekleyen">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SQLDS_Vhki" DataTextField="adi_soyadi" DataValueField="id" SelectedValue='<%# Bind("ekleyen") %>'></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("adi_soyadi") %>' ID="Label2"></asp:Label>
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
    <div class="col s12 m12 l12">
        <asp:HyperLink ID="BtnBagisEkle" runat="server" CssClass="waves-effect waves-light btn right teal" NavigateUrl="~/AfetSonrasi/BagisEkle.aspx"><i class="material-icons left">control_point</i>Yeni Bağış</asp:HyperLink>
       </div>
       </div>
</div>
</asp:Content>

