using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AfetOncesi_MotorluAracEkle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnKaydet_Click(object sender, EventArgs e)
    {
        try
        {
            SQLDS_MotorluAraclar.Insert();
            Helpers.ClearControls(Form);
            DdlTasitTuru.SelectedIndex = 0;
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