
# Use buf tool to generate go stub handlers and types.
# Configurations: in *.proto definition directory; project-root/buf.gen.yaml
gen-api-stubs:
	~/bin/buf generate --template buf.gen.yaml .

clean:
	rm -rf ./proto/gen

all: clean gen-api-stubs
