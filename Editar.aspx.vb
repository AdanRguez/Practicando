Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient


Public Class Editar
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim Usuario = Request.QueryString("Accion")
        lblmensaje.Text = Usuario
        Dim Nombre = Request.QueryString("id")
        lblid.Text = Nombre
        If Nombre = 0 Then
            Nombre = 1
        End If
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Dim query As String = "select Name, Country from Customers where CustomerId=" & Nombre

        Dim conexion As SqlConnection
        conexion = New SqlConnection(constr)
        conexion.Open()
        Dim command As New SqlCommand(query, conexion)
        Dim registro As SqlDataReader = command.ExecuteReader
        If registro.Read() = True Then
            TextBox1.Text = registro("Name")
            TextBox2.Text = registro("Country")
        End If
        conexion.Close()
    End Sub



    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Dim conexion As SqlConnection
        conexion = New SqlConnection(constr)
        conexion.Open()

        Dim nombre As String = TextBox1.Text
        Dim pais As String = TextBox2.Text
        Dim id = Request.QueryString("id")
        Dim query As String = "update Customers set Name='" & nombre & "', Country='" & pais & "' where CustomerId= " & id

        Label4.Text = "Registro actualizado, Nombre = " & nombre & "', Country='" & pais
        Dim command As New SqlCommand(query, conexion)

        command.ExecuteNonQuery()

        TextBox1.Text = ""
        TextBox2.Text = ""
        MsgBox("se modifico correctamente", MsgBoxStyle.Information, "Informacion")
     
        conexion.Close()
        ' Response.Redirect(String.Format("~/WebForm1.aspx"))



    End Sub

 
End Class