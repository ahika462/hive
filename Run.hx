import haxe.io.Path;
import sys.io.File;
import haxe.iterators.ArrayIterator;

var args:ArrayIterator<String>;

function main() {
	args = new ArrayIterator(Sys.args());
	
	var command = args.next();
	var platform = args.next();

	var result:Int = 0;

	switch(command) {
		case 'build' | 'test':
			var hxml:Hxml = Hxml.parse('project.hxml');
			var output:String = Path.normalize(Path.join([
				hxml.getArg('exportPath').sub ?? 'bin/$platform',
				hxml.getArg('exportFile').sub ?? 'hive'
			]));
			result = Sys.command('haxe', ['project.hxml', '--${platform == 'hlc' ? 'hl' : platform} $output.${platform == 'hlc' ? 'c' : platform}']);

		default:
			Sys.println('Unknown command!');
			return;
	}

	if (result != 0)
		Sys.println('Command exited with error $result');
}

typedef HxmlArg = {
	var name:String;
	var sub:String;
	var value:String;
}

class Hxml {
	var args:Array<HxmlArg> = [];

	function new() {}

	public function getArg(name:String):HxmlArg {
		var iter:ArrayIterator<HxmlArg> = new ArrayIterator(args);
		while (iter.hasNext()) {
			var arg:HxmlArg = iter.next();
			if (arg.name == name)
				return arg;
		}
			
		return {
			name: null,
			sub: null,
			value: null
		};
	}

	public static function parse(path:String):Hxml {
		var hxml:Hxml = new Hxml();

		var content:String = File.getContent(path);

		for (line in content.split('\n')) {
			var arr:Array<String> = line.split(' ');
			hxml.args.push({
				name: arr[0],
				sub: arr[1],
				value: arr[1] != null ? arr[1].split('=')[1] : null
			});
		}
		return hxml;
	}
}