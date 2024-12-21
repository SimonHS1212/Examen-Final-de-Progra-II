<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="Examen_Final_de_Progra_II.CapaVistas.Main" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8" />
    <title>Sistema de Gestión de Proyectos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        header {
            text-align: center;
            margin-bottom: 30px;
        }
        nav ul {
            list-style: none;
            padding: 0;
            text-align: center;
        }
        nav ul li {
            display: inline-block;
            margin: 0 15px;
        }
        nav ul li a {
            text-decoration: none;
            color: #007BFF;
            font-size: 18px;
        }
        nav ul li a:hover {
            text-decoration: underline;
        }
        main {
            text-align: center;
        }
    </style>
</head>
<body>
    <header>
        <h1>Bienvenido al Sistema de Gestión de Proyectos</h1>
    </header>
    <nav>
        <ul>
            <li><a href="GestionEmpleados.aspx">Gestión de Empleados</a></li>
            <li><a href="GestionProyectos.aspx">Gestión de Proyectos</a></li>
            <li><a href="AsignacionEmpleados.aspx">Asignación de Empleados</a></li>
        </ul>
    </nav>
    <main>
        <p>Seleccione una opción del menú para comenzar.</p>
    </main>
</body>
</html>
