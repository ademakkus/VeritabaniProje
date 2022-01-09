<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EkipmanYonetimi.aspx.cs" Inherits="EkipmanYonetimi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SQLDS_EkipmanTurleri" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT * FROM [Ekipman_Turleri] order by ekipman_turu"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLDS_Kurumlar" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT [id], [kurum_adi] FROM [KURUMLAR]"></asp:SqlDataSource>
<div class="col s9 m9 l9" id="icerik">
    <div class="card white">
    <div class="card-content">
    <div class="row">
    <div class="col s12 m12 l12">
    <span class="card-title left"><strong>Ekipman Yönetimi</strong></span>

        <div class="row">
                    <div class="col s12 m12 l12">
        <div class="input-field col s6">
        <asp:DropDownList ID="DdlEkipmanTurleri" ClientIDMode="Static" runat="server" DataSourceID="SQLDS_EkipmanTurleri" DataTextField="ekipman_turu" DataValueField="id" OnSelectedIndexChanged="DdlEkipmanTurleri_SelectedIndexChanged" OnInit="DdlEkipmanTurleri_Init" AutoPostBack="true"></asp:DropDownList>
            <label for="DdlEkipmanTurleri">Listelemek İstediğiniz Ekipman Türünü Seçiniz:</label>
            </div> </div></div>
    </div>
    </div>


        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <div class="row">
                    <div class="col s12 m12 l12">
                        <asp:SqlDataSource ID="SQLDS_Jeneratorler" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT EKIPMAN_VE_YARDIMCI_CIHAZLAR.id, EKIPMAN_VE_YARDIMCI_CIHAZLAR.seri_numarasi, EKIPMAN_VE_YARDIMCI_CIHAZLAR.ekipman_adi, EKIPMAN_VE_YARDIMCI_CIHAZLAR.bulundugu_kurum, EKIPMAN_VE_YARDIMCI_CIHAZLAR.ekipman_turu, EKIPMAN_VE_YARDIMCI_CIHAZLAR.markasi, Jeneratorler.voltaj, Jeneratorler.kapasite, KURUMLAR.id AS kurum_id, KURUMLAR.kurum_adi FROM EKIPMAN_VE_YARDIMCI_CIHAZLAR INNER JOIN Jeneratorler ON EKIPMAN_VE_YARDIMCI_CIHAZLAR.id = Jeneratorler.id INNER JOIN KURUMLAR ON EKIPMAN_VE_YARDIMCI_CIHAZLAR.bulundugu_kurum = KURUMLAR.id" DeleteCommand="DELETE_JENERATORLER" DeleteCommandType="StoredProcedure" InsertCommand="INSERT_JENERATOR" InsertCommandType="StoredProcedure" UpdateCommand="UPDATE_JENERATOR" UpdateCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="seri_numarasi" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="ekipman_adi" Type="String"></asp:Parameter>
                        <asp:Parameter Name="bulundugu_kurum" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="markasi" Type="String"></asp:Parameter>
                        <asp:Parameter Name="voltaj" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="kapasite" Type="Int32"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="seri_numarasi" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="ekipman_adi" Type="String"></asp:Parameter>
                        <asp:Parameter Name="bulundugu_kurum" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="ekipman_turu" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="markasi" Type="String"></asp:Parameter>
                        <asp:Parameter Name="voltaj" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="kapasite" Type="Int32"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView CssClass="striped" ID="GridView6" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SQLDS_Jeneratorler">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="#" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
                        <asp:BoundField DataField="seri_numarasi" HeaderText="Seri No" SortExpression="seri_numarasi"></asp:BoundField>
                        <asp:BoundField DataField="ekipman_adi" HeaderText="Ekipman Adı" SortExpression="ekipman_adi"></asp:BoundField>
                        <asp:TemplateField HeaderText="Bulunduğu Kurum" SortExpression="bulundugu_kurum">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DdlKurumlar" runat="server" DataSourceID="SQLDS_Kurumlar" DataTextField="kurum_adi" DataValueField="id" SelectedValue='<%# Bind("bulundugu_kurum") %>'></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("kurum_adi") %>' ID="LblKurumlar"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                        <asp:BoundField DataField="markasi" HeaderText="Marka/Model" SortExpression="markasi"></asp:BoundField>
                        <asp:BoundField DataField="voltaj" HeaderText="Voltaj" SortExpression="voltaj"></asp:BoundField>
                        <asp:BoundField DataField="kapasite" HeaderText="Kapasite" SortExpression="kapasite"></asp:BoundField>
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
                </div></div>
        <div class="row">
    <div class="col s12 m12 l12">
        <asp:HyperLink ID="BtnYeniJenerator" runat="server" CssClass="waves-effect waves-light btn right light-green lighten-2" NavigateUrl="~/AfetOncesi/EkipmanEkle.aspx?EkipmanTuru=1&EkipmanTuruAdi=Jeneratör"><i class="material-icons left">control_point</i>Yeni Jeneratör</asp:HyperLink>
       </div>
       </div>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <div class="row">
                    <div class="col s12 m12 l12">
                        <asp:SqlDataSource ID="SQLDS_Cadirlar" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT EKIPMAN_VE_YARDIMCI_CIHAZLAR.id, EKIPMAN_VE_YARDIMCI_CIHAZLAR.seri_numarasi, EKIPMAN_VE_YARDIMCI_CIHAZLAR.ekipman_adi, EKIPMAN_VE_YARDIMCI_CIHAZLAR.bulundugu_kurum, EKIPMAN_VE_YARDIMCI_CIHAZLAR.ekipman_turu, EKIPMAN_VE_YARDIMCI_CIHAZLAR.markasi, Cadirlar.kapasite, KURUMLAR.id AS kurum_id, KURUMLAR.kurum_adi FROM EKIPMAN_VE_YARDIMCI_CIHAZLAR INNER JOIN Cadirlar ON EKIPMAN_VE_YARDIMCI_CIHAZLAR.id = Cadirlar.id INNER JOIN KURUMLAR ON EKIPMAN_VE_YARDIMCI_CIHAZLAR.bulundugu_kurum = KURUMLAR.id" DeleteCommand="DELETE_CADIRLAR" DeleteCommandType="StoredProcedure" InsertCommand="INSERT_CADIRLAR" InsertCommandType="StoredProcedure" UpdateCommand="UPDATE_CADIRLAR" UpdateCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="seri_numarasi" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="ekipman_adi" Type="String"></asp:Parameter>
                        <asp:Parameter Name="bulundugu_kurum" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="markasi" Type="String"></asp:Parameter>
                        <asp:Parameter Name="kapasite" Type="Int32"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="seri_numarasi" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="ekipman_adi" Type="String"></asp:Parameter>
                        <asp:Parameter Name="bulundugu_kurum" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="ekipman_turu" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="markasi" Type="String"></asp:Parameter>
                        <asp:Parameter Name="kapasite" Type="Int32"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView CssClass="striped" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SQLDS_Cadirlar">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="#" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
                        <asp:BoundField DataField="seri_numarasi" HeaderText="Seri No" SortExpression="seri_numarasi"></asp:BoundField>
                        <asp:BoundField DataField="ekipman_adi" HeaderText="Ekipman Adı" SortExpression="ekipman_adi"></asp:BoundField>
                        <asp:TemplateField HeaderText="Bulunduğu Kurum" SortExpression="bulundugu_kurum">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DdlKurumlar" runat="server" DataSourceID="SQLDS_Kurumlar" DataTextField="kurum_adi" DataValueField="id" SelectedValue='<%# Bind("bulundugu_kurum") %>'></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("kurum_adi") %>' ID="LblKurumlar"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                        <asp:BoundField DataField="markasi" HeaderText="Marka/Model" SortExpression="markasi"></asp:BoundField>
                        <asp:BoundField DataField="kapasite" HeaderText="Kapasite" SortExpression="kapasite"></asp:BoundField>
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
                </div></div>
                <div class="row">
    <div class="col s12 m12 l12">
        <asp:HyperLink ID="BtnYeniCadir" runat="server" CssClass="waves-effect waves-light btn right light-green lighten-2" NavigateUrl="~/AfetOncesi/EkipmanEkle.aspx?EkipmanTuru=2&EkipmanTuruAdi=Çadır"><i class="material-icons left">control_point</i>Yeni Çadır Ekle</asp:HyperLink>
       </div>
       </div>
            </asp:View>
            <asp:View ID="View3" runat="server">
               <div class="row">
                    <div class="col s12 m12 l12">
                        <asp:SqlDataSource ID="SQLDS_Motorlu_El_Aletleri" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT EKIPMAN_VE_YARDIMCI_CIHAZLAR.id, EKIPMAN_VE_YARDIMCI_CIHAZLAR.seri_numarasi, EKIPMAN_VE_YARDIMCI_CIHAZLAR.ekipman_adi, EKIPMAN_VE_YARDIMCI_CIHAZLAR.bulundugu_kurum, EKIPMAN_VE_YARDIMCI_CIHAZLAR.ekipman_turu, EKIPMAN_VE_YARDIMCI_CIHAZLAR.markasi, KURUMLAR.id AS kurum_id, KURUMLAR.kurum_adi, Motorlu_El_Aletleri.tip, Motorlu_El_Aletleri.guc_kaynagi, Motorlu_El_Aleti_Tipleri.tip_adi FROM EKIPMAN_VE_YARDIMCI_CIHAZLAR INNER JOIN Motorlu_El_Aletleri ON EKIPMAN_VE_YARDIMCI_CIHAZLAR.id = Motorlu_El_Aletleri.id INNER JOIN KURUMLAR ON EKIPMAN_VE_YARDIMCI_CIHAZLAR.bulundugu_kurum = KURUMLAR.id INNER JOIN Motorlu_El_Aleti_Tipleri ON Motorlu_El_Aletleri.tip = Motorlu_El_Aleti_Tipleri.id" DeleteCommand="DELETE_MOTORLU_EL_ALETLERI" DeleteCommandType="StoredProcedure" InsertCommand="INSERT_MOTORLU_EL_ALETLERI" InsertCommandType="StoredProcedure" UpdateCommand="UPDATE_MOTORLU_EL_ALETLERI" UpdateCommandType="StoredProcedure">
                            <DeleteParameters>
                                <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="seri_numarasi" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="ekipman_adi" Type="String"></asp:Parameter>
                                <asp:Parameter Name="bulundugu_kurum" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="markasi" Type="String"></asp:Parameter>
                                <asp:Parameter Name="tip" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="guc_kaynagi" Type="String"></asp:Parameter>
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="seri_numarasi" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="ekipman_adi" Type="String"></asp:Parameter>
                                <asp:Parameter Name="bulundugu_kurum" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="ekipman_turu" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="markasi" Type="String"></asp:Parameter>
                                <asp:Parameter Name="tip" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="guc_kaynagi" Type="String"></asp:Parameter>
                            </UpdateParameters>
                </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SQLDS_Motorlu_El_Aleti_Tipleri" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT * FROM [Motorlu_El_Aleti_Tipleri] order by tip_adi"></asp:SqlDataSource>
                <asp:GridView CssClass="striped" ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SQLDS_Motorlu_El_Aletleri">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="#" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
                        <asp:BoundField DataField="seri_numarasi" HeaderText="Seri No" SortExpression="seri_numarasi"></asp:BoundField>
                        <asp:BoundField DataField="ekipman_adi" HeaderText="Ekipman Adı" SortExpression="ekipman_adi"></asp:BoundField>
                        <asp:TemplateField HeaderText="Bulunduğu Kurum" SortExpression="bulundugu_kurum">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DdlKurumlar" runat="server" DataSourceID="SQLDS_Kurumlar" DataTextField="kurum_adi" DataValueField="id" SelectedValue='<%# Bind("bulundugu_kurum") %>'></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("kurum_adi") %>' ID="LblKurumlar"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                        <asp:BoundField DataField="markasi" HeaderText="Marka/Model" SortExpression="markasi"></asp:BoundField>
                        <asp:TemplateField HeaderText="Ekipman Türü" SortExpression="ekipman_turu">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DdlMotorluElAletTipleri" runat="server" DataSourceID="SQLDS_Motorlu_El_Aleti_Tipleri" DataTextField="tip_adi" DataValueField="id" SelectedValue='<%# Bind("tip") %>'></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("tip_adi") %>' ID="LblMotorluElAletTipleri"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                        <asp:TemplateField HeaderText="Güç Kaynağı" SortExpression="guc_kaynagi">
                    <EditItemTemplate>
                        <asp:DropDownList SelectedValue='<%# Bind("guc_kaynagi") %>' ID="DdlGucKaynagi" runat="server">
                            <asp:ListItem Value="BENZİN">BENZİN</asp:ListItem>
                            <asp:ListItem Value="MOTORİN">MOTORİN</asp:ListItem>
                            <asp:ListItem Value="FUEL-OIL">FUEL-OIL</asp:ListItem>
                            <asp:ListItem Value="ELEKTRİK">ELEKTRİK</asp:ListItem>
                        </asp:DropDownList>
                   
                        </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("guc_kaynagi") %>' ID="LblGucKaynagi"></asp:Label>
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
                </div></div>
                <div class="row">
    <div class="col s12 m12 l12">
        <asp:HyperLink ID="BtnYeniAlet" runat="server" CssClass="waves-effect waves-light btn right light-green lighten-2" NavigateUrl="~/AfetOncesi/EkipmanEkle.aspx?EkipmanTuru=3&EkipmanTuruAdi=Motorlu%20El%20Aleti"><i class="material-icons left">control_point</i>Yeni Alet Ekle</asp:HyperLink>
       </div>
       </div>
            </asp:View>
            <asp:View ID="View4" runat="server">
                <div class="row">
                    <div class="col s12 m12 l12">
                        <asp:SqlDataSource ID="SQLDS_Su_Depolari" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT EKIPMAN_VE_YARDIMCI_CIHAZLAR.id, EKIPMAN_VE_YARDIMCI_CIHAZLAR.seri_numarasi, EKIPMAN_VE_YARDIMCI_CIHAZLAR.ekipman_adi, EKIPMAN_VE_YARDIMCI_CIHAZLAR.bulundugu_kurum, EKIPMAN_VE_YARDIMCI_CIHAZLAR.ekipman_turu, EKIPMAN_VE_YARDIMCI_CIHAZLAR.markasi, Su_Depolari.kapasite, KURUMLAR.id AS kurum_id, KURUMLAR.kurum_adi FROM EKIPMAN_VE_YARDIMCI_CIHAZLAR INNER JOIN Su_Depolari ON EKIPMAN_VE_YARDIMCI_CIHAZLAR.id = Su_Depolari.id INNER JOIN KURUMLAR ON EKIPMAN_VE_YARDIMCI_CIHAZLAR.bulundugu_kurum = KURUMLAR.id" DeleteCommand="DELETE_SU_DEPOLARI" DeleteCommandType="StoredProcedure" InsertCommand="INSERT_SU_DEPOLARI" InsertCommandType="StoredProcedure" UpdateCommand="UPDATE_SU_DEPOLARI" UpdateCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="seri_numarasi" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="ekipman_adi" Type="String"></asp:Parameter>
                        <asp:Parameter Name="bulundugu_kurum" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="markasi" Type="String"></asp:Parameter>
                        <asp:Parameter Name="kapasite" Type="Int32"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="seri_numarasi" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="ekipman_adi" Type="String"></asp:Parameter>
                        <asp:Parameter Name="bulundugu_kurum" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="ekipman_turu" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="markasi" Type="String"></asp:Parameter>
                        <asp:Parameter Name="kapasite" Type="Int32"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView CssClass="striped" ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SQLDS_Su_Depolari">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="#" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
                        <asp:BoundField DataField="seri_numarasi" HeaderText="Seri No" SortExpression="seri_numarasi"></asp:BoundField>
                        <asp:BoundField DataField="ekipman_adi" HeaderText="Ekipman Adı" SortExpression="ekipman_adi"></asp:BoundField>
                        <asp:TemplateField HeaderText="Bulunduğu Kurum" SortExpression="bulundugu_kurum">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DdlKurumlar" runat="server" DataSourceID="SQLDS_Kurumlar" DataTextField="kurum_adi" DataValueField="id" SelectedValue='<%# Bind("bulundugu_kurum") %>'></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("kurum_adi") %>' ID="LblKurumlar"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                        <asp:BoundField DataField="markasi" HeaderText="Marka/Model" SortExpression="markasi"></asp:BoundField>
                        <asp:BoundField DataField="kapasite" HeaderText="Kapasite" SortExpression="kapasite"></asp:BoundField>
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
                </div></div>
                <div class="row">
    <div class="col s12 m12 l12">
        <asp:HyperLink ID="BtnSuDeposuEkle" runat="server" CssClass="waves-effect waves-light btn right light-green lighten-2" NavigateUrl="~/AfetOncesi/EkipmanEkle.aspx?EkipmanTuru=4&EkipmanTuruAdi=Su%20Deposu"><i class="material-icons left">control_point</i>Yeni Su Deposu Ekle</asp:HyperLink>
       </div>
       </div>
            </asp:View>
        </asp:MultiView>
       </div>
       </div>
    </div>
</asp:Content>

