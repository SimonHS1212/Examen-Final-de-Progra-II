using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Examen_Final_de_Progra_II.CapaModelo
{
    public class Empleado
    {
        public int EmpleadoID { get; set; }
        public string NumeroCarnet { get; set; }
        public string Nombre { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public int CategoriaID { get; set; }
        public decimal Salario { get; set; }
        public string Direccion { get; set; }
        public string Telefono { get; set; }
        public string Correo { get; set; }
        public string CategoriaNombre { get; set; } 
    }
}
