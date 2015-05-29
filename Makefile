clean:
	rm -rf build dist *.egg-info __pycache__ *.pyc

test:
	cd tests && ./test.sh
