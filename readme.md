# WinUI 3 Unit Test templates

This project contains work in progress templates for unit testing WinUI 3 assemblies.

## Current limitations:

* Debugger does not work with VS 2022
* Test runs may occasionally fail with an error of "The active test run was aborted. Reason: Unable to communicate with test host process."
	* Rebuilding the project or reopening the solution will often fixes this issue.
* Debugger with VS 2019 does not register correctly that test run has completed; VS stays in debugging mode.
* VS Test discovery "leaks" a window when running tests, i.e. the templates that host UI will leave a window open when started through the test runner

#### Building
1. Run the  `./CopyTemplatesToExtension.ps1` script to copy the templates to the extension.
2. Build the extension