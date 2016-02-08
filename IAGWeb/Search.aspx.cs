using IAGWeb.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAGWeb
{
    public partial class Search : BaseDataPage
    {
        public class SearchResultItem
        {
            public string Title { get; set; }
            public string Description { get; set; }
            public string Link { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            var searchTerm = txtSearch.Text.ToLower();
            var results = new List<SearchResultItem>();

            if (LoggedInUserId != null)
            { 
                // search for courses
                var courses = DatabaseContext.Courses.Where(c => c.Name.ToLower().Contains(searchTerm) || 
                                                                c.Subject.ToLower().Contains(searchTerm) || 
                                                                c.UploadedBy.ToLower().Contains(searchTerm));
                foreach(var course in courses)
                {
                    results.Add(GetResultFromCourse(course));
                }
            }

            // search for schedules
            var schedulesDirectory = new DirectoryInfo(Server.MapPath("Schedules"));
            if (schedulesDirectory.Exists)
            {
                foreach(var file in schedulesDirectory.GetFiles())
                {
                    
                    if (file.Name.ToLower().Contains(searchTerm))
                    {
                        results.Add(GetResultFromSchedule(file, file.Name));
                    }
                    else
                    {
                        var phrase = GetPhraseInFile(file, searchTerm, 10);
                        if (phrase!= null)
                        {
                            results.Add(GetResultFromSchedule(file, phrase));
                        }
                    }
                }
            }

            // search for other aspx files
            var searchDirectory = new DirectoryInfo(Server.MapPath("~"));
            if (searchDirectory.Exists)
            {
                foreach(var file in searchDirectory.GetFiles("*.aspx"))
                {
                    var pageTitle = Path.GetFileNameWithoutExtension(file.Name);
                    if (file.Name.ToLower().Contains(searchTerm))
                    {
                        results.Add(GetResultFromPage(file, pageTitle, pageTitle));
                    }
                    else
                    {
                        var phrase = GetPhraseInFile(file, searchTerm, 10);
                        if (phrase != null)
                        {
                            results.Add(GetResultFromPage(file, Path.GetFileNameWithoutExtension(pageTitle), phrase));
                        }
                    }
                }
            }

            rptResults.DataSource = results;
            rptResults.DataBind();
        }

        private SearchResultItem GetResultFromCourse(Course course)
        {
            var result = new SearchResultItem();
            result.Title = "Curs";
            result.Description = string.Format("Nume curs {0}, an {1}, semestru {2}, materie {3}. ", course.Name, course.Year, course.Semester, course.Subject);
            result.Link = string.Format("<a href='Courses?id={0}'>{1}</a>", course.Id, course.Name);

            return result;
        }

        private SearchResultItem GetResultFromSchedule(FileInfo file, string phrase)
        {
            var result = new SearchResultItem();
            result.Title = "Orar";
            result.Description = string.Format("... {0} ... ", phrase);
            result.Link = string.Format("<a href='Schedule?name={0}'>{1}</a>", file.Name, file.Name);

            return result;
        }

        private SearchResultItem GetResultFromPage(FileInfo file, string title, string phrase)
        {
            var result = new SearchResultItem();
            result.Title = title;
            result.Description = string.Format("... {0} ...", phrase);
            result.Link = string.Format("<a href='{0}'>{1}</a>", file.Name, title);

            return result;
        }

        private string GetPhraseInFile(FileInfo file, string searchTerm, int numberOfWords)
        {
            var content = StripTags(file);
            var index = content.IndexOf(searchTerm, StringComparison.OrdinalIgnoreCase);
            if (index != -1)
            {
                var lastIndex = index;
                // Loop through entire summary.
                for (; lastIndex < content.Length; lastIndex++)
                {
                    // Increment words on a space.
                    if (content[lastIndex] == ' ')
                    {
                        numberOfWords--;
                    }
                    // If we have no more words to display, return the substring.
                    if (numberOfWords == 0)
                    {
                        break;
                    }
                }
                return content.Substring(index, lastIndex - index);
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// Remove HTML tags from string using char array.
        /// </summary>
        private string StripTags(FileInfo file)
        {
            var stream = file.OpenRead();
            char[] array = new char[stream.Length];
            int arrayIndex = 0;
            bool inside = false;

            for (int i = 0; i < stream.Length; i++)
            {
                char let = Convert.ToChar(stream.ReadByte());
                if (let == '<')
                {
                    inside = true;
                    continue;
                }
                if (let == '>')
                {
                    inside = false;
                    continue;
                }
                if (!inside)
                {
                    array[arrayIndex] = let;
                    arrayIndex++;
                }
            }
            return new string(array, 0, arrayIndex);
        }
    }
}