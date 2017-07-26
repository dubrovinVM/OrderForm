using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Sql;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections;
using System.IO;
using System.Web.UI.WebControls;
using Lykos.Handlers;

namespace Lykos.Handlers
{
    public class LykosDB
    {
        public static SqlConnection GetSqlConnection()
        {
            //string sConn = "workstation id=lykosdb.mssql.somee.com;packet size=4096;user id=vites_SQLLogin_1;pwd=snv7ccbujr;data source=lykosdb.mssql.somee.com;persist security info=False;initial catalog=lykosdb";
            //string sConn = "Data Source=VIKTOR\\VIKTOR;Initial Catalog=lykos;Integrated Security=True";
            string sConn = System.Configuration.ConfigurationManager.ConnectionStrings["lykosConnectionString"].ConnectionString;
            //ConnectionStringSettings settings = ConfigurationManager.ConnectionStrings[sConn];
            SqlConnection conn = new SqlConnection(sConn);
            return conn;
        }

        public static int SaveForm(Form form, CheckBoxList CheckBoxList_manufacturer, HttpFileCollection attachments, string stor_dir)
        {
            int formId = UploadFormInfo(form);
            if (formId != 0)
            {
                SaveAttchToStorage(stor_dir, attachments, formId);
                UploadManufacturers(CheckBoxList_manufacturer, formId);
                UploadAttachments(attachments, formId);
            }
            return formId;
        }

