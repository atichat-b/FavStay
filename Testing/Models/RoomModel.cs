using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace Testing.Models
{
    public class RoomModel
    {
        public int Id { get; set; }
        public int ProjectId { get; set; }
        public int RoomTypeId { get; set; }
        public string Title { get; set; }
        public string Type { get; set; }

        public string ProjectName { get; set; }
        public string LocationName { get; set; }
    }
}