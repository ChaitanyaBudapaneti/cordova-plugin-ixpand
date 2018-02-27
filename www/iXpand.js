var exec = require('cordova/exec');

exports.coolMethod = function (arg0, success, error) {
    exec(success, error, 'iXpand', 'coolMethod', [arg0]);
};

exports.writeFile = function (arg0, success, error) {
    exec(success, error, 'iXpand', 'writeFile', [arg0]);
};
