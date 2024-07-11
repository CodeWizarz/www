const { program } = require('commander');
const glob = require('glob');
const formatMarkdown = require('../lib/format_markdown');

function main(args) {
  program.requiredOption('-p, --path <glob-pattern>', 'Path of the markdown files to format');
  program.parse(args);
  formatMarkdown(glob.sync(program.path));
}

main(process.argv);
