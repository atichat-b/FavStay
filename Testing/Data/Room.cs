//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Testing.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class Room
    {
        public Room()
        {
            this.Reservations = new HashSet<Reservation>();
        }
    
        public int Id { get; set; }
        public Nullable<int> Project_Id { get; set; }
        public Nullable<int> RoomType_Id { get; set; }
        public string Title { get; set; }
    
        public virtual Project Project { get; set; }
        public virtual ICollection<Reservation> Reservations { get; set; }
        public virtual RoomType RoomType { get; set; }
    }
}
