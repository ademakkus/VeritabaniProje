using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        if (Session["user_tckimlik"] != null)
        {
            Response.Redirect("~/Default.aspx");
        }
    }

    protected void BtnGirisYap_Click(object sender, EventArgs e)
    {
        DataView dv = (DataView)SQLDS_Login.Select(DataSourceSelectArguments.Empty);

        if (dv.Table.Rows.Count > 0)
        {
            if (dv.Table.Rows[0][1].ToString() == TxtTcKimlik.Text)
            {
                Session["user_tckimlik"] = dv.Table.Rows[0][1].ToString();
                Session["user_id"] = dv.Table.Rows[0][0].ToString();
                Session["user_adisoyadi"] = dv.Table.Rows[0][2].ToString();
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}