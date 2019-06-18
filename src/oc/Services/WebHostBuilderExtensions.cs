using System;
using System.Reflection;
using Microsoft.AspNetCore.Hosting;

namespace oc
{
    public static class WebHostBuilderExtensions
    {
        public static IWebHostBuilder UseStartupDlls(this IWebHostBuilder builder)
        {
            var locations = Environment.GetEnvironmentVariable("ASPNETCORE_USESTARTUPDLLS");
            if (String.IsNullOrWhiteSpace(locations))
            {
                return builder;
            }

            // loop through each location
            foreach (var loc in locations.Split(';', StringSplitOptions.RemoveEmptyEntries))
            {
                var assembly = Assembly.LoadFrom(loc);
            }

            return builder;
        }
    }
}