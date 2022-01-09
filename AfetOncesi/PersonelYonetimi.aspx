<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PersonelYonetimi.aspx.cs" Inherits="PersonelYonetimi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SQLDS_Personel" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>'
        SelectCommand="SELECT AFAD_PERSONELI.*, Personel_Turleri.* FROM AFAD_PERSONELI INNER JOIN Personel_Turleri ON AFAD_PERSONELI.personel_turu = Personel_Turleri.id"
        DeleteCommand="DELETE FROM [AFAD_PERSONELI] WHERE [id] = @id"
        UpdateCommand="UPDATE [AFAD_PERSONELI] SET [tc_kimlik] = @tc_kimlik, [telefon] = @telefon, [email] = @email, [kan_grubu] = @kan_grubu, [adi_soyadi] = @adi_soyadi, [personel_turu] = @personel_turu, [kayit_zamani] = @kayit_zamani, [ekleyen] = @ekleyen WHERE [id] = @id">
        
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="tc_kimlik" Type="Int64"></asp:Parameter>
            <asp:Parameter Name="telefon" Type="String"></asp:Parameter>
            <asp:Parameter Name="email" Type="String"></asp:Parameter>
            <asp:Parameter Name="kan_grubu" Type="String"></asp:Parameter>
            <asp:Parameter Name="adi_soyadi" Type="String"></asp:Parameter>
            <asp:Parameter Name="personel_turu" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="kayit_zamani" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="ekleyen" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLDS_PersonelTurleri" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT * FROM [Personel_Turleri] order by personel_turu"></asp:SqlDataSource>
<div class="col s9 m9 l9" id="icerik">
    <div class="card white">
    <div class="card-content">
    <div class="row">
    <div class="col s12 m12 l12">
    <span class="card-title"><strong>Mevcut Personel Listesi</strong></span>
        <asp:GridView CssClass="striped" ID="GridView1" runat="server" DataSourceID="SQLDS_Personel" AutoGenerateColumns="False" DataKeyNames="id,id1">

            <Columns>
                <asp:BoundField DataField="id" HeaderText="#" ReadOnly="True" InsertVisible="False" SortExpression="id" Visible="False"></asp:BoundField>
                <asp:BoundField DataField="tc_kimlik" HeaderText="TC Kimlik No" SortExpression="tc_kimlik"></asp:BoundField>
                <asp:BoundField DataField="adi_soyadi" HeaderText="Adı Soyadı" SortExpression="adi_soyadi"></asp:BoundField>
               <asp:BoundField DataField="telefon" HeaderText="Telefon" SortExpression="telefon"></asp:BoundField>
                <asp:BoundField DataField="email" HeaderText="E-posta" SortExpression="email"></asp:BoundField>
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

                <asp:TemplateField HeaderText="Kayıt Zamanı" SortExpression="kayit_zamani">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" TextMode="Date" Text='<%# Bind("kayit_zamani", "{0:yyyy-MM-dd}") %>' ID="TextBox1"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("kayit_zamani", "{0:dd.MM.yyyy}") %>' ID="Label2"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="ekleyen" HeaderText="Ekleyen" SortExpression="ekleyen" Visible="False"></asp:BoundField>
                <asp:TemplateField HeaderText="Per. Türü" InsertVisible="False" SortExpression="id1">
                    <EditItemTemplate>
                        <asp:DropDownList SelectedValue='<%# Bind("personel_turu") %>' ID="DdlPersonelTuru" runat="server" DataSourceID="SQLDS_PersonelTurleri" DataTextField="personel_turu" DataValueField="id"></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("personel_turu1") %>' ID="Label1"></asp:Label>
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
        <asp:HyperLink ID="BtnYeniPersonel" runat="server" CssClass="waves-effect waves-light btn right amber darken-2" NavigateUrl="~/AfetOncesi/PersonelEkle.aspx"><i class="material-icons left">control_point</i>Yeni Personel</asp:HyperLink>
       </div>
       </div>
    </div>
    </div>
</div>
</asp:Content>

