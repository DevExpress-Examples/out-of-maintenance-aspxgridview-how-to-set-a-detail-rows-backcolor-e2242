Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web.ASPxGridView

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

	End Sub
	Protected Sub ASPxGridView2_BeforePerformDataSelect(ByVal sender As Object, ByVal e As EventArgs)
		Session("CategoryID") = (CType(sender, ASPxGridView)).GetMasterRowKeyValue()
	End Sub

	Protected Sub ASPxGridView1_HtmlRowPrepared(ByVal sender As Object, ByVal e As ASPxGridViewTableRowEventArgs)
		If e.RowType = GridViewRowType.Data AndAlso e.VisibleIndex Mod 2 = 0 Then
			e.Row.BackColor = System.Drawing.Color.Azure
		End If
		If e.RowType = GridViewRowType.Detail AndAlso e.VisibleIndex Mod 2 = 0 Then
			e.Row.BackColor = System.Drawing.Color.Azure
		End If
	End Sub
End Class
