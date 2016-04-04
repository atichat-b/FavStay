using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using Testing.Models;
using Testing.BL;

namespace Testing.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        public ActionResult Index()
        {
            FavService service = new FavService();

            List<LocationModel> list = service.GetLocations();

            return View(list);
        }

        public ActionResult Locations(int Id)
        {
            FavService service = new FavService();
            List<ProjectModel> list = service.GetProjectsByLocationId(Id);
            var LocationName = list.Select(x => x.LocationName).First();
            ViewBag.LocationName = LocationName;
            Session["Location_Name"] = LocationName;

            return View(list);
        }

        public ActionResult Rooms(int Id)
        {
            FavService service = new FavService();
            List<RoomModel> list = service.GetRoomByProjectsId(Id);
            ViewBag.LocationName = Session["Location_Name"];
            ViewBag.ProjectName = list.Select(x => x.ProjectName).First();

            return View(list);
        }

        public ActionResult Reservation()
        {
            FavService service = new FavService();
            List<LocationModel> LocationList = service.GetLocations();
            ViewBag.LocationList = new SelectList(LocationList, "Id", "Name", selectedValue: 0);

            //List<SelectListItem> items = new List<SelectListItem>();
            //foreach (var item in LocationList)
            //{
            //    items.Add(new SelectListItem { Text = item.Name, Value = Convert.ToString(item.Project), Selected = true });
            //}

            //var model = new ReservationModel()
            //{
            //    lsLocations = items,
            //};
            return View();
        }

        [HttpPost]
        public ActionResult ReservRoom(FormCollection form)
        {

            System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("en-US");

            ReservationModel ReservationModel = new ReservationModel();
            ReservationModel.RoomID = Convert.ToInt32(form["RoomsList"]);
            ReservationModel.CreateDate = DateTime.Now;
            ReservationModel.CheckInDate = Convert.ToDateTime(form["CheckInDate"]);
            ReservationModel.CheckOutDate = Convert.ToDateTime(form["CheckOutDate"]);
            ReservationModel.GuestAmount = Convert.ToInt32(form["GuestAmount"].ToString());

            FavService service = new FavService();
            service.AddRoom(ReservationModel);

            return RedirectToAction("Index", "Home");
        }

        public ActionResult DDLGetProject(int Id)
        {
            FavService service = new FavService();
            List<ProjectModel> list = service.GetProjectsByLocationId(Id);

            return Json(list, JsonRequestBehavior.AllowGet);
        }

        public ActionResult DDLGetRooms(int Id)
        {
            FavService service = new FavService();
            List<RoomModel> list = service.GetRoomByProjectsId(Id);

            return Json(list, JsonRequestBehavior.AllowGet);
        }
    }
}