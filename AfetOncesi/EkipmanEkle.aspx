<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EkipmanEkle.aspx.cs" Inherits="AfetOncesi_EkipmanEkle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:SqlDataSource ID="SQLDS_Kurumlar" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT [id], [kurum_adi] FROM [KURUMLAR]"></asp:SqlDataSource>
   <asp:SqlDataSource ID="SQLDS_Motorlu_El_Aleti_Tipleri" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' SelectCommand="SELECT * FROM [Motorlu_El_Aleti_Tipleri] order by tip_adi"></asp:SqlDataSource>
    <div class="col s9 m9 l9">
        <div class="card white">
            <div class="card-content">
               <asp:Label ID="LblTitle" CssClass="card-title" runat="server" Text=""></asp:Label>
                <div class="row">
                            <div class="input-field col s6">
                                <i class="material-icons prefix">fingerprint</i>
                                <asp:TextBox ID="TxtSeriNo" ClientIDMode="Static" runat="server" CssClass="validate"></asp:TextBox>
                                <label for="TxtSeriNo">Ürün Seri Numarası</label>
                            </div>
                            <div class="input-field col s6">
                                <i class="material-icons prefix">edit</i>
                                <asp:TextBox ID="TxtUrunAdi" ClientIDMode="Static" runat="server" CssClass="validate"></asp:TextBox>
                                <label for="TxtUrunAdi">Ürün Adı</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s6">
                                <asp:DropDownList ClientIDMode="Static" ID="DdlBulunduguKurum" runat="server" DataSourceID="SQLDS_Kurumlar" DataTextField="kurum_adi" DataValueField="id"></asp:DropDownList>
                                <label>Bulunduğu Kurum</label>
                            </div>
                            <div class="input-field col s6">
                                <i class="material-icons prefix">assistant</i>
                                <asp:TextBox ID="TxtMarkasi" ClientIDMode="Static" runat="server" CssClass="validate"></asp:TextBox>
                                <label for="TxtMarkasi">Markası</label>
                            </div>
                        </div>

                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <asp:SqlDataSource ID="SQLDS_Jenerator" runat="server" InsertCommandType="StoredProcedure" ConnectionString="<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>" InsertCommand="INSERT_JENERATOR">
                            <InsertParameters>
                                <asp:ControlParameter ControlID="TxtSeriNo" Name="seri_numarasi" PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="TxtUrunAdi" Name="ekipman_adi" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="DdlBulunduguKurum" Name="bulundugu_kurum" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="TxtMarkasi" Name="markasi" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="TxtJeneratorVoltaj" Name="voltaj" PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="TxtJeneratorKapasite" Name="kapasite" PropertyName="Text" Type="Int32" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                        <div class="row">
                            <div class="input-field col s6">
                                <i class="material-icons prefix">flash_on</i>
                                <asp:TextBox  ID="TxtJeneratorVoltaj" ClientIDMode="Static" runat="server" CssClass="validate"></asp:TextBox>
                                <label for="TxtJeneratorVoltaj">Voltaj</label>
                            </div>
                            <div class="input-field col s6">
                                <i class="material-icons prefix">opacity</i>
                                <asp:TextBox  ID="TxtJeneratorKapasite" ClientIDMode="Static" runat="server" CssClass="validate"></asp:TextBox>
                                <label for="TxtJeneratorKapasite">Kapasite</label>
                            </div>
                        </div>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <asp:SqlDataSource ID="SQLDS_Cadirlar" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' InsertCommand="INSERT_CADIRLAR" InsertCommandType="StoredProcedure">
                            <InsertParameters>
                                <asp:ControlParameter ControlID="TxtSeriNo" Name="seri_numarasi" PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="TxtUrunAdi" Name="ekipman_adi" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="DdlBulunduguKurum" Name="bulundugu_kurum" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="TxtMarkasi" Name="markasi" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="TxtCadirKapasite" Name="kapasite" PropertyName="Text" Type="Int32" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                        <div class="row">
                            <div class="input-field col s6">
                                <i class="material-icons prefix">opacity</i>
                                <asp:TextBox  ID="TxtCadirKapasite" ClientIDMode="Static" runat="server" CssClass="validate"></asp:TextBox>
                                <label for="TxtCadirKapasite">Kapasite</label>
                            </div>
                        </div>
                    </asp:View>
                    <asp:View ID="View3" runat="server">
                        <asp:SqlDataSource ID="SQLDS_MotorluAlet" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' InsertCommand="INSERT_MOTORLU_EL_ALETLERI" InsertCommandType="StoredProcedure">
                            <InsertParameters>
                                <asp:ControlParameter ControlID="TxtSeriNo" Name="seri_numarasi" PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="TxtUrunAdi" Name="ekipman_adi" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="DdlBulunduguKurum" Name="bulundugu_kurum" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="TxtMarkasi" Name="markasi" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="DdlMotorluElAletTipleri" Name="tip" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="DdlGucKaynagi" Name="guc_kaynagi" PropertyName="SelectedValue" Type="String" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                        <div class="row">
                            <div class="input-field col s6">
                                <asp:DropDownList ID="DdlMotorluElAletTipleri" runat="server" DataSourceID="SQLDS_Motorlu_El_Aleti_Tipleri" DataTextField="tip_adi" DataValueField="id"></asp:DropDownList>
                                <label for="DdlMotorluElAletTipleri">Motorlu El Aleti Tipi</label>
                            </div>
                            <div class="input-field col s6">
                                <asp:DropDownList ID="DdlGucKaynagi" runat="server">
                            <asp:ListItem Value="BENZİN">BENZİN</asp:ListItem>
                            <asp:ListItem Value="MOTORİN">MOTORİN</asp:ListItem>
                            <asp:ListItem Value="FUEL-OIL">FUEL-OIL</asp:ListItem>
                            <asp:ListItem Value="ELEKTRİK">ELEKTRİK</asp:ListItem>
                        </asp:DropDownList>
                                <label for="DdlGucKaynagi">Güç Kaynağı</label>
                            </div>
                        </div>
                    </asp:View>
                    <asp:View ID="View4" runat="server">
                        <asp:SqlDataSource ID="SQLDS_SuDepolari" runat="server" ConnectionString='<%$ ConnectionStrings:AFET_YONETIMConnectionStringMSSQL %>' InsertCommand="INSERT_SU_DEPOLARI" InsertCommandType="StoredProcedure">
                            <InsertParameters>
                                <asp:ControlParameter ControlID="TxtSeriNo" Name="seri_numarasi" PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="TxtUrunAdi" Name="ekipman_adi" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="DdlBulunduguKurum" Name="bulundugu_kurum" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="TxtMarkasi" Name="markasi" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="TxtSuDeposuKapasite" Name="kapasite" PropertyName="Text" Type="Int32" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                        <div class="row">
                            <div class="input-field col s6">
                                <i class="material-icons prefix">opacity</i>
                                <asp:TextBox  ID="TxtSuDeposuKapasite" ClientIDMode="Static" runat="server" CssClass="validate"></asp:TextBox>
                                <label for="TxtSuDeposuKapasite">Kapasite</label>
                            </div>
                        </div>
                    </asp:View>
                </asp:MultiView>

                <div class="row">
                            <div class="col s12 right-align">
                                <asp:LinkButton ID="BtnKaydet" runat="server" CssClass="waves-effect waves-light btn" OnClick="BtnKaydet_Click"><i class="material-icons left">done</i>Kaydet</asp:LinkButton>
                                <asp:LinkButton ID="BtnIptal" runat="server" CssClass="waves-effect red waves-light btn" OnClick="BtnIptal_Click"><i class="material-icons left">not_interested</i>İptal</asp:LinkButton>
                            </div>
                        </div>


                        <asp:PlaceHolder ID="PlcBasarili" runat="server" Visible="false">
                            <div id="ekleme_basarili" class="modal">
                                <div class="modal-content">
                                    <h4>Başarılı</h4>
                                    <p>Kayıt başarıyla eklendi</p>
                                </div>
                                <div class="modal-footer">
                                    <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Tamam</a>
                                </div>
                                <script type="text/javascript">
                                    $('#ekleme_basarili').openModal();
                                </script>
                            </div>
                        </asp:PlaceHolder>
                        <asp:PlaceHolder ID="PlcBasarisiz" runat="server" Visible="false">
                            <div id="ekleme_basarisiz" class="modal">
                                <div class="modal-content red white-text">
                                    <h4>Hata</h4>
                                    <p>
                                        <asp:Label ID="PlcHataMesaji" runat="server" Text="Label"></asp:Label>
                                    </p>
                                </div>
                                <div class="modal-footer">
                                    <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Tamam</a>
                                </div>
                            </div>
                            <script type="text/javascript">
                                $('#ekleme_basarisiz').openModal();
                            </script>
                        </asp:PlaceHolder>

            </div>
        </div>
    </div>
</asp:Content>

