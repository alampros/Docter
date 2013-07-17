#!/usr/bin/env node
var exec = require('child_process').exec,
	spawn = require('child_process').spawn,
	// gfm = spawn('./bin/github-flavored-markdown.rb');
	gfm = spawn('/usr/local/bin/gfm');

	gfm.stdout.on('data', function(data) {
		process.stdout.write(data);
	});
	gfm.on('exit',function(ecode){

	})

process.stderr.on('data',function(err) {
	process.stdout.write('ERR: '+err);
})

process.stdin.resume();
process.stdin.setEncoding('utf8');

process.stdin.on('data', function (chunk) {
	gfm.stdin.write(chunk);
	gfm.stdin.end();
});
