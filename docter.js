#!/usr/local/bin/node
var exec = require('child_process').exec,
	spawn = require('child_process').spawn,
	gfm = spawn('/Projects/docter/bin/github-flavored-markdown.rb'),
	syncbuffer = '';

	gfm.stdout.on('data', function(data) {
		syncbuffer += data.toString();
	});
	gfm.on('exit',function(ecode){
		process.stdout.end(syncbuffer,'utf8');
	})

process.stdin.resume();
process.stdin.setEncoding('utf8');

process.stdin.on('data', function (chunk) {
	gfm.stdin.write(chunk);
	gfm.stdin.end();
});
