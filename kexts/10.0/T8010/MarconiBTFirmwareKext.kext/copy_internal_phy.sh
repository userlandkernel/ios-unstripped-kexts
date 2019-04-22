#!/bin/sh

phy_target=$1
phy_target_m8p_string=m8p
phy_target_m8w_string=m8w

echo "$0 $1"

# Current directory is aci_bt/aci_bt_fw

BUILD_INTERNAL_PHY_DIR="../../build_internal_phy"

if [ -d "$BUILD_INTERNAL_PHY_DIR" ]; then
	rm -rf "$BUILD_INTERNAL_PHY_DIR"
fi
mkdir -p "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi
rm -rf "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/*
cp -rf SOC/Marconi/* "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/

cd ../aciphyfw_bt_marconi/

# Copy bt_phy_shared_mem_ext.h only once - non dependant of PHY type
cp shared/bt_phy_shared_mem_ext.h                                               "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/PHY_SILICON/

if [[ "$phy_target" == *$phy_target_m8p_string* ]]; then
	# Copy PHY target to M8P
	cp src/platform/common/hci_phy.xml                                          "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/PHY_M8P/
	cp ../build/"$phy_target".debug/bin/phy_bin_id.aci                          "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/PHY_M8P/
	cp ../build/"$phy_target".debug/bin/phy_fw_image.h                          "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/PHY_M8P/
	cp ../build/"$phy_target".debug/bin/"$phy_target"_log_symbols.bin           "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/PHY_M8P/phy_log_symbols.bin
	cp ../build/"$phy_target".debug/bin/"$phy_target".version                   "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/PHY_M8P/phy.version

	cp ../build/"$phy_target".debug/bin/"$phy_target".version                   "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/PHY_M8W/phy.version
	cp ../build/"$phy_target".debug/bin/"$phy_target".version                   "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/PHY_M8B0/phy.version

	cp ../build/"$phy_target".debug/bin/bt_phy.cpf                              "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/PHY_M8P/

	sed 's/\[\]/_m8p\[\]/g' "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/PHY_M8P/phy_fw_image.h > "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/PHY_SILICON/phy_fw_image_m8p.h
elif [[ "$phy_target" == *$phy_target_m8w_string* ]]; then
	# Copy PHY target to M8W
	cp src/platform/common/hci_phy.xml                                          "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/PHY_M8W/
	cp ../build/"$phy_target".debug/bin/phy_bin_id.aci                          "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/PHY_M8W/
	cp ../build/"$phy_target".debug/bin/phy_fw_image.h                          "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/PHY_M8W/
	cp ../build/"$phy_target".debug/bin/"$phy_target"_log_symbols.bin           "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/PHY_M8W/phy_log_symbols.bin
	cp ../build/"$phy_target".debug/bin/"$phy_target".version                   "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/PHY_M8W/phy.version

	cp ../build/"$phy_target".debug/bin/"$phy_target".version                   "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/PHY_M8P/phy.version
	cp ../build/"$phy_target".debug/bin/"$phy_target".version                   "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/PHY_M8B0/phy.version

	cp ../build/"$phy_target".debug/bin/bt_phy.cpf                              "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/PHY_M8W/

	sed -e "s/\[\]/_m8w\[\]/g;s/const unsigned long/__attribute__ ((section(\"PHY_IMAGE_TEXT,__const\")))`echo \\\r`const unsigned long/g;" "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/PHY_M8W/phy_fw_image.h > "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/PHY_SILICON/phy_fw_image_m8w.h
else
	# Copy PHY target to M8B0
	cp src/platform/common/hci_phy.xml                                          "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/PHY_M8B0/
	cp ../build/"$phy_target".debug/bin/phy_bin_id.aci                          "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/PHY_M8B0/
	cp ../build/"$phy_target".debug/bin/phy_fw_image.h                          "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/PHY_M8B0/
	cp ../build/"$phy_target".debug/bin/"$phy_target"_log_symbols.bin           "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/PHY_M8B0/phy_log_symbols.bin
	cp ../build/"$phy_target".debug/bin/"$phy_target".version                   "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/PHY_M8B0/phy.version

	cp ../build/"$phy_target".debug/bin/"$phy_target".version                   "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/PHY_M8P/phy.version
	cp ../build/"$phy_target".debug/bin/"$phy_target".version                   "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/PHY_M8W/phy.version

	cp ../build/"$phy_target".debug/bin/bt_phy.cpf                              "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/PHY_M8B0/

	sed -e "s/\[\]/_m8b0\[\]/g;s/const unsigned long/__attribute__ ((section(\"PHY_IMAGE_TEXT,__const\")))`echo \\\r`const unsigned long/g;" "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/PHY_M8B0/phy_fw_image.h > "$BUILD_INTERNAL_PHY_DIR"/SOC/Marconi/PHY_SILICON/phy_fw_image_m8b0.h
fi

cd -
