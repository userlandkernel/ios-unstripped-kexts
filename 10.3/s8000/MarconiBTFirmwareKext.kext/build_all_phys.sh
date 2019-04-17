#!/bin/sh

cd ../aciphyfw_bt_marconi/

# Build PHY M8B0 Samos-A0
xcodebuild -target btphy-silicon-samos_a0

# Copy bt_phy_shared_mem_ext.h only once - non dependant of PHY type
cp shared/bt_phy_shared_mem_ext.h                                                             ../aci_bt_fw/src/platform/Marconi/PHY_SILICON/

cp src/platform/common/hci_phy.xml                                                            ../aci_bt_fw/src/platform/Marconi/PHY_M8B0/
cp ../build/btphy-silicon-samos_a0.debug/bin/phy_bin_id.aci                                   ../aci_bt_fw/src/platform/Marconi/PHY_M8B0/
cp ../build/btphy-silicon-samos_a0.debug/bin/phy_fw_image.h                                   ../aci_bt_fw/src/platform/Marconi/PHY_M8B0/
cp ../build/btphy-silicon-samos_a0.debug/bin/btphy-silicon-samos_a0_log_symbols.bin           ../aci_bt_fw/src/platform/Marconi/PHY_M8B0/phy_log_symbols.bin
cp ../build/btphy-silicon-samos_a0.debug/bin/btphy-silicon-samos_a0.version                   ../aci_bt_fw/src/platform/Marconi/PHY_M8B0/phy.version
cp ../build/btphy-silicon-samos_a0.debug/bin/bt_phy.cpf                                       ../aci_bt_fw/src/platform/Marconi/PHY_M8B0/

#sed 's/\[\]/_m8b0\[\]/g' ../aci_bt_fw/src/platform/Marconi/PHY_M8B0/phy_fw_image.h > ../aci_bt_fw/src/platform/Marconi/PHY_SILICON/phy_fw_image_m8b0.h
sed -e "s/\[\]/_m8b0\[\]/g;s/const unsigned long/__attribute__ ((section(\"PHY_IMAGE_TEXT,__const\")))`echo \\\r`const unsigned long/g;" ../aci_bt_fw/src/platform/Marconi/PHY_M8B0/phy_fw_image.h > ../aci_bt_fw/src/platform/Marconi/PHY_SILICON/phy_fw_image_m8b0.h

# Build PHY T319 M8P Samos-B0
xcodebuild -target btphy-silicon_m8p-samos_b0

cp src/platform/common/hci_phy.xml                                                            ../aci_bt_fw/src/platform/Marconi/PHY_M8P/
cp ../build/btphy-silicon_m8p-samos_b0.debug/bin/phy_bin_id.aci                               ../aci_bt_fw/src/platform/Marconi/PHY_M8P/
cp ../build/btphy-silicon_m8p-samos_b0.debug/bin/phy_fw_image.h                               ../aci_bt_fw/src/platform/Marconi/PHY_M8P/
cp ../build/btphy-silicon_m8p-samos_b0.debug/bin/btphy-fpga_m8p-samos_b0_log_symbols.bin      ../aci_bt_fw/src/platform/Marconi/PHY_M8P/phy_log_symbols.bin
cp ../build/btphy-silicon_m8p-samos_b0.debug/bin/btphy-fpga_m8p-samos_b0.version              ../aci_bt_fw/src/platform/Marconi/PHY_M8P/phy.version
cp ../build/btphy-silicon_m8p-samos_b0.debug/bin/bt_phy.cpf                                   ../aci_bt_fw/src/platform/Marconi/PHY_M8P/

#sed -e "s/\[\]/_m8p\[\]/g;s/const unsigned long/__attribute__ ((section(\"PHY_IMAGE_TEXT,__const\")))`echo \\\r`const unsigned long/g;" ../aci_bt_fw/src/platform/Marconi/PHY_M8P/phy_fw_image.h > ../aci_bt_fw/src/platform/Marconi/PHY_SILICON/phy_fw_image_m8p.h
sed 's/\[\]/_m8p\[\]/g' ../aci_bt_fw/src/platform/Marconi/PHY_M8P/phy_fw_image.h > ../aci_bt_fw/src/platform/Marconi/PHY_SILICON/phy_fw_image_m8p.h

# Build PHY M8B0 Samos-B0
xcodebuild -target btphy-silicon-samos_b0

cp src/platform/common/hci_phy.xml                                                    ../aci_bt_fw/src/platform/Marconi/PHY_M8B0_SB0/
cp ../build/btphy-silicon-samos_b0.debug/bin/phy_bin_id.aci                           ../aci_bt_fw/src/platform/Marconi/PHY_M8B0_SB0/
cp ../build/btphy-silicon-samos_b0.debug/bin/phy_fw_image.h                           ../aci_bt_fw/src/platform/Marconi/PHY_M8B0_SB0/
cp ../build/btphy-silicon-samos_b0.debug/bin/btphy-silicon-samos_b0_log_symbols.bin   ../aci_bt_fw/src/platform/Marconi/PHY_M8B0_SB0/phy_log_symbols.bin
cp ../build/btphy-silicon-samos_b0.debug/bin/btphy-silicon-samos_b0.version           ../aci_bt_fw/src/platform/Marconi/PHY_M8B0_SB0/phy.version
cp ../build/btphy-silicon-samos_b0.debug/bin/bt_phy.cpf                               ../aci_bt_fw/src/platform/Marconi/PHY_M8B0_SB0/

sed -e "s/\[\]/_m8b0_sb0\[\]/g;s/const unsigned long/__attribute__ ((section(\"PHY_IMAGE_TEXT,__const\")))`echo \\\r`const unsigned long/g;" ../aci_bt_fw/src/platform/Marconi/PHY_M8B0_SB0/phy_fw_image.h > ../aci_bt_fw/src/platform/Marconi/PHY_SILICON/phy_fw_image_m8b0_sb0.h

cd -
