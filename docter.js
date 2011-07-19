#!/usr/bin/env node

var cli = require('cli').enable('version','status'),
	spawn = require('child_process').spawn,
	log = require('logging'),
	clc = require('cli-color');

cli.setApp('docter', "0.0.1");

cli.parse({
	system:		['s', 'Check for system software updates','boolean',true]
});


function parseFile(file) {
	log(file);
	if (cli.args.length) {
		parseFile(cli.args.shift());
	}
}

if (cli.args.length) {
	parseFile(cli.args.shift());
}














function cleanup() {
	//cleanup
	cli.spinner('\n',true);
	console.log('\u000D');
	cli.exit(0);
}



function indentLines(str,prefix) {
	str = str.toString();
	prefix = clc.cyan("[")+clc.cyan.bold(prefix)+clc.cyan("]") || '';
	var arr = str.toString().split('\n'),
		ind = "–"+prefix+"\t",
		sep = "\n"+ind;
	return ind+stripEmpties(arr).join(sep);
}


function stripEmpties(arr) {
	var ret = [];
	arr.forEach(function(elm,idx){
		if (elm.trim() !== "") ret.push(elm);
	});
	return ret;
}


function outlog(str) {
	cli.native.util.print('\u000D                         \u000D')
	console.log(str);
	cli.native.util.print('\u000D');
}






