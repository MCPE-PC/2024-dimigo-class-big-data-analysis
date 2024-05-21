const { readFileSync, writeFileSync } = require('fs');
const { join } = require('path');

writeFileSync(
	join(__dirname, 'extracted.r'),
	readFileSync(join(__dirname, 'Notebook.Rmd'), 'utf8')
		.match(/(```)\{r(((.|\n)(?!```))+)/g)
		.map((i) => i.replace(/^```{r(.+)/, '').trim())
		.join('\n\n')
);
