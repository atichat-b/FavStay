using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Testing.Models
{
    public class ReservationModel
    {
        public List<SelectListItem> lsLocations { get; set; }
        public List<SelectListItem> ProjectList { get; set; }
        public List<SelectListItem> RoomsList { get; set; }

        public int RoomID { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime CheckInDate { get; set; }
        public DateTime CheckOutDate { get; set; }
        public int GuestAmount { get; set; }

    }
}