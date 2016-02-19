PROVE_OPTS=--color --jobs 2

help::
	@echo ""
	@echo "make "
	@echo "    check "
	@echo "    test"
	@echo ""

check::
	@perl -c script/resorts.pl

test::
	@RESORT_DB=db/resorts.db prove -Ilib -r t/
