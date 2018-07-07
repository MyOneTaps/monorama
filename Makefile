PANO = $(CSGO)csgo/panorama/code.pbin

airgap:
	mkdir airgap

extract: airgap/panorama

$(PANO+".bak"):
	cp "$(PANO)" "$(PANO+".bak")"

backup: $(PANO+".bak")

airgap/panorama: backup airgap
	unzip -n "$(PANO)" -d ./airgap/

airgap/code.pbin: airgap
	zip -r --compression-method store ./airgap/code.pbin ./airgap/panorama/

package: airgap/code.pbin

insert: package
	@echo "THIS WILL MODIFY YOUR GAME FILES! You can revert this later with \`make revert\`"; \
	echo "I TAKE NO RESPONSIBILITY FOR VAC BANS OR ANY OTHER MISHAPS "; \
	echo "(though you shouldn't get a vac ban, cmon). "; \
	echo "Press <Enter> to continue or <CTRL-C> to cancel."; \
	read foo; \
	mv "./airgap/code.pbin" "$(PANO).new"; \
	echo "If you're running this within WSL writing to the .pbin directly is impossible. "; \
	echo "A .pbin.new file was created in the game directory, you must rename it manually outside of this shell "; \

reverse: 
	cp "$(PANO+".bak")" "$(PANO)"

clean:
	rm -r ./airgap/
	mkdir airgap