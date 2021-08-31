.PHONY: clean clean-all serve check dev build

# * Utils
# Clean files; keep folders, including node_modules
clean:
	git clean -Xf

# Clean up everything ignored and not committed
clean-all:
	git clean -Xdf

# Start a server.
serve:
	npx sirv dist --no-clear

# Svelte compiler warnings.
check:
	svelte-check --tsconfig ./tsconfig.json

# * Development

dev-js:
	npx rollup -c -w

dev:
	npx concurrently "make dev-js" "make serve" "xdg-open 'http://localhost:5000'"

# * Build
build: $(wildcard src/*.svelte) $(wildcard src/*.js)
	npx rollup -c
