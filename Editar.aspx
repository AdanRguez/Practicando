<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="Editar.aspx.vb" Inherits="WebApplication1.Editar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="content" >
        <asp:Label ID="Label1" runat="server" Text="Editar Personas"></asp:Label>
        &nbsp;&nbsp;
        <asp:Label ID="lblmensaje" runat="server"></asp:Label>
        <asp:Label ID="lblid" runat="server"></asp:Label>
        <br />
        <br />
    &nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="Nombre"></asp:Label>
    &nbsp;<asp:TextBox ID="TextBox1" runat="server" style="margin-bottom: 0px"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;
        <br />
    &nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label3" runat="server" Text="Country"></asp:Label>
    &nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label4" runat="server"></asp:Label>
        <br />
        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1">
            <EditItemTemplate>
                Name:
                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                Country:
                <asp:TextBox ID="CountryTextBox" runat="server" Text='<%# Bind("Country") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                Name:
                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                Country:
                <asp:TextBox ID="CountryTextBox" runat="server" Text='<%# Bind("Country") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                Name:
                <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                Country:
                <asp:Label ID="CountryLabel" runat="server" Text='<%# Bind("Country") %>' />
                <br />

            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:PersonalConnectionString2 %>" 
            SelectCommand="SELECT [Name], [Country] FROM [Customers] WHERE ([CustomerId] = @CustomerId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblid" DefaultValue="0" Name="CustomerId" 
                    PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Button ID="Button1" runat="server" Text="guardar" />
    </div>
</asp:Content>

