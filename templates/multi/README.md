# TBD:package-name



## Build System Requirements

Please refer to 
https://github.com/coldrye-gittish/gittish-build-common/blob/master/README.md#build-system-requirements
for more information.


## Setting up the Workspace

Please refer to 
https://github.com/coldrye-gittish/gittish-build-common/blob/master/README.md#setting-up-the-workspace
for more information.


## Project Dependencies

* gittish-build-common

TBD: * gittish-build-python


## External Package Dependencies

n/a


## Project Layout

* Makefile

  This is the make file you will be using for building the sources and
  distribution package. There should be no need for editing this. Keeping this
  free of any customization will allow you to simply copy over the Makefile
  from the common multi project template in case that there are any changes
  to the build process.

* Makefile.subdirs.in

  Each runtime specific sub project must be appended to the SUBDIRS variable.

* <runtime>

  Runtime specific sub project folders, e.g. `python`. Provided that you use
  the templates from the gittish-build-\* projects, sub projects will be 
  integrated into the build process automatically as soon as they get added to
  the SUBDIRS variable.


## Configuring the Build Process

In order to configure the overall build process, you must run the `configure`
script.

```
cd <WORKSPACE_ROOT>/TBD:package-name
./configure
```

This will create the `CONFIG.in` file that is required by all the other projects.
