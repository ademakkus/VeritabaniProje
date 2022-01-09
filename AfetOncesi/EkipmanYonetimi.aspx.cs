using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EkipmanYonetimi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string tur = Request.QueryString["EkipmanTuru"];

        if (tur == "" || tur == null)
        {
            Response.Redirect("EkipmanYonetimi.aspx?EkipmanTuru=1");
        }
        else
        {
            MultiView1.SetActiveView(MultiView1.FindControl("View" + tur) as View);
        }
    }

    protected void DdlEkipmanTurleri_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("EkipmanYonetimi.aspx?EkipmanTuru=" + DdlEkipmanTurleri.SelectedValue);
    }

    protected void DdlEkipmanTurleri_Init(object sender, EventArgs e)
    {
        DdlEkipmanTurleri.SelectedValue = Request.QueryString["EkipmanTuru"];
    }
}