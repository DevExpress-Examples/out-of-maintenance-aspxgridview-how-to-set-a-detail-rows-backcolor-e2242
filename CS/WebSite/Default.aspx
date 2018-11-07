<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
   
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:aspxgridview ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="dsMaster" KeyFieldName="CategoryID" 
            onhtmlrowprepared="ASPxGridView1_HtmlRowPrepared">
            <templates>
                <detailrow>
                    <dx:aspxgridview ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" 
                          DataSourceID="dsDetail" KeyFieldName="ProductID" 
                        onbeforeperformdataselect="ASPxGridView2_BeforePerformDataSelect">
                          <columns>
                             
                              <dx:gridviewdatatextcolumn FieldName="ProductID"
                                 VisibleIndex="1">
                              </dx:gridviewdatatextcolumn>
                              <dx:gridviewdatatextcolumn FieldName="ProductName" VisibleIndex="2">
                              </dx:gridviewdatatextcolumn>
                              <dx:gridviewdatatextcolumn FieldName="UnitPrice" VisibleIndex="3">
                              </dx:gridviewdatatextcolumn>
                          </columns>
                     </dx:aspxgridview>
                </detailrow>
            </templates>
            <columns>
                <dx:gridviewdatatextcolumn FieldName="CategoryID" ReadOnly="True" 
                    VisibleIndex="0">
                    <editformsettings Visible="False" />
                </dx:gridviewdatatextcolumn>
                <dx:gridviewdatatextcolumn FieldName="CategoryName" VisibleIndex="1">
                    <propertiestextedit DisplayFormatString="{0}">
                    </propertiestextedit>
                    
                </dx:gridviewdatatextcolumn>
                <dx:gridviewdatatextcolumn FieldName="Description" VisibleIndex="2">
                </dx:gridviewdatatextcolumn>
            </columns>
            <settingsdetail ShowDetailRow="True" />
        </dx:aspxgridview>
    </div>
    <asp:accessdatasource ID="dsMaster" runat="server" 
        DataFile="~/App_Data/nwind.mdb" SelectCommand="SELECT * FROM [Categories]">
    </asp:accessdatasource>
    <asp:accessdatasource ID="dsDetail" runat="server" 
        DataFile="~/App_Data/nwind.mdb" 
        SelectCommand="SELECT [ProductID], [ProductName], [CategoryID], [UnitPrice] FROM [Products] WHERE ([CategoryID] = ?)">
        <selectparameters>
            <asp:sessionparameter Name="CategoryID" SessionField="CategoryID" 
                Type="Int32" />
        </selectparameters>
    </asp:accessdatasource>
    </form>
</body>
</html>

