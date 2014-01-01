using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GPA.Models.Manager
{
    public class AccountManager
    {
        public void RegisterUser(RegisterViewModel model)
        {
            using (var db = new GPAModelContainer())
            {
                User user = new User();
                user.Password = model.UserViewModel.Password;
                user.UserName = model.UserViewModel.UserName;
           
                UserDetails userDetails = new UserDetails();

                userDetails.Email = model.UserDetailViewModel.Email;


                userDetails.Name = model.UserDetailViewModel.Name;
                user.UserDetail = userDetails;

                db.Users.Add(user);
                db.SaveChanges();
                
                


                
            }
        }
    }
}