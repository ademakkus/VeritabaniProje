using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AfetOncesi_EkipmanEkle : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        string tur = Request.QueryString["EkipmanTuru"];
        string title = Request.QueryString["EkipmanTuruAdi"];

        if (tur == "" || tur == null || title == "" || title == null)
        {
            Response.Redirect("EkipmanEkle.aspx?EkipmanTuru=1&EkipmanTuruAdi=Jeneratör");
        }
        else
        {
            LblTitle.Text = "Yeni " + title + " Ekle";
            MultiView1.SetActiveView(MultiView1.FindControl("View" + tur) as View);
        }
    }

    protected void BtnKaydet_Click(object sender, EventArgs e)
    {
        try {
            View a = MultiView1.GetActiveView();
            foreach (Control x in a.Controls)
            {
                if (x is SqlDataSource)
                {
                    if((x as SqlDataSource).InsertParameters.Count > 0)
                    {
                        (x as SqlDataSource).Insert(); break;
                    }
                }
            }
            Helpers.ClearControls(Form);
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

    protected void BtnIptal_Click(object sender, EventArgs e)
    {
        string tur = Request.QueryString["EkipmanTuru"];
        Response.Redirect("EkipmanYonetimi.aspx?EkipmanTuru=" + tur);
    }
}