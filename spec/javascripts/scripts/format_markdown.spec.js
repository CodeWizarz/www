const fs = require('fs');
const formatMarkdown = require('../../../lib/format_markdown');

jest.mock('fs');

describe('scripts/markdown-formatter', () => {
  it.each`
  original                                                        | transformed
  ${'## Table of contents\n\n{:.no_toc .hidden-md .hidden-lg}\n'} | ${'## Table of contents\n{:.no_toc .hidden-md .hidden-lg}\n'}
  ${'1. List item\n  1. Nested list item\n'}                      | ${'1. List item\n    1. Nested list item\n'}
  ${'-List item\n'}                                               | ${'- List item\n'}
  ${'- TOC\n   {:toc .hidden-md .hidden-lg}\n'}                   | ${'- TOC\n{:toc .hidden-md .hidden-lg}\n'}
  ${'-   TOC\n'}                                                  | ${'- TOC\n'}
  ${'1.   TOC\n'}                                                 | ${'1. TOC\n'}
  ${'1. TOC\n   1.   Nested TOC\n'}                               | ${'1. TOC\n    1. Nested TOC\n'}
  ${'foo\\&\\*\\(\\)\\_bar\n'}                                    | ${'foo&*()_bar\n'}
  `('\nbefore:\n$original\nafter:\n$transformed', ({ original, transformed }) => {
    const filePath = '/bar/foo.md';

    fs.readFileSync.mockReturnValueOnce(original);

    formatMarkdown([filePath]);

    expect(fs.readFileSync).toHaveBeenCalledWith(filePath, { encoding: 'utf-8' });
    expect(fs.writeFileSync).toHaveBeenCalledWith(filePath, transformed, { encoding: 'utf-8' });
  });

  afterEach(() => {
    fs.readFileSync.mockReset();
    fs.writeFileSync.mockReset();
  });
});
