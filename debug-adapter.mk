ifeq ($(DEBUG_ADAPTER),openocd)
include $(dir $(realpath $(lastword $(MAKEFILE_LIST))))openocd.mk
else ifeq ($(DEBUG_ADAPTER),black_magic)
include $(dir $(realpath $(lastword $(MAKEFILE_LIST))))black-magic.mk
else ifeq ($(DEBUG_ADAPTER),other)
include $(dir $(realpath $(lastword $(MAKEFILE_LIST))))other.mk
else
$(error "DEBUG_ADAPTER must be openocd, black_magic, or other")
endif

$(BUILD_DIR)/$(TARGET).svd: $(SVD)
	@mkdir -p $(BUILD_DIR)
	@cp $(SVD) $@
