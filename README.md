# Bitrise CLI example plugin #1

** Bitrise CLI Example Plugin, which demonstrates how bitrise plugin works. **

** This plugin is an example for `Source Plugins`**

## How to use this Plugin

Can be run directly with the [bitrise CLI](https://github.com/bitrise-io/bitrise), requires version 1.3.0 or newer.

First install the plugin:

```
bitrise plugin install --source https://github.com/godrei/plugins-example.git
```

After that, you can use it:

```
bitrise :example
```

## Guidelines for Plugin Development

### Plugin types:

* By trigger:

	* **Command Plugins**

  		*Plugins which can run by direct calling `bitrise :my-command-plugin`.*

	* **Trigger Plugins**

  		*Plugins which are triggered automatically by specific bitrise events.*

* By executable:

	* **Source Plugins**

  		*This type of plugins have a `bitrise-plugin.sh` shell script file in project root and this file will be executed during the plugin's run.*

  	* **Binary plugins**

  		*This type of plugins should have `executable` field in bitrise-plugin.yml, the given binary will be executed.*



### Plugin project structure

* **.git/ **

  *[required] All plugin should be a git repository.*

* **bitrise-plugin.sh**

  *[required for `Source Plugins` ] The entry point for plugins which runs from source (this shell script file will be executed, by running the plugin).*

* **bitrise-plugin.yml**

  *[required] Contains informations about the plugin.*

```
name: my-plugin					#required field
description: |- 				#optional field
  My plugin's description.
  Can be multiline too.
trigger: Trigger event name		#optional field
executable:						#optional field
  osx: https://github.com/my/plugin/executable/for/osx
  linux: https://github.com/my/plugin/executable/for/linux
requirements:					#optional field
- tool: envman
  min_version: "1.0.0"
  max_version: ""
- tool: stepman
  min_version: "1.0.0"
  max_version: ""
- tool: bitrise
  min_version: 1.3.0
  max_version: ""
```

### Available trigger events:

* **DidFinishRun**

  *BITRISE_PLUGIN_INPUT_TRIGGER=DidFinishRun*

  *BITRISE_PLUGIN_INPUT_PAYLOAD=Contains bitrise run results*

### Plugin inputs

Plugin becomes informations from bitrise cli through environment variables.

Following environmnets will be passed to the plugin:

* **BITRISE_PLUGIN_INPUT_BITRISE_VERSION**

  *Contains the runner bitrise cli's version.*

* **BITRISE_PLUGIN_INPUT_PLUGIN_MODE**

  *Contains the plugin mode. [options: event, command]*

* **BITRISE_PLUGIN_INPUT_DATA_DIR**

  *Plugin can store data (like config file) in this directory*.

* **BITRISE_PLUGIN_INPUT_TRIGGER**

  *Available for `Trigger Plugins` only. Contains the event name which triggered the plugin. [options: DidFinishRun]*

* **BITRISE_PLUGIN_INPUT_PAYLOAD**

   *Available for `Trigger Plugins` only. This environment contains `event` specific data.*

### Plugin outputs

Plugin should send informations to bitrise through `BITRISE_PLUGIN_OUTPUT` environment variables.

### Plugin requirements

Plugin can require bitrise tools. Every tool requirements can specify `min_version` and `max_version`.

This requirements will be checked througth the plugin install.

Currently supporting tool requirements:

* **bitrise**
* **stepman**
* **envman**

Notes:

* Any missing tool (in plugin requirement list) will be skipped in check (i.e.: no requirements for this tool).
* Any empty version (in plugin requirement list) will be skipped in check (i.e.: no requirements for this type of version).
