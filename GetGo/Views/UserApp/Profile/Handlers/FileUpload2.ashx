﻿<%@ WebHandler Language="C#" Class="FileUpload" %>

using System;
using System.IO;
using System.Web;
using System.Data.SqlClient;

public class FileUpload : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        try
        {
            if (context.Request.Files.Count > 0)
            {
                string userId = System.Convert.ToString(context.Request.QueryString["USERID"]);
                string classificationString = context.Request.Form["classification"]; // Get the classification string

                // Split the classification string into an array of individual classifications
                string[] classifications = classificationString.Split(',');

                for (int i = 0; i < context.Request.Files.Count; i++)
                {
                    HttpPostedFile postedFile = context.Request.Files[i];
                    string fileName = postedFile.FileName;
                    string fileExtension = Path.GetExtension(fileName);
                    string filePath = HttpContext.Current.Server.MapPath(Path.Combine("~/UploadedFiles", userId));
                    string classification = classifications[i];
                    if (!Directory.Exists(filePath))
                    {
                        Directory.CreateDirectory(filePath);
                    }

                    if (!string.IsNullOrEmpty(fileName))
                    {
                        string file = fileName;
                        postedFile.SaveAs(Path.Combine(filePath, file));
                        FileDetails fd = new FileDetails();
                        fd.UserId = userId;
                        fd.FileName = fileName;
                        fd.FileType = fileExtension;
                        fd.FilePath = Path.Combine(filePath, file); // Store the full file path
                        fd.Classification = classification;
                        SaveFiles(fd);
                    }
                }

                context.Response.Write("Files uploaded successfully");

            }
        }
        catch (Exception ex)

        {
            var maint = new UserAppController();

            context.Response.StatusCode = 500; // Set an appropriate HTTP error code
            context.Response.Write("Error: " + ex.Message);
            maint.LogErrorMessageToDatabase(ex.Message);

        }
    }

    public void SaveFiles(FileDetails fd)
    {
        try
        {
            var maint = new UserAppController();

            var parameters = new SqlParameter[]
           {
                    new SqlParameter("@USER_ID", fd.UserId),
                    new SqlParameter("@DESCRIPTION", fd.FileName),
                    new SqlParameter("@IMAGE_TYPE",fd.Classification),

           };
            maint.QueryInsertOrUpdateAdoNet("APP_ATTACHMENT_POST", parameters);

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}