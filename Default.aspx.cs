using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataView dv1 = (DataView)SQLDS_OlaySayisi.Select(DataSourceSelectArguments.Empty);
        LblOlaySayisi.Text = dv1[0][0].ToString();

        DataView dv2 = (DataView)SQLDS_KurumSayisi.Select(DataSourceSelectArguments.Empty);
        LblKurumSayisi.Text = dv2[0][0].ToString();

        DataView dv3 = (DataView)SQLDS_Ihbarlar.Select(DataSourceSelectArguments.Empty);
        LblIhbarlar.Text = dv3[0][0].ToString();
    }
}