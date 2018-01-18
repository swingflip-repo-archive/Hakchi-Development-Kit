
all: out/dev_kit_mod_v1.hmod

out/dev_kit_mod_v1.hmod:
	mkdir -p out/
	cd mod/; tar -czvf "../$@" *
	touch "$@"

clean:
	-rm -rf out/

.PHONY: clean
