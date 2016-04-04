using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace Testing.Models
{
    public class LocationModel
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public int Project { get; set; }

        public int CountRoom { get; set; }
    }
}