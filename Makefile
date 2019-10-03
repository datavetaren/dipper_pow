#
# Recurse into sub-directories and build and test
#

MODULES := pow

yellow="\033[0;33m"
off="\033[0m"

.PHONY: all

all:
	@echo $(yellow)$(bold) Modules to check: $(MODULES) $(off);
	@for dir in $(addprefix src/, $(MODULES)); do \
	echo $(yellow)$(bold) --------------------------------------- $(off); \
	echo $(yellow)$(bold)  Building $$dir $(off); \
	echo $(yellow)$(bold) --------------------------------------- $(off); \
	$(MAKE) -C $$dir || exit 1; \
	echo $(yellow)$(bold) --------------------------------------- $(off); \
	echo $(yellow)$(bold)  Testing $$dir $(off); \
	echo $(yellow)$(bold) --------------------------------------- $(off); \
	$(MAKE) -C $$dir test || exit 1; \
	done;

clean:
	@rm -rf out
	@rm -rf bin

