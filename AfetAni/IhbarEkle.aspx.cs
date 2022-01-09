using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AfetAni_IhbarEkle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        TxtIhbarZamani.Text = DateTime.Now.ToString("yyyy-MM-ddTHH:mm");
    }

    protected void BtnKaydet_Click(object sender, EventArgs e)
    {
        try
        {
            Parameter zaman = new Parameter("ihbar_zamani", System.Data.DbType.DateTime, DateTime.Parse(TxtIhbarZamani.Text).ToString("yyyy-MM-dd HH:mm"));
            SQLDS_Ihbarlar.InsertParameters.Add(zaman);
            SQLDS_Ihbarlar.Insert();
            Helpers.ClearControls(Form);
            TxtIhbarZamani.Text = DateTime.Now.ToString("yyyy-MM-ddTHH:mm");
            DdlIlceler.SelectedIndex = 0;
            DdlOlayTurleri.SelectedIndex = 0;
            PlcBasarisiz.Visible = false;
            PlcBasarili.Visible = true;
        }
        catch (Exception ex)
        {
            PlcBasarili.Visible = false;
            PlcHataMesaji.Text = ex.Message;
            PlcBasarisiz.Visible = true;
        }
    }
}