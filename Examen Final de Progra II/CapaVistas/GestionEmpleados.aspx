<%@ Page Title="Gestión de Empleados" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="GestionEmpleados.aspx.cs" Inherits="Examen_Final_de_Progra_II.CapaVistas.GestionEmpleados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Gestión de Empleados</h2>

    <!-- Visualizar lista de empleados -->
    <asp:GridView ID="gvEmpleados" runat="server" AutoGenerateColumns="False" DataKeyNames="EmpleadoID"
        OnRowDeleting="gvEmpleados_RowDeleting">
        <Columns>
            <asp:BoundField DataField="EmpleadoID" HeaderText="ID" ReadOnly="True" />
            <asp:BoundField DataField="NumeroCarnet" HeaderText="Número Carnet" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="FechaNacimiento" HeaderText="Fecha Nacimiento" />
            <asp:BoundField DataField="CategoriaNombre" HeaderText="Categoría" />
            <asp:BoundField DataField="Salario" HeaderText="Salario" />
            <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
            <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
            <asp:BoundField DataField="Correo" HeaderText="Correo" />
            <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />
        </Columns>
    </asp:GridView>

    <hr />

    <!-- Formulario para agregar empleados -->
    <h3>Agregar Empleado</h3>
    <asp:TextBox ID="txtNumeroCarnet" runat="server" Placeholder="Número Carnet"></asp:TextBox><br />
    <asp:TextBox ID="txtNombre" runat="server" Placeholder="Nombre"></asp:TextBox><br />
    <asp:TextBox ID="txtFechaNacimiento" runat="server" Placeholder="Fecha Nacimiento (YYYY-MM-DD)"></asp:TextBox><br />
    <asp:DropDownList ID="ddlCategoria" runat="server"></asp:DropDownList><br />
    <asp:TextBox ID="txtSalario" runat="server" Placeholder="Salario"></asp:TextBox><br />
    <asp:TextBox ID="txtDireccion" runat="server" Placeholder="Dirección"></asp:TextBox><br />
    <asp:TextBox ID="txtTelefono" runat="server" Placeholder="Teléfono"></asp:TextBox><br />
    <asp:TextBox ID="txtCorreo" runat="server" Placeholder="Correo"></asp:TextBox><br />
    <asp:Button ID="btnAgregar" runat="server" Text="Agregar Empleado" OnClick="btnAgregar_Click" />
</asp:Content>
