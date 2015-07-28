Configuration webserver
{
  param ($MachineName)

  Node $MachineName
  {
            WindowsFeature NET-Framework-Core
            {
                Name = "NET-Framework-Core"
                Ensure = "Present"
            }
	              WindowsFeature Windows-Identity-Foundation
            {
                Name = "Windows-Identity-Foundation"
                Ensure = "Present"
            }
            WindowsFeature Web-Static-Content
            {
                Name = "Web-Static-Content"
                Ensure = "Present"
                DependsOn = "[WindowsFeature]Windows-Identity-Foundation"
            }
            WindowsFeature Web-Default-Doc
            {
                Name = "Web-Default-Doc"
                Ensure = "Present"
                DependsOn = "[WindowsFeature]Web-Static-Content"
            }
            WindowsFeature Web-Http-Errors
            {
                Name = "Web-Http-Errors"
                Ensure = "Present"
                DependsOn = "[WindowsFeature]Web-Default-Doc"
            }
            WindowsFeature Web-Asp-Net
            {
                Name = "Web-Asp-Net"
                Ensure = "Present"
                DependsOn = "[WindowsFeature]Web-Http-Errors"
            }
            WindowsFeature Web-Net-Ext
            {
                Name = "Web-Net-Ext"
                Ensure = "Present"
                DependsOn = "[WindowsFeature]Web-Asp-Net"
            }
            WindowsFeature Web-ISAPI-Ext
            {
                Name = "Web-ISAPI-Ext"
                Ensure = "Present"
                DependsOn = "[WindowsFeature]Web-Net-Ext"
            }
            WindowsFeature Web-ISAPI-Filter
            {
                Name = "Web-ISAPI-Filter"
                Ensure = "Present"
                DependsOn = "[WindowsFeature]Web-ISAPI-Ext"
            }
            WindowsFeature Web-Http-Logging
            {
                Name = "Web-Http-Logging"
                Ensure = "Present"
                DependsOn = "[WindowsFeature]Web-ISAPI-Filter"
            }
            WindowsFeature Web-Log-Libraries
            {
                Name = "Web-Log-Libraries"
                Ensure = "Present"
                DependsOn = "[WindowsFeature]Web-Http-Logging"
            }
            WindowsFeature Web-Request-Monitor
            {
                Name = "Web-Request-Monitor"
                Ensure = "Present"
                DependsOn = "[WindowsFeature]Web-Log-Libraries"
            }
            WindowsFeature Web-Http-Tracing
            {
                Name = "Web-Http-Tracing"
                Ensure = "Present"
                DependsOn = "[WindowsFeature]Web-Request-Monitor"
            }
            WindowsFeature Web-Basic-Auth
            {
                Name = "Web-Basic-Auth"
                Ensure = "Present"
                DependsOn = "[WindowsFeature]Web-Http-Tracing"
            }
            WindowsFeature Web-Windows-Auth
            {
                Name = "Web-Windows-Auth"
                Ensure = "Present"
                DependsOn = "[WindowsFeature]Web-Basic-Auth"
            }
            WindowsFeature Web-Client-Auth
            {
                Name = "Web-Client-Auth"
                Ensure = "Present"
                DependsOn = "[WindowsFeature]Web-Windows-Auth"
            }
            WindowsFeature Web-Filtering
            {
                Name = "Web-Filtering"
                Ensure = "Present"
                DependsOn = "[WindowsFeature]Web-Client-Auth"
            }
            WindowsFeature Web-Stat-Compression
            {
                Name = "Web-Stat-Compression"
                Ensure = "Present"
                DependsOn = "[WindowsFeature]Web-Filtering"
            }
            WindowsFeature Web-Dyn-Compression
            {
                Name = "Web-Dyn-Compression"
                Ensure = "Present"
                DependsOn = "[WindowsFeature]Web-Stat-Compression"
            }
            WindowsFeature NET-WCF-HTTP-Activation45
            {
                Name = "NET-WCF-HTTP-Activation45"
                Ensure = "Present"
                DependsOn = "[WindowsFeature]Web-Dyn-Compression"
            }
            WindowsFeature Web-Asp-Net45
            {
                Name = "Web-Asp-Net45"
                Ensure = "Present"
                DependsOn = "[WindowsFeature]NET-WCF-HTTP-Activation45"
            }
            WindowsFeature Web-Mgmt-Tools
            {
                Name = "Web-Mgmt-Tools"
                Ensure = "Present"
                DependsOn = "[WindowsFeature]Web-Asp-Net45"
            }
            WindowsFeature Web-Scripting-Tools
            {
                Name = "Web-Scripting-Tools"
                Ensure = "Present"
                DependsOn = "[WindowsFeature]Web-Mgmt-Tools"
            }

  }
} 