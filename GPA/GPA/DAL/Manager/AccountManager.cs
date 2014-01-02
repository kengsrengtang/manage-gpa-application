using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GPA.DAL;
using GPA.DAL.Utilities;

namespace GPA.Models.Manager
{
    public class AccountManager
    {

        public void RegisterUser(RegisterViewModel model)
        {

            using (var db = new TestDBEntities())
            {
                Helper helper = new Helper();
                User user = new User();
                user.Password = helper.EncryptPassword(model.UserViewModel.Password);
                //TODO send password and verification code to the user
                user.UserName = model.UserViewModel.UserName;
                user.VerificationCode = helper.GenerageVerificationCode(3);

                UserDetail userDetails = new UserDetail();
                userDetails.Email = model.UserDetailViewModel.Email;
                userDetails.Name = model.UserDetailViewModel.Name;
                userDetails.Address = model.UserDetailViewModel.Address;
                userDetails.City = model.UserDetailViewModel.City;
                userDetails.State = model.UserDetailViewModel.State;
                userDetails.Zip = model.UserDetailViewModel.Zip;
               
                user.UserDetail = userDetails;

                db.Users.Add(user);
                db.SaveChanges();


                int id = user.User_ID;
                UserRole ur = new UserRole();
                ur.RoleId = model.RoleViewModel.RoleID;
                ur.UserId = id;
                ur.Status = true;
                db.UserRoles.Add(ur);
                db.SaveChanges();

            }
        }

        public List<Role> getRoles()
        {



            using (var db = new TestDBEntities())
            {
                var roles = from b in db.Roles
                            select b;
                return roles.ToList();
            }


        }

        public void AddRole(RoleViewModel model)
        {

            using (var db = new TestDBEntities())
            {

                Role role = new Role();
                role.Name = model.Role;
                db.Roles.Add(role);
                db.SaveChanges();

            }
        }


    }


}