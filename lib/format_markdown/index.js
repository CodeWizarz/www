const fs = require('fs');
const remark = require('remark');
const frontmatter = require('remark-frontmatter');
const stringify = require('remark-stringify');

const isString  = (value) => typeof value === 'string';

/**
 * Fixes nesting spaces for numbered lists. Nested numbered
 * lists should have at least 3 spaces.
 * Before
 * 1. List
 *   1. Nested list
 * After
 * 1. List
 *    1. Nested list
 * @param {String} line Markdown file line to fix
 */
const fixNumberedListIndentation = (line) => line.replace(/^\s{2}(\d{1,3}\.)/g, '   $1');

/**
 * Fixes applied to the markdown file before remark-stringify
 * is executed.
 */
const preFormattingFixes = [
  fixNumberedListIndentation,
];

/**
 * Removes blank line between an attribute definition and its
 * related element.
 *
 * Before
 * ## Table of contents
 *
 * {:.no_toc .hidden-md .hidden-lg}
 *
 * After
 * ## Table of contents
 * {:.no_toc .hidden-md .hidden-lg}
 * @param {String} line Markdown file line to fix
 * @param {Number} index Line position
 * @param {String} content Original content
 */
const removeBlankLineBeforeAttributeDefinition = (line, index, content) => {
  const nextLine = content.split('\n')[index + 1];

  return /{:.+?}/.test(nextLine) && line === '' ? null : line;
}

/**
 * Removes left white spaces inserted by remark-stringify in attribute
 * definitions
 *
 * Before
 * - TOC
 *   {:toc .hidden-md .hidden-lg}
 *
 * After
 * - TOC
 * {:toc .hidden-md .hidden-lg}
 *
 * @param {String} line Markdown file line to fix
 */
const leftTrimAttributeDefinition = line => line.replace(/^\s+({:.+?})/g, '$1');

/**
 * Unescapes characters unnecessarily escaped by remark-stringify. The following
 * characters are unescaped:
 *
 * 1. *
 * 2. &
 * 3. _
 * 4. (
 * 5. )
 *
 * Before
 * param1=value1\&param2=value2
 *
 * After
 * param2=value2&param2=value2
 *
 * @param {String} line Markdown file line to fix
 */
const fixEscapedCharacters = line => line.replace(/\\(\*|&|_|\(|\))/g, '$1');

/**
 * Fixes list items with a marker that is not separated from a space
 * character
 *
 * Before
 *  \-list item
 *
 * After
 *  - list item
 *
 * @param {String} line Markdown file line to fix
 */
const separateListMarkerFromContent = line => line.replace(/^(\s*)\\(-)(.+)/g, '$1$2 $3');

/**
 * Removes unnecessary spaces between a list marker and the list content
 *
 * Before
 * -    List content
 *
 * After
 * - List content
 *
 * @param {String} line Markdown file line to fix
 */
const trimUnorderedListMarker = line => line.replace(/^(\s*)(-|\d+\.)\s+/, '$1$2 ')

/**
 * Removes backslash introduced by remark-stringify at the end of some lines
 *
 * Before
 * foo bar.\
 *
 * After
 * foo bar.
 *
 * @param {String} line Markdown file line to fix
 */
const removeBackslashAtEndOfLine = line => line.replace(/\\$/, '');


/**
 * Encodes < & > symbols that are decoded and escaped by remark-stringify
 *
 * Before
 * \<your domain>
 *
 * After
 * &lt;your domain&gt;
 *
 * @param {String} line Markdown file line to fix
 */
const encodeLtAndGtCharacters = line => line.replace(/\\<(.+?)>/g, '&lt;$1&gt;');

/**
 * Fixes applied to the markdown file after remark-stringify
 * is executed.
 */
const postFormattingFixes = [
  fixEscapedCharacters,
  separateListMarkerFromContent,
  leftTrimAttributeDefinition,
  removeBlankLineBeforeAttributeDefinition,
  trimUnorderedListMarker,
  removeBackslashAtEndOfLine,
  encodeLtAndGtCharacters,
];

/**
 * Apply one of more fixes to a line.
 *
 * @param {Array} fixes list of fix functions
 * @param {String} line line to fix
 * @param {Number} index line position
 * @param {String} content entire unfixed content
 */
const applyFixes = (fixes, line, index, content) => fixes.reduce((fixedLine, fix) =>
    isString(fixedLine) ? fix(fixedLine, index, content) : fixedLine,
  line);

/**
 * Apply one of more fixes to a markdown content.
 *
 * @param {Array} fixes list of fix functions
 * @param {String} line line to fix
 * @param {Number} index line position
 * @param {String} content entire unfixed content
 */
const fixContent = (fixes, content) => content.split('\n')
  .map((line, index) => applyFixes(fixes, line, index, content))
  .filter(fixedLine => isString(fixedLine))
  .join('\n');

/**
 * Loads a markdown file and performs the following changes
 *
 * - Applies formatting fixes that should happen before remark-stringify
 * - Formats file using markdown-stringify
 * - Applies post formatting fixes that revert unnecessary changes applied
 *   by remark-stringify
 * @param {String} path file path
 */
function formatFile(path) {
  const fsParams = { encoding: 'utf-8' };
  const content = fs.readFileSync(path, fsParams);
  const preFormatted = fixContent(preFormattingFixes, content);

  remark()
    .use(stringify, {
      listItemIndent: "tab",
      incrementListMarker: false,
      bullet: "-",
      rule: "-",
      emphasis: '_',
      ruleSpaces: false,
      fences: true,
      tablePipeAlign: false,
      tightDefinitions: true,
    })
    .use(frontmatter)
    .process(preFormatted, (error, output) => {
      if(!error) {
        fs.writeFileSync(path, fixContent(postFormattingFixes, output.contents), fsParams);
      }
    });
}

const formatFiles = (files) => {
  files.forEach(formatFile);
}

module.exports = formatFiles;