        public static int UploadFormInfo(Form form)
        {
            var formId = 0;
            var user = User.GetCurrentUserInfo();
            using (var conn = LykosDB.GetSqlConnection())
            {
                using (SqlCommand cmd = conn.CreateCommand())
                {
                    cmd.Connection.Open();
                    cmd.CommandText = "INSERT INTO [result].[forms] " +
                                      "([operator_id], [name], [saved_date], [status_id]) output INSERTED.ID values " +
                                      $"({user.user_id},'{form.name}', GETDATE(), 2);";
                    formId = (int)cmd.ExecuteScalar();
                    cmd.CommandText = "INSERT INTO [result].[forms_info]" +
                                      "([form_id],[product_name],[pharmaceutical_form],[strength]," +
                                      "[product_code],[marketing_authorithation_holder]," +
                                      "[country_impacted],[change_initiator],[date_of_request]," +
                                      "[type_of_artwork],[type_of_change],[variation_type]," +
                                      "[change_need_submit],[change_need_approve],[packaging_matrials_period]," +
                                      "[sell_out_period],[comments1],[component_type],[change_strategy],[comments2]," +
                                      $"[implementation_date], [cis_id], [submission_date], [approve_date],[packaging_matrials_dedline],[sell_out_dedline]) values ({formId},{form.product_name},{form.pharmaceutical_form},{form.strength},{form.product_code},{form.marketing_authorithation_holder},{form.country_impacted},{form.change_initiator}," +
                                      $"'{string.Format($"{form.date_of_request:yyyy-MM-dd}", form.date_of_request)}',{form.type_of_artwork},{form.type_of_change}," +
                                      $"{form.variation_type},{form.change_need_submit},{form.change_need_approve},{form.packaging_matrials_period},{form.sell_out_period},'{form.comments1}',{form.component_type},{form.change_strategy},'{form.comments2}'," +
                                      $"'{string.Format($"{form.implementation_date:yyyy-MM-dd hh:mm:ss}", form.implementation_date)}', " +
                                      $"{form.cis_id}," +
                                      $"'{ string.Format($"{form.submiss_date:yyyy-MM-dd hh:mm:ss}", String.IsNullOrEmpty(form.submiss_date.ToString()) ? DateTime.MinValue : form.submiss_date)}'," +
                                      $"'{ string.Format($"{form.approve_date:yyyy-MM-dd hh:mm:ss}", String.IsNullOrEmpty(form.approve_date.ToString()) ? DateTime.MinValue : form.approve_date)}'," +
                                      $"'{ string.Format($"{form.packaging_matrials_dedline:yyyy-MM-dd hh:mm:ss}", String.IsNullOrEmpty(form.packaging_matrials_dedline.ToString()) ? DateTime.MinValue : form.packaging_matrials_dedline)}'," +
                                      $"'{ string.Format($"{form.sell_out_dedline:yyyy-MM-dd hh:mm:ss}", String.IsNullOrEmpty(form.sell_out_dedline.ToString()) ? DateTime.MinValue : form.sell_out_dedline)}'" +

                                      $");";
                    //cmd.Connection.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            return formId;
        }

        public static void UploadManufacturers(CheckBoxList checkBoxListManufacturer, int formId)
        {
            using (var conn = LykosDB.GetSqlConnection())
            {
                using (var cmd = conn.CreateCommand())
                {
                    cmd.Connection.Open();
                    foreach (ListItem listItem in checkBoxListManufacturer.Items)
                    {
                        if (!listItem.Selected) continue;
                        cmd.CommandText =
                            $"INSERT INTO [result].[formManufacturerRef] VALUES ({formId},{Int32.Parse(listItem.Value)}) ";
                        cmd.ExecuteNonQuery();
                    }
                }
            }
        }

        public static void UploadComponentType(int formId, int type_id, string fileName)
        {
            using (var conn = LykosDB.GetSqlConnection())
            {
                using (var cmd = conn.CreateCommand())
                {
                    cmd.Connection.Open();
                        cmd.CommandText =
                            $"INSERT INTO [result].[formComponentTypeRef] VALUES ({formId},{type_id},'{fileName}') ";
                        cmd.ExecuteNonQuery();
                }
            }
        }

        public static void UploadAttachments(HttpFileCollection attachments, int formId)
        {
            using (var conn = LykosDB.GetSqlConnection())
            {
                using (var cmd = conn.CreateCommand())
                {
                    cmd.Connection.Open();
                    for (var i = 0; i < attachments.Count; i++)
                    {
                        var attachment = attachments[i];
                        if (attachment.ContentLength > 0)
                        {
                            cmd.Parameters.Clear();
                            var fs = attachment.InputStream;
                            var br = new BinaryReader(fs);
                            byte[] bytes = br.ReadBytes((Int32)fs.Length);
                            cmd.CommandText =
                                "INSERT INTO [result].[attachements] ([form_id],[filename],[data],[contenttype]) VALUES " +
                                "(@formId,@FileName,@Data,@ContentType)";
                            cmd.Parameters.AddWithValue("@formId", formId);
                            cmd.Parameters.AddWithValue("@FileName", Path.GetFileName(attachment.FileName));
                            cmd.Parameters.AddWithValue("@ContentType", attachment.ContentType);
                            cmd.Parameters.AddWithValue("@Data", bytes);
                            cmd.ExecuteNonQuery();
                            br.Close();
                            fs.Close();
                        }
                    }
                }
            }
        }

        public static FormInfo GetFormInfo(int formId)
        {
            FormInfo form;
            var manufacturer = new ArrayList();
            var attachnents = new ArrayList();
            var componenet_types = new ArrayList();

            using (var conn = LykosDB.GetSqlConnection())
            {
                using (var cmd = conn.CreateCommand())
                {
                    cmd.Connection.Open();
                    cmd.CommandText = "SELECT " + "[frm].name as [frm_name], " +
                                      "[product_name].name as [product_name], " +
                                      "[pharmaceutical_form].name as [pharmaceutical_form], " +
                                      "[strength].name as [strength], " + "[product_code].name as [product_code], " +
                                      "[marketing_authorithation_holder].name as [marketing_authorithation_holder], " +
                                      "[country_impacted].name as [country_impacted], " +
                                      "[change_initiator].name as [change_initiator], " + "[date_of_request], " +
                                      "[type_of_artwork].name as [type_of_artwork], " +
                                      "[type_of_change].name as [type_of_change], " +
                                      "[variation_type].name as [variation_type], " +
                                      "[change_need_submit].name as [change_need_submit], " +
                                      "[change_need_approve].name as [change_need_approve], " +
                                      "[packaging_matrials_period].name as [packaging_matrials_period], " +
                                      "[sell_out_period].name as [sell_out_period], " + "[comments1], " +
                                      "[component_type].name as [component_type], " +
                                      "[change_strategy].name as [change_strategy], " + "[comments2], " +
                                      "[cis].name as cis," + 
                                      "[implementation_date]," + "sts.category_name as status," +
                                      "usrs.fullName as fullName, " + 
                                      "usrs.comment as user_comments, " +
                                      "usr_rl.name as rank, " +
                                      "inf.[submission_date] as submission_date, " +
                                      "inf.[approve_date] as approve_date," +
                                      "inf.[packaging_matrials_dedline], inf.[sell_out_dedline]," +
                                      "frm.[saved_date], frm.[send_date], frm.[signed_date] " +
                                      "FROM [result].[forms_info] as inf " +
                                      "LEFT OUTER JOIN product_name as [product_name] " +
                                      "ON inf.[product_name] = [product_name].id " +
                                      "LEFT OUTER JOIN pharmaceutical_form as [pharmaceutical_form] " +
                                      "ON inf.[pharmaceutical_form] = [pharmaceutical_form].id " +
                                      "LEFT OUTER JOIN strength as [strength] " + "ON inf.[strength] = [strength].id " +
                                      "LEFT OUTER JOIN product_code as [product_code] " +
                                      "ON inf.[product_code] = [product_code].id " +
                                      "LEFT OUTER JOIN marketing_authorithation_holder as [marketing_authorithation_holder] " +
                                      "ON inf.[marketing_authorithation_holder] = [marketing_authorithation_holder].id " +
                                      "LEFT OUTER JOIN country_impacted as [country_impacted] " +
                                      "ON inf.[country_impacted] = [country_impacted].id " +
                                      "LEFT OUTER JOIN change_initiator as [change_initiator] " +
                                      "ON inf.[change_initiator] = [change_initiator].id " +
                                      "LEFT OUTER JOIN type_of_artwork as [type_of_artwork] " +
                                      "ON inf.[type_of_artwork] = [type_of_artwork].id " +
                                      "LEFT OUTER JOIN type_of_change as [type_of_change] " +
                                      "ON inf.[type_of_change] = [type_of_change].id " +
                                      "LEFT OUTER JOIN variation_type as [variation_type] " +
                                      "ON inf.[variation_type] = [variation_type].id " +
                                      "LEFT OUTER JOIN change_need_submit as [change_need_submit] " +
                                      "ON inf.[change_need_submit] = [change_need_submit].id " +
                                      "LEFT OUTER JOIN change_need_approve as [change_need_approve] " +
                                      "ON inf.[change_need_approve] = [change_need_approve].id " +
                                      "LEFT OUTER JOIN packaging_matrials_period as [packaging_matrials_period] " +
                                      "ON inf.[packaging_matrials_period] = [packaging_matrials_period].id " +
                                      "LEFT OUTER JOIN sell_out_period as [sell_out_period] " +
                                      "ON inf.[sell_out_period] = [sell_out_period].id " +
                                      "LEFT OUTER JOIN component_type as [component_type] " +
                                      "ON inf.[component_type] = [component_type].id " +
                                      "LEFT OUTER JOIN change_strategy as [change_strategy] " +
                                      "ON inf.[change_strategy] = [change_strategy].id " +
                                      "LEFT OUTER JOIN result.forms as frm " + "ON inf.[form_id] = frm.id " +
                                      "LEFT OUTER JOIN dbo.users as usrs " + "on frm.[operator_id] = usrs.id " +
                                      "LEFT OUTER JOIN dbo.[form_status] as sts " + "on frm.[status_id] = sts.id " +
                                      "LEFT OUTER JOIN dbo.[user_role] as usr_rl " +
                                      "on usr_rl.id = usrs.user_role_id " +
                                      "LEFT OUTER JOIN [info].[cis] as cis " +
                                      "on cis.id = inf.cis_id " + $" WHERE [form_id] = {formId}";
                    var reader = cmd.ExecuteReader();
                    reader.Read();
                    form = new Lykos.FormInfo
                    {
                        name = reader["frm_name"].ToString(),
                        comments1 = reader["comments1"].ToString(),
                        comments2 = reader["comments2"].ToString(),
                        product_name = reader["product_name"].ToString(),
                        pharmaceutical_form = reader["pharmaceutical_form"].ToString(),
                        strength = reader["strength"].ToString(),
                        product_code = reader["product_code"].ToString(),
                        marketing_authorithation_holder = reader["marketing_authorithation_holder"].ToString(),
                        country_impacted = reader["country_impacted"].ToString(),
                        change_initiator = reader["change_initiator"].ToString(),
                        type_of_artwork = reader["type_of_artwork"].ToString(),
                        type_of_change = reader["type_of_change"].ToString(),
                        variation_type = reader["variation_type"].ToString(),
                        change_need_submit = reader["change_need_submit"].ToString(),
                        change_need_approve = reader["change_need_approve"].ToString(),
                        packaging_matrials_period = reader["packaging_matrials_period"].ToString(),
                        sell_out_period = reader["sell_out_period"].ToString(),
                        component_type = reader["component_type"].ToString(),
                        change_strategy = reader["change_strategy"].ToString(),
                        date_of_request = reader["date_of_request"].ToString(),
                        implementation_date = reader["implementation_date"].ToString(),
                        form_status = reader["status"].ToString(),
                        operator_name = reader["fullName"].ToString(),
                        operator_rank = reader["rank"].ToString(),
                        user_comments = reader["user_comments"].ToString(),
                        cis = reader["cis"].ToString(),
                        submiss_date = reader["submission_date"].ToString(),
                        approve_date = reader["approve_date"].ToString(),
                        packaging_matrials_dedline = reader["packaging_matrials_dedline"].ToString(),
                        sell_out_dedline = reader["sell_out_dedline"].ToString()
                    };
                    reader.Close();
                    cmd.CommandText = "SELECT mref.[id], mref.[manufacture_id] as id, manf.name as name " +
                                      "FROM [result].[formManufacturerRef] AS mref " +
                                      "LEFT OUTER JOIN[dbo].[manufacturer] AS manf " +
                                      "ON mref.[manufacture_id] = manf.ID WHERE mref.[form_id] = " + formId;
                    var reader2 = cmd.ExecuteReader();
                    while (reader2.Read())
                    {
                        manufacturer.Add(reader2["name"]);
                    }
                    reader2.Close();

                    cmd.CommandText = "SELECT [id], [filename] FROM [result].[attachements] " +
                                      "WHERE [form_id] = " + formId;
                    var reader3 = cmd.ExecuteReader();
                    while (reader3.Read())
                    {
                        attachnents.Add(reader3["filename"]);
                    }
                    reader3.Close();
                    cmd.CommandText = "SELECT type.name as name, tref.[attachName] as attachName " +
                                      "FROM [result].[formComponentTypeRef] AS tref " +
                                      "LEFT OUTER JOIN [dbo].[component_type] AS type " +
                                      "ON tref.[component_type_id] = type.id WHERE tref.[form_id] = " + formId;
                    var reader4 = cmd.ExecuteReader();
                    while (reader4.Read())
                    {
                        componenet_types.Add(reader4["name"]);
                    }
                    reader4.Close();
                }
            }
            form.manufacturer = manufacturer;
            form.attachments = attachnents;
            form.component_types = componenet_types;
            return form;
        }


        public static void DeleteForm(int form_id)
        {
            var user = User.GetCurrentUserInfo();
            using (var conn = LykosDB.GetSqlConnection())
            {
                using (var cmd = conn.CreateCommand())
                {
                    cmd.Connection.Open();
                    cmd.CommandText = string.Format(
                        "Delete FROM [result].[forms_info] WHERE [form_id] = {0}; " +
                        "Delete FROM [result].[formManufacturerRef] WHERE [form_id] = {0};" +
                        "Delete FROM [result].[formComponentTypeRef] WHERE [form_id] = {0};" +
                        "Delete FROM [result].[attachements] WHERE [form_id] = {0};" +
                        "Delete FROM [result].[forms] WHERE id = {0};",
                        form_id);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public static void UpdateFormStatus(int formId, int statusId)
        {
            using (var conn = GetSqlConnection())
            {
                using (var cmd = conn.CreateCommand())
                {
                    cmd.Connection.Open();
                    cmd.CommandText = $"UPDATE [result].[forms] SET status_id={statusId} WHERE [id] = {formId};";
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public static bool IfFormBelongsToUser(int formId, int userId, string userRole)
        {
            string result;
            if (userRole == "developer" || userRole == "head") return true;
            using (var conn = GetSqlConnection())
            {
                using (var cmd = conn.CreateCommand())
                {
                    cmd.Connection.Open();
                    cmd.CommandText =
                        string.Format("SELECT [id] FROM [result].[forms] where operator_id like {0} AND [id] like {1}",
                            userId, formId);
                    var reader = cmd.ExecuteReader();
                    reader.Read();
                    result = reader["id"].ToString();
                }
            }
            return !string.IsNullOrEmpty(result);
        }

        public static bool IfFormExists(int formId)
        {
            var result = string.Empty;
            using (var conn = GetSqlConnection())
            {
                using (var cmd = conn.CreateCommand())
                {
                    cmd.Connection.Open();
                    cmd.CommandText = $"SELECT [id] FROM [result].[forms] where [id] like '{formId}'";
                    var reader = cmd.ExecuteReader();
                    if (reader.Read()) return true;
                }
            }
            return false;
        }

        public static string GetManufactures(string formId)
        {
            var manufacturer = string.Empty;
            using (var conn = LykosDB.GetSqlConnection())
            {
                using (var cmd = conn.CreateCommand())
                {
                    cmd.Connection.Open();
                    cmd.CommandText = string.Format("SELECT mref.[id], mref.[manufacture_id] as id, manf.name as name " +
                                      "FROM [result].[formManufacturerRef] AS mref " +
                                      "LEFT OUTER JOIN[dbo].[manufacturer] AS manf " +
                                      "ON mref.[manufacture_id] = manf.ID WHERE mref.[form_id] like '{0}'",formId);
                    var reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        manufacturer+= reader["name"]+"; ";
                    }
                }
                return manufacturer;
            }
        }

        public static string GetComponentTypes(string formId)
        {
            var componenet_types = string.Empty;
            using (var conn = LykosDB.GetSqlConnection())
            {
                using (var cmd = conn.CreateCommand())
                {
                    cmd.Connection.Open();
                    cmd.CommandText = "SELECT type.name as name, tref.[attachName] as attachName " +
                                      "FROM [result].[formComponentTypeRef] AS tref " +
                                      "LEFT OUTER JOIN [dbo].[component_type] AS type " +
                                      "ON tref.[component_type_id] = type.id WHERE tref.[form_id] = " + formId;
                    var reader4 = cmd.ExecuteReader();
                    var res = string.Empty;
                    while (reader4.Read())
                    {
                        res = !string.IsNullOrEmpty(reader4["attachName"].ToString())
                            ? " - " + reader4["attachName"]
                            : " no attachment file";
                        componenet_types += string.Format("{0} {1}; ", reader4["name"], res);
                    }
                }
                return componenet_types;
            }
        }

        public static string GetComponentTypeAttch(int formId, string name)
        {
            var res = string.Empty;
            using (var conn = GetSqlConnection())
            {
                using (var cmd = conn.CreateCommand())
                {
                    conn.Open();
                    cmd.CommandText = "SELECT tref.[attachName] as attachName " +
                                      "FROM [result].[formComponentTypeRef] AS tref " +
                                      "LEFT OUTER JOIN [dbo].[component_type] AS type " +
                                      "ON tref.[component_type_id] = type.id " +
                                      "WHERE type.name like '"+ name + "' AND tref.[form_id] = " + formId;
                    var reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        res = reader["attachName"].ToString();
                    }
                }
                return res;
            }
        }

        public static void SaveAttchToStorage(string attchDir0, HttpFileCollection attachments, int form_id)
        {
            string attchDir = attchDir0 + "\\" + form_id;
            if (!Directory.Exists(attchDir)) Directory.CreateDirectory(attchDir);
            for (var i = 0; i < attachments.Count; i++)
            {
                var attachment = attachments[i];
                if (attachment.ContentLength > 0)
                {
                    attachment.SaveAs(attchDir + "\\" + Path.GetFileName(attachment.FileName));
                }
            }
        }


    }
}