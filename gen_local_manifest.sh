#!/bin/sh

HEAD=$((`grep -n '<project ' local_manifest.xml.sample | head -n 1 | cut -d ':' -f 1` - 1))
TAIL=$((`grep -n '<project ' local_manifest.xml.sample | tail -n 1 | cut -d ':' -f 1` + 1))

head -n $HEAD local_manifest.xml.sample
grep  TheMuppets/proprietary_vendor_ default.xml |
sed -e 's#name=" TheMuppets/proprietary_vendor_\([^"]*\)"#path="vendor/\1" name=" TheMuppets/proprietary_vendor_\1"#'
tail -n +$TAIL local_manifest.xml.sample
