using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Examen_Final_de_Progra_II.CapaModelo;

namespace Examen_Final_de_Progra_II.CapaNegocio
{
    public class EmpleadoNegocio
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["ConexionBD"].ConnectionString;

       
        public List<Empleado> ObtenerEmpleados()
        {
            List<Empleado> empleados = new List<Empleado>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("ConsultarEmpleados", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    conn.Open();

                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        empleados.Add(new Empleado
                        {
                            EmpleadoID = Convert.ToInt32(reader["EmpleadoID"]),
                            NumeroCarnet = reader["NumeroCarnet"].ToString(),
                            Nombre = reader["Nombre"].ToString(),
                            FechaNacimiento = Convert.ToDateTime(reader["FechaNacimiento"]),
                            CategoriaID = Convert.ToInt32(reader["CategoriaID"]),
                            Salario = Convert.ToDecimal(reader["Salario"]),
                            Direccion = reader["Direccion"].ToString(),
                            Telefono = reader["Telefono"].ToString(),
                            Correo = reader["Correo"].ToString(),
                            CategoriaNombre = reader["Categoria"].ToString()
                        });
                    }
                }
            }

            return empleados;
        }

        
        public void AgregarEmpleado(Empleado empleado)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("InsertarEmpleado", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@NumeroCarnet", empleado.NumeroCarnet);
                    cmd.Parameters.AddWithValue("@Nombre", empleado.Nombre);
                    cmd.Parameters.AddWithValue("@FechaNacimiento", empleado.FechaNacimiento);
                    cmd.Parameters.AddWithValue("@CategoriaID", empleado.CategoriaID);
                    cmd.Parameters.AddWithValue("@Salario", empleado.Salario);
                    cmd.Parameters.AddWithValue("@Direccion", empleado.Direccion ?? "San José");
                    cmd.Parameters.AddWithValue("@Telefono", empleado.Telefono);
                    cmd.Parameters.AddWithValue("@Correo", empleado.Correo);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        
        public void EliminarEmpleado(int empleadoID)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("EliminarEmpleado", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@EmpleadoID", empleadoID);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public List<Categoria> ObtenerCategorias()
        {
            List<Categoria> categorias = new List<Categoria>();
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("ConsultarCategorias", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        categorias.Add(new Categoria
                        {
                            CategoriaID = Convert.ToInt32(reader["CategoriaID"]),
                            Nombre = reader["Nombre"].ToString()
                        });
                    }
                }
            }
            return categorias;
        }

    }
}
