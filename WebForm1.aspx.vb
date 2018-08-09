Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient


Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Me.BindGrid()
        End If
    End Sub

    Private Sub BindGrid()
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Dim query As String = "SELECT * FROM Customers"
        Using con As SqlConnection = New SqlConnection(constr)
            Using sda As SqlDataAdapter = New SqlDataAdapter(query, con)
                Using dt As DataTable = New DataTable()
                    sda.Fill(dt)
                    GridView1.DataSource = dt
                    GridView1.DataBind()
                End Using
            End Using
        End Using
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim name As String = TextBox2.Text
        Dim country As String = TextBox1.Text
        Dim query As String = "INSERT INTO Customers VALUES(@Name, @Country)"
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        TextBox2.Text = ""
        TextBox1.Text = ""
        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand(query)
                cmd.Parameters.AddWithValue("@Name", name)
                cmd.Parameters.AddWithValue("@Country", country)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
            End Using
        End Using
        Me.BindGrid()

    End Sub

 

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        Response.Redirect("Editar.aspx?id=" + GridView1.SelectedRow.Cells(1).Text)
        MsgBox("id " + GridView1.Rows(1).Cells(1).Text, MsgBoxStyle.Information, "informacion")

    End Sub



    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Response.Redirect(String.Format("~/Editar.aspx?Accion=" + combo.Text.ToString() + "&Nombre=" + txtNombre.Text.ToString()))


    End Sub
End Class