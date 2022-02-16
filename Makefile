# Alternative GNU Make workspace makefile autogenerated by Premake

ifndef config
  config=debug
endif

ifndef verbose
  SILENT = @
endif

ifeq ($(config),debug)
  ConsoleDimensions_config = debug
  Sandbox_config = debug

else ifeq ($(config),release)
  ConsoleDimensions_config = release
  Sandbox_config = release

else
  $(error "invalid configuration $(config)")
endif

PROJECTS := ConsoleDimensions Sandbox

.PHONY: all clean help $(PROJECTS) 

all: $(PROJECTS)

ConsoleDimensions:
ifneq (,$(ConsoleDimensions_config))
	@echo "==== Building ConsoleDimensions ($(ConsoleDimensions_config)) ===="
	@${MAKE} --no-print-directory -C ConsoleDimensions -f Makefile config=$(ConsoleDimensions_config)
endif

Sandbox: ConsoleDimensions
ifneq (,$(Sandbox_config))
	@echo "==== Building Sandbox ($(Sandbox_config)) ===="
	@${MAKE} --no-print-directory -C Sandbox -f Makefile config=$(Sandbox_config)
endif

clean:
	@${MAKE} --no-print-directory -C ConsoleDimensions -f Makefile clean
	@${MAKE} --no-print-directory -C Sandbox -f Makefile clean

help:
	@echo "Usage: make [config=name] [target]"
	@echo ""
	@echo "CONFIGURATIONS:"
	@echo "  debug"
	@echo "  release"
	@echo ""
	@echo "TARGETS:"
	@echo "   all (default)"
	@echo "   clean"
	@echo "   ConsoleDimensions"
	@echo "   Sandbox"
	@echo ""
	@echo "For more information, see https://github.com/premake/premake-core/wiki"