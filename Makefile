PANO = $(CSGO)csgo/panorama/code.pbin

airgap/panorama:
	unzip -n "$(PANO)" -d ./airgap/

run: airgap/panorama
	echo Done.
