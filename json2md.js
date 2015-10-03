fs = require("fs");

process.stdout.write('#HKOI Final Event Solutions\n\n##License\n\n');
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
    process.stdout.write('#' + year + '\n');
    process.stdout.write('<table>' + '\n');
    for (var group in groups) {
        for (var taskseq in solutions[year][groups[group]]) {
            var task = solutions[year][groups[group]][taskseq];
            process.stdout.write('<tr><td>' + task['id'] + '</td>');
            process.stdout.write('<td>' + task['name_en'] + '</td>');
            if (task['code']) {
                process.stdout.write('<td>[Pascal](' + year + '/' + task['id'] + '.pas) ');
                process.stdout.write('[C++](' + year + '/' + task['id'] + '.cpp)</td>');
            } else {
                process.stdout.write('<td></td>');
            }
            if (task['slides']) {
                process.stdout.write('<td>[Slides](' + task['slides'] + ')</td></tr>\n');
            } else {
                process.stdout.write('<td></td></tr>\n');
            }
        }
    }
    process.stdout.write('</table>\n');
}
