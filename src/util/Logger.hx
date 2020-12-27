package util;


class Logger {
    private static var ansiColors:Map<String,String> = new Map();

    private var prefix:String;

    public function new(prefix:String = "Logger") {
        this.prefix = prefix;
        ansiColors['black'] = '\033[0;30m';
		ansiColors['red'] = '\033[31m';
		ansiColors['green'] = '\033[32m';
		ansiColors['yellow'] = '\033[33m';
		ansiColors['blue'] = '\033[1;34m';
		ansiColors['magenta'] = '\033[1;35m';
		ansiColors['cyan'] = '\033[0;36m';
		ansiColors['grey'] = '\033[0;37m';
		ansiColors['white'] = '\033[1;37m';
    }

    public function info(msg:String) {
        Sys.println(ansiColors['grey'] + '[INFO][$prefix] ' + msg);
    }

    public function debug(msg:String) {
        Sys.println(ansiColors['cyan'] + '[DEBUG][$prefix] ' + msg);
    }

    public function warn(msg:String) {
        Sys.println(ansiColors['yellow'] + '[WARN][$prefix] ' + msg);
    }

    public function error(msg:String) {
        Sys.println(ansiColors['red'] + '[ERROR][$prefix] ' + msg);
    }

    public function fatal(msg:String) {
        Sys.println(ansiColors['red'] + '[FATAL][$prefix] ' + msg);
        Sys.exit(-1);
    }
}