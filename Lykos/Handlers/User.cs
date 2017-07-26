using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Net;
using System.Net.Mail;

namespace Lykos.Handlers
{
    public class User
    {
        public string login, fullName, comment, role;
        public int user_id;

        public static string GetCurrentUserLogin()
        {
            return HttpContext.Current.User.Identity.Name;
        }

        public static User GetCurrentUserInfo()
        {
            User user = new User();
            var login = GetCurrentUserLogin();
            using (var conn = LykosDB.GetSqlConnection())
            {
                using (SqlCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandText = string.Format("SELECT " +
                        "us_rl.name as role, usr.fullName as fullName, usr.comment as comment, usr.id FROM users as usr " +
                        "LEFT OUTER JOIN user_role as us_rl " +
                        "ON usr.user_role_id = us_rl.id " +
                        "WHERE usr.login like '{0}'", login);
                    cmd.Connection.Open();
                    SqlDataReader sdr = cmd.ExecuteReader(CommandBehavior.Default);
                    sdr.Read();
                    user.role = (string)sdr[0];
                    user.fullName = (string)sdr[1];
                    user.comment = (string)sdr[2];
                    user.user_id = Int32.Parse(sdr[3].ToString());
                }
            }
            return user;
        }

        public static void SendMail(string operatorName)
        {
            var from = "developer.lykos@rambler.ru";
            //var from = "vivates@rambler.ru";
            var to = "ok@lykospharma.com";
            //var to = "vites@i.ua";
            var subject = string.Format("You have a new Form to sign FROM {0}!", operatorName);
            var body = string.Format("You have a new form to sign FROM {0}!", operatorName);
            MailMessage o = new MailMessage(from, to, subject, body);
            //NetworkCredential netCred = new NetworkCredential("vites@outlook.com", "03340351!");
            NetworkCredential netCred = new NetworkCredential("developer.lykos@rambler.ru", "superv1s0r");
            //NetworkCredential netCred = new NetworkCredential("vivates@rambler.ru", "Vites1986!");
            //SmtpClient smtpobj = new SmtpClient("smtp.live.com", 587);
            SmtpClient smtpobj = new SmtpClient("smtp.rambler.ru", 25);
            smtpobj.EnableSsl = true;
            smtpobj.Credentials = netCred;
            smtpobj.Send(o);
        }
            




    }
}