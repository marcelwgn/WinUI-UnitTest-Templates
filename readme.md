# WinUI 3 Unit Test templates

This project contains work in progress templates for unit testing WinUI 3 assemblies.

You can download the extension from the [Visual Studio marketplace](https://marketplace.visualstudio.com/items?itemName=chingucoding.winuiunittesttemplates).

## Updates

This extension has been updated to work with current stable WinUI and MSTest versions as of 03 October 2023.

TargetFramework and TargetPlatformMinVersion are:

```
     <TargetFramework>net6.0-windows10.0.19041.0</TargetFramework>
     <TargetPlatformMinVersion>10.0.17763.0</TargetPlatformMinVersion>
```

Package references are:

```
     <PackageReference Include="Microsoft.WindowsAppSDK" Version="1.4.230913002" />
     <PackageReference Include="Microsoft.Windows.SDK.BuildTools" Version="10.0.22621.756" />
     <PackageReference Include="MSTest.TestAdapter">
         <Version>3.1.1</Version>
     </PackageReference>
     <PackageReference Include="MSTest.TestFramework">
         <Version>3.1.1</Version>
     </PackageReference>
     <PackageReference Include="Microsoft.TestPlatform.TestHost">
         <Version>17.7.2</Version>
         <ExcludeAssets>build</ExcludeAssets>
     </PackageReference>
```

## Current issues/limitations:

* Test runs may occasionally fail with an error of "The active test run was aborted. Reason: Unable to communicate with test host process."
	* Rebuilding the project, reopening the solution or reopening VS will often fixes this issue.
* Debugger with VS 2019 does not register correctly that test run has completed; VS stays in debugging mode.
* > *VS Test discovery "leaks" two window when running tests, i.e. the templates that host UI will leave a window open when started through the test runner and running the tests will also leave the app open.*
* This was a problem with WinAppSDK 1.0.0 but does not seem to be present with the latest version of Visual Studio 2022 and WinAppSDK 1.0.3

## Usage

The Unit Test project must compile to a WinUI application (unpackaged app) to support testing operations dispatched to the UI thread.

WinUI 3 does not support referencing one application project from another - you will receive errors on build similar to the following:

` APPX1101: Payload contains two or more files with the same destination path 'resources.pri' `

To support unit testing move all code under test to a WinUI Class Library project. The Class Library can then 
be referenced from both the unit test project and the main application project. The application project becomes
a lightweight container primarily for packaging and deployment. It will contain the application startup code, 
configuration, DI etc. that is not necessary for unit tests.

### Building the extension
1. Run the  `./CopyTemplatesToExtension.ps1` script to copy the templates to the extension.
2. Build the extension