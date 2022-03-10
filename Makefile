web:
	rm -rf ./public
	wasm-pack build --target web
	rollup ./main.js --format iife --file ./pkg/bundle.js
	mkdir ./public && cp -r ./pkg ./public/pkg && cp -r ./static/* ./public
	cd ./public && miniserve -p 8000 --index index.html
clean:
	rm -rf ./public
	rm -rf ./target