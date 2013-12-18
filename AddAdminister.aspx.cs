using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GZDXCC.Admin
{
    public partial class AddAdminister : LoginValidate
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            base.CheckValid();
            if (Session["IsValid"] == null)
            {
                Response.Redirect("AdministerLogin.aspx");
            }
            this.tbLoginName.Focus();
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string sql = "select count(*) from [Admin] where LoginName=@LoginName";
            Dictionary<string, object> p = new Dictionary<string, object>();
            p.Add("@LoginName", this.tbLoginName.Text.Replace(" ", ""));
            int count = int.Parse(SqlHelper.ExecuteScalar(sql, p).ToString());
            if (count == 1)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (this.IsValid == false)
            {
                return;
            }
            string sql = @"insert into [Admin]
                                        (
                                        LoginName,
                                        [Password],
                                        RealName
                                        )
                                        values(@LoginName,@Password,@RealName);";
            Dictionary<string, object> p = new Dictionary<string, object>();
            p.Add("@LoginName", this.tbLoginName.Text.Replace(" ", ""));
            p.Add("@Password", this.Password.Text);
            p.Add("@RealName", this.tbRealName.Text);
            try
            {
                SqlHelper.ExecuteNonQuery(sql, p);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "d", "alert('数据插入成功!');", true);

                Button2_Click(sender, e);
            }
            catch (Exception)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "f", "$.ligerDialog.error('次数据已经存在,不能重复田添加 ');", true);
                throw;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            this.tbLoginName.Text = string.Empty;
            this.Password.Text = string.Empty;
            this.PasswordSure.Text = string.Empty;
            this.tbRealName.Text = string.Empty;
        }
    }
}