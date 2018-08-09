<%@ Page Language="vb"  MasterPageFile="~/Site1.master"  AutoEventWireup="false" CodeBehind="WebForm1.aspx.vb" Inherits="WebApplication1.WebForm1" %>

<asp:Content ID="Bodycontent" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="content" >
      <Label>Enter a Name:</Label>
      <asp:TextBox>
        <TextBox.Text>
          <Binding Source="{StaticResource myDataSource}" Path="Name"
                   UpdateSourceTrigger="PropertyChanged"/>
        </TextBox.Text>
      </asp:TextBox>

      <Label>The name you entered:</Label>
      <asp:TextBlock Text="{Binding Source={StaticResource myDataSource}, Path=Name}"/>


        <asp:DropDownList ID="combo" runat="server">
	        <asp:ListItem>Saludar</asp:ListItem>
	        <asp:ListItem>Despedir</asp:ListItem>
          </asp:DropDownList>   
 
        <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
 
        <asp:Button ID="Button2" runat="server" Text="Probar GET" />
    
 
        <br />
    
 
        <br />
    
 
        <p>
            <asp:Label ID="Label1" runat="server" Text="Nombre: "></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Country: "></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </p>
            <asp:Button ID="Button1" runat="server" Text="Agregar" />
            <div>
               <div ></div>
              <div id="dvGrid" style="padding: 10px; width: 450px; text-align:center">
    
                    <asp:GridView ID="GridView1"  runat="server" CellPadding="4"  ForeColor="#333333" GridLines="None" autogenerateselectbutton="True"> 
                        <AlternatingRowStyle BackColor="White" />
                    
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                     
                    </asp:GridView>
              </div>
        
            </div>
      </div>
 
</asp:Content>
