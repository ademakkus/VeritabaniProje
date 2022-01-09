<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MotorluAraclarYonetimi.aspx.cs" Inherits="MotorluAraclarYonetimi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SQLDS_MotorluAraclar" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>'
        SelectCommand="SELECT MOTORLU_ARACLAR.*, Tasit_Turleri.tasit_turu_adi FROM MOTORLU_ARACLAR INNER JOIN Tasit_Turleri ON MOTORLU_ARACLAR.tasit_turu = Tasit_Turleri.id"
        DeleteCommand="DELETE FROM [MOTORLU_ARACLAR] WHERE [id] = @id"
        UpdateCommand="UPDATE [MOTORLU_ARACLAR] SET [sorumlu_tc_no] = @sorumlu_tc_no, [sorumlu_adi_soyadi] = @sorumlu_adi_soyadi, [sorumlu_telefon] = @sorumlu_telefon, [tasit_turu] = @tasit_turu, [yolcu_kapasitesi] = @yolcu_kapasitesi, [plaka] = @plaka WHERE [id] = @id" InsertCommand="INSERT INTO [MOTORLU_ARACLAR] ([sorumlu_tc_no], [sorumlu_adi_soyadi], [sorumlu_telefon], [tasit_turu], [yolcu_kapasitesi], [plaka]) VALUES (@sorumlu_tc_no, @sorumlu_adi_soyadi, @sorumlu_telefon, @tasit_turu, @yolcu_kapasitesi, @plaka)">

        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="sorumlu_tc_no" Type="Int64"></asp:Parameter>
            <asp:Parameter Name="sorumlu_adi_soyadi" Type="String"></asp:Parameter>
            <asp:Parameter Name="sorumlu_telefon" Type="String"></asp:Parameter>
            <asp:Parameter Name="tasit_turu" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="yolcu_kapasitesi" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="plaka" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="sorumlu_tc_no" Type="Int64"></asp:Parameter>
            <asp:Parameter Name="sorumlu_adi_soyadi" Type="String"></asp:Parameter>
            <asp:Parameter Name="sorumlu_telefon" Type="String"></asp:Parameter>
            <asp:Parameter Name="tasit_turu" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="yolcu_kapasitesi" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="plaka" Type="String"></asp:Parameter>
            <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLDS_TasitTurleri" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT * FROM [Tasit_Turleri] ORDER BY tasit_turu_adi"></asp:SqlDataSource>
<div class="col s9 m9 l9" id="icerik">
    <div class="card white">
    <div class="card-content">
    <div class="row">
    <div class="col s12 m12 l12">
    <span class="card-title"><strong>Motorlu Araçlar Yönetimi</strong></span>
        <asp:GridView CssClass="striped" ID="GridView1" runat="server" DataSourceID="SQLDS_MotorluAraclar" AutoGenerateColumns="False" DataKeyNames="id">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="#" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
                 <asp:TemplateField HeaderText="Taşıt Türü" InsertVisible="False" SortExpression="tasit_turu">
                    <EditItemTemplate>
                        <asp:DropDownList SelectedValue='<%# Bind("tasit_turu") %>' ID="DdlMotorluAracTuru" runat="server" DataSourceID="SQLDS_TasitTurleri" DataTextField="tasit_turu_adi" DataValueField="id"></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("tasit_turu_adi") %>' ID="Label1"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="plaka" HeaderText="Plaka" SortExpression="plaka"></asp:BoundField>
                <asp:BoundField DataField="sorumlu_tc_no" HeaderText="Sorumlu TC No" SortExpression="sorumlu_tc_no"></asp:BoundField>
                <asp:BoundField DataField="sorumlu_adi_soyadi" HeaderText="Sorumlu Adı Soyadı" SortExpression="sorumlu_adi_soyadi"></asp:BoundField>
                <asp:BoundField DataField="sorumlu_telefon" HeaderText="Sorumlu Telefon" SortExpression="sorumlu_telefon"></asp:BoundField>
                <asp:BoundField DataField="yolcu_kapasitesi" HeaderText="Yolcu Kapasitesi" SortExpression="yolcu_kapasitesi"></asp:BoundField>
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
        <asp:HyperLink ID="BtnYeniMotorluArac" runat="server" CssClass="waves-effect waves-light btn right amber darken-2" NavigateUrl="~/AfetOncesi/MotorluAracEkle.aspx"><i class="material-icons left">control_point</i>Yeni Motorlu Araç</asp:HyperLink>
       </div>
       </div>
    </div>
    </div>
</div>
</asp:Content>

