using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GPA.DAL;
using GPA.DAL.Util;


namespace GPA.Models.Manager
{
    public class AccountManager
    {

        public void RegisterUser(RegisterViewModel model,int userId)
        {

            using (var db = new GPAEntities())
            {
                Registration user = new Registration();
                user.FName = model.RegisterUserViewModel.FName;
                user.LName = model.RegisterUserViewModel.LName;
                user.Email = model.RegisterUserViewModel.Email;
                user.Address = model.RegisterUserViewModel.Address;
                user.City = model.RegisterUserViewModel.City;
                user.Zip = model.RegisterUserViewModel.Zip;
                user.LandNumber = model.RegisterUserViewModel.LandNumber;
                user.MobileNumber = model.RegisterUserViewModel.MobileNumber;
                user.UserID = userId;
                db.Registrations.Add(user);
                db.SaveChanges();



            }
        }

        //public List<Role> getRoles()
        //{



        //    using (var db = new TestDBEntities())
        //    {
        //        var roles = from b in db.Roles
        //                    select b;
        //        return roles.ToList();
        //    }


        //}

        //public void AddRole(RoleViewModel model)
        //{

        //    using (var db = new TestDBEntities())
        //    {

        //        Role role = new Role();
        //        role.Name = model.Role;
        //        db.Roles.Add(role);
        //        db.SaveChanges();

        //    }
        //}

        public bool ValidateUser(LoginViewModel model, out User user)
        {
            //LoginViewModel
            String userName = model.UserName;
            String password = model.Password;
            Helper helper = new Helper();
            user = null;
            String epassword = helper.EncryptPassword(password);
            using (var db = new GPAEntities())
            {
                var _user = db.Users.Where(r => r.UserName == userName && r.Password == epassword).SingleOrDefault();              
                  
                if (_user!= null)
                {
                    user = _user;
                    return true;
                }                    
                else
                {
                    return false;
                }
                   
            }


        }

        public Boolean IsUserRegistered(User user)
        {
            Boolean flag = false;
            using (var db = new GPAEntities())
            {
                var userRegistraion = db.Registrations.Where(r => r.UserID == user.UserID).SingleOrDefault();
                if (userRegistraion != null)
                {
                    flag = true;
                }
                else

                    flag = false;

            }
            return flag;
        }

        public void InsertTestData()
        {
           
            Helper helper = new Helper();
            User dil = new User();
            dil.UserName = "Dil";
            dil.Password = helper.EncryptPassword(dil.UserName);
            dil.Role = "Admin";
            dil.VerificationCode = helper.GenerageVerificationCode(4);

            User laxman = new User();
            laxman.UserName = "Laxman";
            laxman.Password = helper.EncryptPassword(laxman.UserName);
            laxman.Role = "Staff";
            laxman.VerificationCode = helper.GenerageVerificationCode(4);

            List<User> users = new List<User>();
            users.Add(dil);
            users.Add(laxman);
            using (var db = new GPAEntities())
            {
                db.Users.AddRange(users);
                db.SaveChanges();
            }

        }

        public String GetUserVerificationCode(int userId)
        {
            string verification = "";
            using (var db = new GPAEntities())
            {
                verification = db.Users.Where(r => r.UserID == userId).Select(s => s.VerificationCode).Single();

            }

            return verification;

        }

        //public Role GetCurrentRole(User user)
        //{
        //    dynamic role;
        //    using (var db = new TestDBEntities())
        //    {
        //        var roles = db.UserRoles.Where(r => r.UserId == user.Id).ToList();
        //        int roleid = roles[0].RoleId;
        //        role = db.Roles.Where(r => r.Id == roleid).Single();
        //    }

        //    return role;

        //}







    }


}