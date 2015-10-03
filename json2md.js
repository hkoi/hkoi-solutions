fs = require("fs");

process.stdout.write('#HKOI Final Event Solutions\n\n##License for source codes in this repository\n\n');
process.stdout.write('Creative Commons Attribution-ShareAlike 4.0 International. ');
process.stdout.write('The full text of the license is available at ');
process.stdout.write('https://creativecommons.org/licenses/by-sa/4.0/legalcode.');
process.stdout.write('\n\n##Solutions\n\n');

var json = fs.readFileSync("solutions.json");
var solutions = JSON.parse(json);
var years = Object.keys(solutions);
var groups = ['senior', 'junior'];
for (var i = years.length - 1; i >= 0; i--) {
    var year = years[i];
    process.stdout.write('#' + year + '\n\n| ID | Name | Code | Slides |\n| ------ | ------ | ------ | ------ |\n');
    for (var group in groups) {
        for (var taskseq in solutions[year][groups[group]]) {
            var task = solutions[year][groups[group]][taskseq];
            process.stdout.write('| ' + task['id'] + ' | ');
            process.stdout.write(task['name_en'] + ' | ');
            if (task['code']) {
                process.stdout.write('[Pascal](' + year.replace('/', '') + '/' + task['id'] + '.pas) ');
                process.stdout.write('[C++](' + year.replace('/', '') + '/' + task['id'] + '.cpp) | ');
            } else {
                process.stdout.write(' | ');
            }
            if (task['slides']) {
                process.stdout.write('[Slides](' + task['slides'] + ') |\n');
            } else {
                process.stdout.write(' |\n');
            }
        }
    }
    process.stdout.write('\n');
}
