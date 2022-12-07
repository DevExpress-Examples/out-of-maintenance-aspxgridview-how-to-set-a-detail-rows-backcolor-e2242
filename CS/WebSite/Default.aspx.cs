using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ASPxGridView2_BeforePerformDataSelect(object sender, EventArgs e)
    {
        Session["CategoryID"] = ((ASPxGridView)sender).GetMasterRowKeyValue();
    }

    protected void ASPxGridView1_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
    {
        if (e.RowType == GridViewRowType.Data && e.VisibleIndex % 2 == 0)
        {
            e.Row.BackColor = System.Drawing.Color.Azure;
        }
        if (e.RowType == GridViewRowType.Detail && e.VisibleIndex % 2 == 0)
        {
            e.Row.BackColor = System.Drawing.Color.Azure;
        }
    }
}
