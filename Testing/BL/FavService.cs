using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Testing.Data;
using Testing.Models;


namespace Testing.BL
{
    public class FavService
    {
        public List<LocationModel> GetLocations()
        {
            List<LocationModel> LocationsList = new List<LocationModel>();
            using (FavStayEntities db = new FavStayEntities())
            {
                //var list = db.Location.ToList();
                var list = (from p in db.Locations
                            select new
                            {
                                Id = p.Id,
                                Name = p.Name,
                                ProjectCount = (from c in db.Projects.Where(x => x.Location_Id == p.Id) select c).Count(),
                                RoomCount = (from c in db.Rooms
                                             join d in db.Projects.Where(x => x.Location_Id == p.Id) on c.Project_Id equals d.Id
                                             select c).Count()
                            }).ToList();

                foreach (var a in list)
                {
                    LocationModel l = new LocationModel();
                    l.Id = a.Id;
                    l.Name = a.Name;
                    l.Project = a.ProjectCount;
                    l.CountRoom = a.RoomCount;
                    LocationsList.Add(l);
                }
            }
            return LocationsList;
        }
        public List<ProjectModel> GetProjectsByLocationId(int id)
        {
            List<ProjectModel> ProjectList = new List<ProjectModel>();
            using (FavStayEntities db = new FavStayEntities())
            {
                //var list = db.Location.ToList();
                var list = (from p in db.Projects.Where(x => x.Location_Id == id)
                            select new
                            {
                                Id = p.Id,
                                Name = p.Name,
                                LName = p.Location.Name,
                                RoomCount = (from c in db.Rooms.Where(x => x.Project_Id == p.Id) select c).Count()
                            }).ToList();
                if (list.Count != 0)
                {
                    foreach (var a in list)
                    {
                        ProjectModel l = new ProjectModel();
                        l.Id = a.Id;
                        l.Name = a.Name;
                        l.LocationName = a.LName;
                        l.CountRoom = a.RoomCount;
                        ProjectList.Add(l);
                    }
                }
                else
                {
                    ProjectModel l = new ProjectModel();
                    l.LocationName = (from p in db.Locations.Where(x => x.Id == id) select p.Name).First();
                    ProjectList.Add(l);
                }
            }
            return ProjectList;
        }

        public List<RoomModel> GetRoomByProjectsId(int id)
        {
            List<RoomModel> RoomList = new List<RoomModel>();
            using (FavStayEntities db = new FavStayEntities())
            {
                //var list = db.Location.ToList();
                var list = (from p in db.Rooms.Where(x => x.Project_Id == id)
                            join d in db.RoomTypes on p.RoomType_Id equals d.Id
                            select new
                            {
                                Id = p.Id,
                                Name = p.Title,
                                PName = p.Project.Name,
                                RoomType = d.Type
                                //RoomType = (from c in db.RoomTypes.Where(x => x.Id == p.RoomType_Id) select c.Type)
                            }).ToList();
                if (list.Count != 0)
                {
                    foreach (var a in list)
                    {
                        RoomModel l = new RoomModel();
                        l.Id = a.Id;
                        l.Title = a.Name;
                        l.Type = a.RoomType;
                        l.ProjectName = a.PName;
                        RoomList.Add(l);
                    }
                }
                else
                {
                    RoomModel l = new RoomModel();
                    l.ProjectName = (from p in db.Projects.Where(x => x.Id == id) select p.Name).First();
                    RoomList.Add(l);
                }
            }
            return RoomList;
        }

        public void AddRoom(ReservationModel ReservationModel)
        {
            using (FavStayEntities db = new FavStayEntities())
            {
                Reservation re = new Reservation();
                re.Room_Id = ReservationModel.RoomID;
                re.CheckInDate = ReservationModel.CheckInDate;
                re.CheckOutDate = ReservationModel.CheckOutDate;
                re.CreateDate = ReservationModel.CreateDate;
                re.GuestAmount = ReservationModel.GuestAmount;

                //re.Room_Id = 5;
                //re.CheckInDate = DateTime.Now;
                //re.CheckOutDate = DateTime.Now;
                //re.CreateDate = DateTime.Now;
                //re.GuestAmount = ReservationModel.GuestAmount;

                db.Reservations.Add(re);
                db.SaveChanges();
            }
        }

    }

}