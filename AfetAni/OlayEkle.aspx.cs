using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OlayEkle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["IhbarNo"] == null)
        {
            TxtOlayZamani.Text = DateTime.Now.ToString("yyyy-MM-ddTHH:mm");
        }
        else
        {
            DataTable table = ((DataView)SQLDS_Ihbarlar.Select(System.Web.UI.DataSourceSelectArguments.Empty)).ToTable();
            DdlIlceler.SelectedValue = table.Rows[0]["ilce"].ToString();
            DdlOlayTurleri.SelectedValue = table.Rows[0]["ihbar_turu"].ToString();
            TxtOlayAdresi.Text = table.Rows[0]["ihbar_adresi"].ToString();
            TxtOlayZamani.Text = DateTime.Parse(table.Rows[0]["ihbar_zamani"].ToString()).ToString("yyyy-MM-ddTHH:mm");
        }
    }

    protected void BtnKaydet_Click(object sender, EventArgs e)
    {
        try
        {
            Parameter zaman = new Parameter("olay_zamani", System.Data.DbType.DateTime, DateTime.Parse(TxtOlayZamani.Text).ToString("yyyy-MM-dd HH:mm"));
            SQLDS_Olaylar.InsertParameters.Add(zaman);
            SQLDS_Olaylar.Insert();
            Helpers.ClearControls(Form);
            TxtOlayZamani.Text = DateTime.Now.ToString("yyyy-MM-ddTHH:mm");
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