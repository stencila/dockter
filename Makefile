all: format lint cover build docs

# Shortcuts to NPM scripts

setup:
	npm install

format:
	npm run format

lint:
	npm run lint

test:
	npm test

cover:
	npm run test:cover

build:
	npm run build

docs:
	npm run docs
.PHONY: docs

images:
	npm run images
.PHONY: images

# Create a demo by running the `demo.sh` file.
# Generates a `demo.cast` file
demo: demo-magic.sh
	asciinema rec -c "./demo.sh -n" --overwrite demo.cast

# Play the last recorded demo
demo-play:
	asciinema play demo.cast

# Upload the last recorded demo
demo-upload:
	asciinema upload demo.cast

# Download the `demo-magic.sh` script.
demo-magic.sh:
	curl https://raw.githubusercontent.com/paxtonhare/demo-magic/master/demo-magic.sh > demo-magic.sh

# Create an animated GIF of the demo.
# Note: this can be memory intensive for long demos; you probably only
# want to do this for short demos.
demo-gif:
	docker run --rm -v $$PWD:/data asciinema/asciicast2gif demo.cast demo.gif
