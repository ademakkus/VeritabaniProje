using System;

public partial class OlayYonetimi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("~/AfetAni/OlayEkle.aspx?IhbarNo=" + GridView2.SelectedRow.Cells[1].Text);
    }

    protected void GridView1_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        /*if (e.CommandName == "Cancel" || e.CommandName == "Update")
        {
            Response.Redirect(Request.RawUrl);
        }*/
    }
}