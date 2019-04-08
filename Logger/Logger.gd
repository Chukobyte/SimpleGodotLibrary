#Logger.gd
extends Reference

class_name Logger

enum _LOGGER {
	STATUS,
	MESSAGE,
	CALLER
}

enum STATUS {
	ERROR = 0,
	INFO = 1,
	WARN = 2,
	DEBUG = 3
}

var _level : int
var _log_entries := []

# Log prints all errors by default

func _init(log_level : int = STATUS.DEBUG) -> void:
	set_log_level(log_level)

func get_log_level() -> String:
	return _get_log_text_from_status(_level)

func set_log_level(log_level : int) -> void:
	_level = log_level

# Functions to log entries

func error(message : String, caller = null) -> void:
	_write_log(message, STATUS.ERROR, caller)

func info(message : String, caller = null) -> void:
	_write_log(message, STATUS.INFO, caller)

func debug(message : String, caller = null) -> void:
	_write_log(message, STATUS.DEBUG, caller)
	
func warn(message : String, caller = null) -> void:
	_write_log(message, STATUS.WARN, caller)
	
# Log writer

func _write_log(message : String, status : int, caller) -> void:
	var log_message := _format_logs(message, status, caller)
	_log_entries.append({  \
			_LOGGER.STATUS: status,  \
			_LOGGER.MESSAGE: log_message,  \
			_LOGGER.CALLER: caller  \
	})
	if _level >= status:
		print(log_message)

func _format_logs(message : String, status : int, caller) -> String:
	if caller != null:
		var caller_name : String
		if typeof(caller) == TYPE_OBJECT:
			caller_name = caller.get_class()
		else:
			caller_name = caller.get_name()
		return "[%s] [%s] %s" % [_get_log_text_from_status(status), caller_name,  message]
	else:
		return "[%s] %s" % [_get_log_text_from_status(status), message]
	
func _get_log_text_from_status(status : int) -> String:
	match status:
		STATUS.INFO:
			return "INFO"
		STATUS.WARN:
			return "WARN"
		STATUS.DEBUG:
			return "DEBUG"
		STATUS.ERROR:
			return "ERROR"
	return ""

func print_all_logs() -> void:
	for current_log in _log_entries:
		var log_message := _format_logs(  \
								current_log[_LOGGER.MESSAGE],  \
								current_log[_LOGGER.STATUS],  \
								current_log[_LOGGER.CALLER]  \
							)
		print(log_message)
