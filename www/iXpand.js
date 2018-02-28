var exec = require('cordova/exec');
var  iXpand = function  () {
	
}
iXpand.prototype.coolMethod = function (arg0, success, error) {
    exec(success, error, 'iXpand', 'coolMethod', [arg0]);
};

iXpand.prototype.writeFile = function (arg0, success, error) {
    exec(success, error, 'iXpand', 'writeFile', [arg0]);
};

var loiXpand = new iXpand();
module.exports = loiXpand;

// Make plugin work under window.plugins
if (!window.plugins) {
    window.plugins = {};
}
if (!window.plugins.iXpand) {
    window.plugins.iXpand = loiXpand;
}