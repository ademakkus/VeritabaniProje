<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AfetzedeBilgiYonetimi.aspx.cs" Inherits="AfetSonrasi_AfetzedeBilgiYonetimi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SQLDS_Afetzede" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' DeleteCommand="DELETE FROM [AFETZEDELER] WHERE [id] = @id" InsertCommand="INSERT INTO [AFETZEDELER] ([tc_kimlik], [adi_soyadi], [durum_bilgisi], [ilgilenen]) VALUES (@tc_kimlik, @adi_soyadi, @durum_bilgisi, @ilgilenen)" SelectCommand="SELECT AFETZEDELER.id, AFETZEDELER.tc_kimlik, AFETZEDELER.adi_soyadi, AFETZEDELER.durum_bilgisi, AFETZEDELER.ilgilenen, AFAD_PERSONELI.adi_soyadi AS personel_adi_soyadi FROM AFETZEDELER INNER JOIN AFAD_PERSONELI ON AFETZEDELER.ilgilenen = AFAD_PERSONELI.id" UpdateCommand="UPDATE [AFETZEDELER] SET [tc_kimlik] = @tc_kimlik, [adi_soyadi] = @adi_soyadi, [durum_bilgisi] = @durum_bilgisi, [ilgilenen] = @ilgilenen WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="tc_kimlik" Type="Int64"></asp:Parameter>
                <asp:Parameter Name="adi_soyadi" Type="String"></asp:Parameter>
                <asp:Parameter Name="durum_bilgisi" Type="String"></asp:Parameter>
                <asp:Parameter Name="ilgilenen" Type="Int32"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="tc_kimlik" Type="Int64"></asp:Parameter>
                <asp:Parameter Name="adi_soyadi" Type="String"></asp:Parameter>
                <asp:Parameter Name="durum_bilgisi" Type="String"></asp:Parameter>
                <asp:Parameter Name="ilgilenen" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLDS_Personel" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT * FROM [AFAD_PERSONELI] WHERE ([personel_turu] = @personel_turu)">
        <SelectParameters>
            <asp:Parameter DefaultValue="3" Name="personel_turu" Type="Int32"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
<div class="col s9 m9 l9">
    <div class="card white">
    <div class="card-content">
        <span class="card-title">Psikolojik Destek Yönetimi</span>
        <asp:GridView ID="GridView1" CssClass="striped" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SQLDS_Afetzede">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="#" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
                <asp:BoundField DataField="tc_kimlik" HeaderText="TC Kimlik No" SortExpression="tc_kimlik"></asp:BoundField>
                <asp:BoundField DataField="adi_soyadi" HeaderText="Adı Soyadı" SortExpression="adi_soyadi"></asp:BoundField>
                <asp:BoundField DataField="durum_bilgisi" HeaderText="Durum Bilgisi" SortExpression="durum_bilgisi"></asp:BoundField>
                <asp:TemplateField HeaderText="İlgilenen PDR Personeli" SortExpression="ilgilenen">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SQLDS_Personel" DataTextField="adi_soyadi" DataValueField="id" SelectedValue='<%# Bind("ilgilenen") %>'></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("personel_adi_soyadi") %>' ID="Label1"></asp:Label>
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
        <asp:HyperLink ID="BtnAfetzedeEkle" runat="server" CssClass="waves-effect waves-light btn right teal" NavigateUrl="~/AfetSonrasi/AfetzedeEkle.aspx"><i class="material-icons left">control_point</i>Yeni Afetzede</asp:HyperLink>
       </div>
       </div>
</div>
</asp:Content>

