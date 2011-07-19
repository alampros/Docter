#!/usr/bin/env node

var cli = require('cli'),
	spawn = require('child_process').spawn,
	fs = require('fs'),
	clc = require('cli-color');

cli.setApp('docter', "0.0.1");

cli.withStdin(function(lines) {
	var gfm = spawn('gfm');
	gfm.stdin.write(lines);
	gfm.stdin.end();
	
	
	var syncbuffer = '';
	gfm.stdout.on('data', function(data) {
		// process.stdout.write(data);
		syncbuffer += data.toString();
	});
	gfm.on('exit',function(ecode){
		// process.stdout.write(syncbuffer);
		
		process.stdout.end(syncbuffer,'utf8');
		// process.stdout.end();
		// process.exit();
	})
});







