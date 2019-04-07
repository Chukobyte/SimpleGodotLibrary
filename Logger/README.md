# Simple Godot Logger

*Version 1.0.0*

--------------
## Description

A simple *Logger* class is a GDScript that defines *Logger* as a type that provides a logging API for
projects developed with [Godot Engine](https://godotengine.org).

-------------
## Properties

```
int _level
	get_log_level() # setter
	set_log_level(log_level : int) # getter
```
Log level that is set.  Correralates with enum `STATUS`.

```
Array _log_entries
	print_log_entries() # prints all logs
```
Stores all log entries

-----------
## Methods:

```
_init(log_level : int = STATUS.DEBUG)
```
init method  

```
void error(message, caller = null)
void info(message, caller = null)
void debug(message, caller = null)
void warn(message, caller = null)
```
Creates log entry.  `message` is the log text string.  `caller` is the Object invoking the logger (use `self`).

----------------
## Enumerations:

```
enum STATUS  
    ERROR = 0
    INFO = 1
    WARN = 2
    DEBUG = 3
```  
Used to set log level.  Log status levels is ordered by least verbose.

--------
## Usage

Initialize log:  
```
var logger := Logger.new()
```

The log level is set to print everything to the console by default `Logger.STATUS.DEBUB`.  You can override the default by doing the following:  
```
var logger := Logger.new(Logger.STATUS.INFO)
```

### Logging Examples:
```
logger.error("No meta data for world map!") # [DEBUG] No meta data for world map  
logger.info("Updating server information...") # [INFO] Updating server information  
logger.warn("Ping taking a long time!") # [WARN] Ping taking a long time!  
logger.debug("Server Name = West") # [DEBUG] Server Name = West  
```  
```
#Lobby.gd

# Log caller name
logger.info(  \
    "I wonder what node is calling this?",  \
    self  \
)
# [INFO] [Lobby] I wonder what node is calling this?
```

----------------
## Compatability

Godot >= 3.1
