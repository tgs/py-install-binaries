#!/bin/bash
set -ex


function test_binaries() {
	test -x env/bin/my_program
}

function clean_stuff() {
	rm -rf *.egg-info *.egg dist build
	rm -rf env
}

for PY in 2.7 3.3 3.4; do
	clean_stuff
	virtualenv -p python$PY env
	set +x
	source env/bin/activate
	set -x
	python --version 2>&1 | grep $PY
	pip install pip==1.3.1 wheel
	pip install -e ..

	python setup.py sdist
	pip install dist/*

	test_binaries

	echo 'This should fail...'
	if python broken_setup.py install; then
		echo 'Should have failed, but did not!'
		exit 1
	fi

	python setup.py --dry-run install_binaries

	deactivate
done

clean_stuff

echo
echo "All tests passed"
echo
