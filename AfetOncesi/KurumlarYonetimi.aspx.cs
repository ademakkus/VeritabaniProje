using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PartneKurumlarYonetimi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GrdKurumTemsilcileri_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        HyperLinkKurumlar.CssClass = "";
        HyperLinkTemsilciler.CssClass = "active";
    }

    protected void GrdKurumlar_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        HyperLinkTemsilciler.CssClass = "";
        HyperLinkKurumlar.CssClass = "active";
    }
}