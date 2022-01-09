<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:SqlDataSource ID="SQLDS_OlaySayisi" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT COUNT(*) FROM OLAYLAR"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLDS_KurumSayisi" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT COUNT(*) FROM KURUMLAR"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLDS_PersonelKaynagi" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT Personel_Turleri.personel_turu AS personel_turu_adi, COUNT(*) AS sayi FROM AFAD_PERSONELI INNER JOIN Personel_Turleri ON AFAD_PERSONELI.personel_turu = Personel_Turleri.id GROUP BY Personel_Turleri.personel_turu, AFAD_PERSONELI.personel_turu"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLDS_Ihbarlar" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT COUNT(*) FROM IHBARLAR"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLDS_MotorluAraclar" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT Tasit_Turleri.tasit_turu_adi, COUNT(*) AS sayi FROM MOTORLU_ARACLAR INNER JOIN Tasit_Turleri ON MOTORLU_ARACLAR.tasit_turu = Tasit_Turleri.id GROUP BY MOTORLU_ARACLAR.tasit_turu, Tasit_Turleri.tasit_turu_adi"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLDS_Ekipmanlar" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT Ekipman_Turleri.ekipman_turu AS ekipman_turu_adi, COUNT(*) AS sayi FROM EKIPMAN_VE_YARDIMCI_CIHAZLAR INNER JOIN Ekipman_Turleri ON EKIPMAN_VE_YARDIMCI_CIHAZLAR.ekipman_turu = Ekipman_Turleri.id GROUP BY EKIPMAN_VE_YARDIMCI_CIHAZLAR.ekipman_turu, Ekipman_Turleri.ekipman_turu"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLDS_Kurumlar" runat="server"></asp:SqlDataSource>
    <div class="col s9 m9 l9">
        <div class="row">
            <div class="col s4">
                <div class="card white">
                    <div class="card-content">
                        <span class="card-title"><i class="material-icons">warning</i><strong> OLAYLAR</strong></span>
                        <p>Şu an sistemde kayıtlı <strong>
                            <asp:Label ID="LblOlaySayisi" runat="server" Text="0"></asp:Label></strong> adet olay bulunmaktadır.</p>
                    </div>
                </div>
            </div>
            <div class="col s4">
                <div class="card white">
                    <div class="card-content">
                        <span class="card-title"><i class="material-icons">call</i><strong> İHBARLAR</strong></span>
                        <p>Şu an sistemde kayıtlı <strong>
                            <asp:Label ID="LblIhbarlar" runat="server" Text="0"></asp:Label></strong> adet ihbar bulunmaktadır.</p>
                    </div>
                </div>
            </div>
            <div class="col s4">
                <div class="card white">
                    <div class="card-content">
                        <span class="card-title"><i class="material-icons">business</i><strong> PARTNER KURUMLAR</strong></span>
                        <p>Şu an sistemde kayıtlı <strong><asp:Label ID="LblKurumSayisi" runat="server" Text="0"></asp:Label></strong> adet partner kurum bulunmaktadır.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col s4">
                <div class="card white">
                    <div class="card-content">
                        <span class="card-title"><i class="material-icons">local_shipping</i><strong> MOTORLU ARAÇLAR</strong></span>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SQLDS_MotorluAraclar" ShowHeader="false">
                            <Columns>
                                <asp:BoundField DataField="tasit_turu_adi" HeaderText="tasit_turu_adi" SortExpression="tasit_turu_adi"></asp:BoundField>
                                <asp:BoundField DataField="sayi" HeaderText="sayi" ReadOnly="True" SortExpression="sayi" ItemStyle-CssClass="kalin"></asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <div class="col s4">
                <div class="card white">
                    <div class="card-content">
                        <span class="card-title"><i class="material-icons">build</i><strong> EKİPMANLAR</strong></span>
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SQLDS_Ekipmanlar" ShowHeader="false">
                            <Columns>
                                <asp:BoundField DataField="ekipman_turu_adi" HeaderText="ekipman_turu_adi" SortExpression="ekipman_turu_adi"></asp:BoundField>
                                <asp:BoundField DataField="sayi" HeaderText="sayi" ReadOnly="True" SortExpression="sayi" ItemStyle-CssClass="kalin"></asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <div class="col s4">
                <div class="card white">
                    <div class="card-content">
                        <span class="card-title"><i class="material-icons">people</i><strong> PERSONEL SAYILARI</strong></span>
                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SQLDS_PersonelKaynagi" ShowHeader="false">
                            <Columns>
                                <asp:BoundField DataField="personel_turu_adi" HeaderText="personel_turu_adi" SortExpression="personel_turu_adi"></asp:BoundField>
                                <asp:BoundField DataField="sayi" HeaderText="sayi" ReadOnly="True" SortExpression="sayi" ItemStyle-CssClass="kalin"></asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

