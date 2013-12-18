using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace GZDXCC.Admin
{
    public partial class AdministerList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.tbKey.Text = Request["key"];
                if (!string.IsNullOrEmpty(Request["id"]))
                {
                    Dictionary<string, object> p = new Dictionary<string, object>();
                    p.Add("@id", Request["id"]);
                    string loginName = SqlHelper.ExecuteScalar("select LoginName from Admin where id=@id", p).ToString();
                    if (loginName == Session["LoginName"].ToString())
                    {
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "haha", "alert('不能清除自己的信息！')", true);
                        return;
                    }
                    string sql = "delete from Admin where id=@id;";
                    SqlHelper.ExecuteNonQuery(sql, p);
                }
                Dictionary<string, object> parameter = new Dictionary<string, object>();
                parameter.Add("@searchKey", this.tbKey.Text.Trim());
                string searchSql = "select count(*) from Admin where LoginName like '%' + @searchKey+'%' or RealName like '%'+@searchKey+'%'";
                object o = SqlHelper.ExecuteScalar(searchSql, parameter);
                this.AspNetPager1.RecordCount = int.Parse(o.ToString());
                this.AspNetPager1.PageSize = string.IsNullOrEmpty(Request.QueryString["pageSize"]) ? 5 : int.Parse(Request.QueryString["pageSize"]);
            }
        }
        public void BindDataToPage(int pageSize, int currentPage)
        {
            string sql = "select * from ( select ROW_NUMBER() OVER (order by id desc) as RowNo ,* from [Admin]  where LoginName like '%' + @searchKey+ '%' or RealName like '%'+@searchKey+'%') as t where RowNo>@PageSize*(@CurrentPage-1)   and  RowNo<=@PageSize*@CurrentPage;";
            Dictionary<string, object> p = new Dictionary<string, object>();
            p.Add("@PageSize", pageSize);
            p.Add("@CurrentPage", currentPage);
            //if (string.IsNullOrEmpty(this.tbKey.Text.Trim()))
            //{
            //    p.Add("@searchKey", string.Empty);
            //}

            // else { p.Add("@searchKey", this.tbKey.Text.Trim()); }
            p.Add("@searchKey", this.tbKey.Text.Trim());
            this.rpData.DataSource = (SqlHelper.GetDataTable(sql, p));
            this.rpData.DataBind();
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministerList.aspx?page=1&pageSize=" + Request["pageSize"] + "&key" + this.tbKey.Text);
        }

        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            int pageSize = string.IsNullOrEmpty(Request.QueryString["pageSize"]) ? 5 : int.Parse(Request.QueryString["pageSize"]);
            int currentPage = string.IsNullOrEmpty(Request.QueryString["page"]) ? 1 : int.Parse(Request.QueryString["page"]);
            this.BindDataToPage(pageSize, currentPage);
        }
    }
}