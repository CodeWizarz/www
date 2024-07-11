## Formatting markdown

The `yarn format-markdown` command formats a markdown file adhering to a set of
formatting preferences described in the sections below. The purpose of the formatter
is enforcing a single markdown formatting style across all markdown files in this
project. To format a file, specify the file path using the `-p` flag, for example:

```
yarn format-markdown -p sites/handbook/source/handbook/communication/index.md
```

### Bold and emphasis

Use `**` for bold text and `_` for emphasized text.

### List markers

- `-` for unordered lists
- `1.` non-incremental numbered lists.
### List indentation

For spaces for indented list items.

### Fences for code blocks

Convert all indented code blocks

```markdown
    ls /path/to/directory
```

to code blocks delimited by fences

```markdown

```
ls /path/to/directory
```

```
