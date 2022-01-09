using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BarinmaKaynakYonetimi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        /*if(e.CommandName == "Cancel" || e.CommandName == "Update")
        {
            Response.Redirect(Request.RawUrl);
        }*/
    }
}