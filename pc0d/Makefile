dev:
	./pccomment.bash <eh.pc >/tmp/eh.pcx1
	./pcignoresignature.bash </tmp/eh.pcx1 >/tmp/eh.pcx2
	./prep/prep '.' '$$' pcid.ohm pcid.fmt </tmp/eh.pcx2 >/tmp/eh.pcx3
	cat /tmp/eh.pcx3

setup:
	multigit -r
