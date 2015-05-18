clean:
	rm -rf build dist *.egg-info __pycache__

test:
	cd tests && ./test.sh
