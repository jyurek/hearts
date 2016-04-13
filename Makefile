all: hearts.js styles/hearts.css

open: all
	open index.html

hearts.js: src/*.elm
	elm-make src/Main.elm --output=hearts.js --warn

styles/hearts.css: styles/hearts.scss
	scss styles/hearts.scss styles/hearts.css

clean:
	rm hearts.js styles/*.css
