<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="IhbarYonetimi.aspx.cs" Inherits="AfetAni_IhbarYonetimi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:SqlDataSource ID="SQLDS_Ihbarlar" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' DeleteCommand="DELETE FROM [IHBARLAR] WHERE [id] = @id" SelectCommand="SELECT IHBARLAR.id, IHBARLAR.ihbar_eden_telefon, IHBARLAR.ihbar_adresi, IHBARLAR.ihbar_eden_adi_soyadi, IHBARLAR.ihbar_zamani, IHBARLAR.ihbari_alan, IHBARLAR.ihbar_turu, IHBARLAR.ilce, IHBARLAR.aciklama, ILCELER.ilce_adi, VHKI_PERSONELI.adi_soyadi, Olay_Turleri.ihbar_turu_adi FROM IHBARLAR INNER JOIN ILCELER ON IHBARLAR.ilce = ILCELER.id INNER JOIN VHKI_PERSONELI ON IHBARLAR.ihbari_alan = VHKI_PERSONELI.id INNER JOIN Olay_Turleri ON IHBARLAR.ihbar_turu = Olay_Turleri.id" UpdateCommand="UPDATE [IHBARLAR] SET [ihbar_eden_telefon] = @ihbar_eden_telefon, [ihbar_adresi] = @ihbar_adresi, [ihbar_eden_adi_soyadi] = @ihbar_eden_adi_soyadi, [ihbar_zamani] = @ihbar_zamani, [ihbari_alan] = @ihbari_alan, [ihbar_turu] = @ihbar_turu, [ilce] = @ilce, [aciklama] = @aciklama WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="ihbar_eden_telefon" Type="String"></asp:Parameter>
            <asp:Parameter Name="ihbar_adresi" Type="String"></asp:Parameter>
            <asp:Parameter Name="ihbar_eden_adi_soyadi" Type="String"></asp:Parameter>
            <asp:Parameter Name="ihbar_zamani" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="ihbari_alan" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="ihbar_turu" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="ilce" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="aciklama" Type="String"></asp:Parameter>
            <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLDS_Ilceler" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT * FROM [ILCELER]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLDS_OlayTurleri" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT * FROM [Olay_Turleri]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLDS_Vhki" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT [id], [adi_soyadi] FROM [VHKI_PERSONELI]"></asp:SqlDataSource>
    <div class="col s9 m9 l9" id="icerik">
        <div class="card white">
            <div class="card-content">
                <div class="row">
                    <div class="col s12 m12 l12">
                        <span class="card-title"><strong>İhbar Yönetimi</strong></span>
                        <asp:GridView ID="GridView1" CssClass="striped" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SQLDS_Ihbarlar" OnRowCommand="GridView1_RowCommand">

                            <Columns>
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
                                <asp:BoundField DataField="ihbar_eden_telefon" HeaderText="İhbar Eden Telefon" SortExpression="ihbar_eden_telefon"></asp:BoundField>
                                <asp:BoundField DataField="ihbar_adresi" HeaderText="İhbar Adresi" SortExpression="ihbar_adresi"></asp:BoundField>
                                <asp:TemplateField HeaderText="İlçe" SortExpression="ilce">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DdlIlceler" runat="server" DataSourceID="SQLDS_Ilceler" DataTextField="ilce_adi" DataValueField="id" SelectedValue='<%# Bind("ilce") %>'></asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Bind("ilce_adi") %>' ID="Label1"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="İhbar Zamanı" SortExpression="ihbar_zamani">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%# Bind("ihbar_zamani", "{0:yyyy-MM-ddTHH:mm}") %>' ID="TextBox3" TextMode="DateTimeLocal"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Bind("ihbar_zamani", "{0:dd.MM.yyyy HH:mm}") %>' ID="Label4"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="İhbarı Alan" SortExpression="ihbari_alan">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DdlVhki" runat="server" DataSourceID="SQLDS_Vhki" DataTextField="adi_soyadi" DataValueField="id" SelectedValue='<%# Bind("ihbari_alan") %>'></asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Bind("adi_soyadi") %>' ID="Label2"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:BoundField DataField="aciklama" HeaderText="Açıklama" SortExpression="aciklama"></asp:BoundField>
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
                        <asp:HyperLink ID="BtnYeniIhbar" runat="server" CssClass="waves-effect waves-light btn right amber darken-2" NavigateUrl="~/AfetAni/IhbarEkle.aspx"><i class="material-icons left">control_point</i>Yeni İhbar</asp:HyperLink>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

