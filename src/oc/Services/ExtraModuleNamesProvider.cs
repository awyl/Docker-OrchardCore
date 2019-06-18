using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using Microsoft.Extensions.Configuration;
using OrchardCore.Modules;
using OrchardCore.Modules.Manifest;

namespace Microsoft.Extensions.DependencyInjection
{
    /// <summary>
    /// This add the ability to load extra modules in a separate
    /// folder dynamically.  However, only in production mode for now.
    /// </summary>
    public class ExtraModuleNamesProvider : IModuleNamesProvider
    {
        private readonly List<string> _moduleNames = new List<string>();

        public ExtraModuleNamesProvider(IConfiguration config)
        {
            var locations = config["dlls"];

            if (String.IsNullOrWhiteSpace(locations))
            {
                return;
            }

            // loop through each location
            foreach (var loc in locations.Split(';', StringSplitOptions.RemoveEmptyEntries))
            {
                // load all the dlls inside
                foreach (var dll in Directory.EnumerateFiles(loc, "*.dll", SearchOption.TopDirectoryOnly))
                {
                    var assembly = Assembly.LoadFrom(dll);
                    // tell OrchardCore if the assembly contains modules.
                    _moduleNames.AddRange(assembly.GetCustomAttributes<ModuleMarkerAttribute>().Select(m => m.Name));
                }
            }
        }

        public IEnumerable<string> GetModuleNames()
        {
            return _moduleNames;
        }
    }
}