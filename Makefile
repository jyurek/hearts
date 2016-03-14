all: hearts.js styles/hearts.css

hearts.js: src/*.elm
	elm-make src/Main.elm --output=hearts.js

styles/hearts.css: styles/hearts.scss
	scss styles/hearts.scss styles/hearts.css

clean:
	rm hearts.js styles/*.css
